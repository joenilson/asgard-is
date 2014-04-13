<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\hiraIncidents;

class hiraIncidentsTable extends AbstractTableGateway {

    protected $table_name = 'hira_incidents';
    protected $ht_table_name = 'hira_incidents_type';
    protected $schema_name = 'ims';

    private function processList($value)
    {
        if(is_array($value)){
            $var_values = "";
            $counterValues = 0;
            foreach ($value as $val)
            {
                $separator = (count($value)==$counterValues)?"":",";
                $var_values+="{$val}".$separator;
            }
        }else{
            $var_values = $value;
        }
        return $var_values;
    }
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id_incident ASC');
        });
        return $resultSet->toArray();
    }

    public function getIncidentsListResume($company,$country,$location,$dateValue) 
    {
        $var_companies = $this->processList($company);
        $var_countries = $this->processList($country);
        $var_locations = $this->processList($location);
        
        $time=strtotime($dateValue);

        $month=date("m",$time);
        $year=date("Y",$time);
        
        $first = date('d-m-Y', mktime(0, 0, 0, $month, 1, $year));
        $last = date('t-m-Y', mktime(0, 0, 0, $month, 1, $year));

        $thisTime = strtotime($first);
        $endTime = strtotime($last);
        
        $resultSet = $this->select(function (Select $select) use ($var_companies, $var_countries, $var_locations, $year, $month) {
            $select->columns(array('date_incident','id_type','count' => new Expression('COUNT(*)')));
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$year-$month-%'")));
            $select->group(array('date_incident','id_type'));
            $select->order(array('date_incident ASC','id_type ASC'));
        });
        $preList = $resultSet->toArray();
        $postList = array();
        $sumList = array();
        $dateList=array();
        $dateCount=array();
        $dateNumber=0;
        $actualDate='';
        foreach ($preList as $key=>$val){
            $date = \date('Y-m-d', strtotime($val['date_incident']));
            if(!isset($sumList[$date])){
                $sumList[$date]=0;
            }
            $sumList[$date] += $val['count'];
            if(($actualDate===$date) OR empty($actualDate)){
                $dateNumber=$dateNumber;
            }else{
                $dateNumber++;
            }
            $dateCount[$date]=$dateNumber;
            $actualDate=$date;
        }
        
        foreach ($preList as $key=>$value){
            $date = \date('Y-m-d', strtotime($value['date_incident']));
            $dateList[$date][$value['id_type']] = $value['count'];
        }
        
        foreach($dateCount as $dateVal=>$number){
            $postList[$number]=$dateList[$dateVal];
            $postList[$number]['date_incident']=$dateVal;
            $postList[$number]['summaryIncidents']=$sumList[$dateVal];
        }
        
        return $postList;
    }
    
    public function getIncidentsDetails($company,$country,$location,$dateValue,$lang)
    {
        $var_companies = $this->processList($company);
        $var_countries = $this->processList($country);
        $var_locations = $this->processList($location);
        
        $resultSet = $this->select(function (Select $select) use ($var_companies, $var_countries, $var_locations, $dateValue, $lang) {
            $select->join(
                    array('ht'=>new TableIdentifier($this->ht_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_type::INT = ht.id_incident and ht.lang =\''.$lang.'\''), array('val_incident')
                    );
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$dateValue%'")));
            $select->order('date_incident ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getIncidentValue($id_incident)
    {
        $row = $this->select(function (Select $select) use ($id_incident){
            $select->where(array('id_incident'=>(int) $id_incident));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
 
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id_incident) as id_incident')));
        });
        $row = $resultSet->current();
        $id = $row->id_incident;
        $id++;
        return $id;
    }
    
    public function save(hiraIncidents $object)
    {
        $data = array(
            'nonconformity_type' => $object->getNonconformity_type(),
            'status' => $object->getStatus(),
            'id_type' => $object->getId_type(),
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'description' => $object->getDescription(),
            'owner_fullname' => $object->getOwner_fullname(),
            'owner_email' => $object->getOwner_email(),
            'user_create' => $object->getUser_create(),
            'date_incident' => $object->getDate_incident(),
            'general_status' => $object->getGeneral_status(),
            'date_creation' => $object->getDate_creation(),
            'nonconformity_registry' => $object->getNonconformity_registry(),
            'incident_process' => $object->getIncident_process(),
            'incident_thread' => $object->getIncident_thread(),
            'incident_owner' => $object->getIncident_owner(),
            'user_id' => $object->getUser_id()
        );
        
        $id_incident = (int) $object->getId_incident();
        $user_id = (string) $object->getUser_id();
        
        if (!$this->getIncidentValue($id_incident)) {
            $id_incident = $this->getNextId();
            $data['id_incident'] = $id_incident;
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return $id_incident;
        } elseif ($this->getIncidentValue($id_incident)) {
            $data['user_modification'] = $user_id;
            $data['date_modification'] = date('Y-m-d H:i:s');
            $this->update($data, array('id_incident' => $id_incident));
            return $id_incident;
        } else {
            throw new \Exception('id_incident in object hiraIncident does not exist or is wrong format');
        }
    }

}