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
    protected $nc_table_name = 'hira_nc_type';
    protected $pm_table_name = 'process_main_i18n';
    protected $pt_table_name = 'process_thread_i18n';
    //protected $nc_table_name = 'process_owner_i18n';
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
    
    public function getIncidentClose($company,$country,$location,$id) {
        $resultSet = $this->select(function (Select $select) use ($company,$country,$location,$id){
            $select->columns(array('incident_desc'=>'description','close_description'=>'description_close','date_close'));
            $select->where(array('company'=>$company,'country'=>$country,'location'=>$location,'id_incident'=>$id));
        });
        return $resultSet->toArray();
    }

    public function getIncidentValidity($company,$country,$location,$id) {
        $resultSet = $this->select(function (Select $select) use ($company,$country,$location,$id){
            $select->columns(array('incident_desc'=>'description','validity_description'=>'description_validity','date_validity'));
            $select->where(array('company'=>$company,'country'=>$country,'location'=>$location,'id_incident'=>$id));
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
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$year-$month-%' and general_status!=0")));
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
    
    public function getIncidentsDetails($company,$country,$location,$datePass,$lang)
    {
        $var_companies = $this->processList($company);
        $var_countries = $this->processList($country);
        $var_locations = $this->processList($location);
        $valDate = explode('-',$datePass);
        $dateValue = (count($valDate)<3)?$valDate[0]."-".$valDate[1]."-":$datePass;
        $resultSet = $this->select(function (Select $select) use ($var_companies, $var_countries, $var_locations, $dateValue, $lang) {
            $select->join(
                    array('ht'=>new TableIdentifier($this->ht_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_type::INT = ht.id_incident and ht.lang =\''.$lang.'\''), array('val_incident'),'left'
                    );
            $select->join(
                    array('nc'=>new TableIdentifier($this->nc_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.nonconformity_type = nc.id and nc.lang =\''.$lang.'\''), array('nonconformity_type_desc'=>'description')
                    );
            $select->join(
                    array('pm'=>new TableIdentifier($this->pm_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.incident_process = pm.id and pm.lang =\''.$lang.'\''), array('incident_process_desc'=>'value'),'left'
                    );
            $select->join(
                    array('pt'=>new TableIdentifier($this->pt_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.incident_thread = pt.id and pt.lang =\''.$lang.'\''), array('incident_thread_desc'=>'value'),'left'
                    );
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$dateValue%' and general_status!=0")));
            $select->order($this->table_name.'.id_incident DESC');
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