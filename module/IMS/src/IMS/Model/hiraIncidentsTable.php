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
                        new Expression($this->table_name.'.id_type::INT = ht.id_incident and ht.lang=\''.$lang.'\''), array('val_incident')
                    );
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$dateValue%'")));
            $select->order('date_incident ASC');
            //echo $select->getSqlString();
        });
        return $resultSet->toArray();
        /*
        $queryResumen="SELECT * FROM view_incidents_list 
        WHERE in_idPais IN ($var_countries) AND in_idUbicacion IN ($var_locations) 
        and (DATEPART(yy, dt_FechaCreacion) = $year
         AND DATEPART(mm, dt_FechaCreacion) = $month ) ORDER BY dt_FechaCreacion ASC";
        //echo $queryResumen;
        $resultResumen = $this->getAdapter()->query($queryResumen,Adapter::QUERY_MODE_EXECUTE);
        
        $bulkIncidents = $resultResumen->toArray();
        
        $resumenIncidents = array();
        
        for ($idx=0; $idx < count($bulkIncidents); $idx++)
        {
            $resumenIncidents[$bulkIncidents[$idx]['dt_FechaCreacion']][$bulkIncidents[$idx]['in_IdTipoIncidente']]+=$bulkIncidents[$idx]['quantityIncidents'];
        }
        
        
        $listIncidents=array();
        $counterList=0; $counterDate=array();
        while($thisTime <= $endTime)
        {
            $thisDate = date('Y-m-d', $thisTime);
            $listIncidents[$counterList]['dt_fechaCreacion']=$thisDate;
            foreach($resumenIncidents[$thisDate] as $key=>$values){
                $listIncidents[$counterList][$key]=$values;
                $counterDate[$thisDate]+=$values;
            }
            //$listIncidents[$counterList]['summaryIncidents']=count($resumenIncidents[$thisDate]);
            $listIncidents[$counterList]['summaryIncidents']=$counterDate[$thisDate];
            $thisTime = strtotime('+1 day', $thisTime); // increment for loop
            $counterList++;
        }

        //var_dump($listIncidents);
        return $listIncidents;
        */
    }
    
    public function getIncidentValue($id_incident,$lang)
    {
        $row = $this->select(array('id_incident'=>(string) strtoupper($id_incident),'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getIncidentTypeList($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->where(array('lang' => (string) $lang))->order('id_incident ASC');
        });
        //$row = $this->select(array('lang' => (string) $lang));
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(hiraIncidents $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id_incident' => $object->getId_incident(),
            'val_incident' => $object->getVal_incident(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'date_modification' => $object->getDate_modification()
        );

        $id_incident = (int) $object->id_incident;
        $lang = (string) $object->lang;
        
        if (!$this->getIncidentValue($id_incident,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getIncidentValue($id_incident,$lang)) {
            $this->update(
                $data,
                array(
                    'id_incident' => $id_incident, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateHiraIncidentType($idi,$lang,$data)
    {
        $id_incident = (int) $idi;
        $lang = (string) $lang;
        $this->update($data, array('id_incident' => $id_incident, 'lang' => $lang));
    }
}
?>
