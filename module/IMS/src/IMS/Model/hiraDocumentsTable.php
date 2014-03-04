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
use Zend\Db\Sql\Predicate\Like;
use Zend\Db\Sql\Predicate\IsNotNull;
use IMS\Model\Entity\hiraDocuments;

class hiraDocumentsTable extends AbstractTableGateway {

    protected $py_table_name = 'process_type';
    protected $pr_table_name = 'process_relations';
    protected $pyi_table_name = 'process_type_i18n';
    protected $pmi_table_name = 'process_main_i18n';
    protected $pti_table_name = 'process_thread_i18n';
    
    protected $hr_table_name = 'hira_risk';
    protected $hd_table_name = 'hira_danger';
    
    protected $table_name = 'hira_documents';
    protected $schema_name = 'ims';

    private function countriesList($country)
    {
        if(is_array($country)){
            $var_countries = "";
            $counterCountries = 0;
            foreach ($country as $value)
            {
                $separator = (count($country)==$counterCountries)?"":",";
                $var_countries+="{$value}".$separator;
            }
        }else{
            $var_countries = $country;
        }
        return $var_countries;
    }
    
    private function locationsList($location)
    {
        if(is_array($location)){
            $var_locations = "";
            $counterLocations = 0;
            foreach ($location as $value)
            {
                $separator = (count($location)==$counterLocations)?"":",";
                $var_locations+="{$value}".$separator;
            }
        }else{
            $var_locations = $location;
        }
        
        return $var_locations;
    }
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('date_creation ASC');
        });
        return $resultSet->toArray();
    }
    
    public function fetchAllView($lang,$country) {
        $row = $this->select(function (Select $select) use ($lang,$country){
            //$select->columns(array('id','ordering','status'));
            $select->join( array('pr'=>new TableIdentifier($this->pr_table_name, $this->schema_name)),
                new Expression(
                    $this->table_name.'.id_process_main = pr.id and type=\'s\' and pr.country=\''.$country.'\''), array('parent_id')
                    );
            $select->join(
                array('pti'=>new TableIdentifier($this->pti_table_name, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id_process_main = pti.id AND pr.type=\'s\' and pti.lang=\''.$lang.'\''), array('process_main_desc'=>'value')
            );
            $select->join(
                    array('p2'=>new TableIdentifier($this->pr_table_name, $this->schema_name)),
                        new Expression('pr.parent_id = p2.id and p2.type=\'p\' and pr.country = p2.country '), array('type'=>'parent_id')
                    );
            $select->join(
                    array('pti2'=>new TableIdentifier($this->pmi_table_name, $this->schema_name)),
                        new Expression('p2.id = pti2.id and pti2.lang=\''.$lang.'\''), array('process_sup_desc'=>'value')
                    );
            $select->join(
                    array('pti3'=>new TableIdentifier($this->pyi_table_name, $this->schema_name)),
                        new Expression('p2.parent_id = pti3.id and pti3.lang=\''.$lang.'\''), array('type_desc'=>'value')
                    );
            $select->join(
                    array('hr'=>new TableIdentifier($this->hr_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_risk = hr.id_risk and hr.lang=\''.$lang.'\''), array('desc_risk')
                    );
            $select->join(
                    array('hd'=>new TableIdentifier($this->hd_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_danger = hd.id_danger and hd.lang=\''.$lang.'\''), array('desc_danger')
                    );
            //$select->where(array('lang' => (string) $lang, 'status'=>'A'));
            $select->where(array(new IsNotNull('control_measures')));
            $select->order('id_danger_risk ASC');
            //echo $select->getSqlString();
        });
        return $row->toArray();
    }

    public function fetchThreadDocuments($lang,$country,$company,$location,$thread_id) {
        $row = $this->select(function (Select $select) use ($lang,$country,$company,$location,$thread_id){
            $select->join(
                    array('hr'=>new TableIdentifier($this->hr_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_risk = hr.id_risk and hr.lang=\''.$lang.'\''), array('desc_risk')
                    );
            $select->join(
                    array('hd'=>new TableIdentifier($this->hd_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_danger = hd.id_danger and hd.lang=\''.$lang.'\''), array('desc_danger')
                    );
            $select->where(array(new IsNotNull('control_measures'),'id_process_main'=>(int) $thread_id,'country'=>(string) $country,'company'=>(string) $company,'location'=>(string) $location));
            $select->order('id_danger_risk ASC');
            //echo $select->getSqlString();
        });
        return $row->toArray();
    }
    
    public function getIncidentsListFiltered($country,$location,$dateValue,$lang) 
    {
        $var_countries = $this->countriesList($country);
        $var_locations = $this->locationsList($location);
        
        $time=strtotime($dateValue);

        $month=date("m",$time);
        $year=date("Y",$time);
        
        $first = date('d-m-Y', mktime(0, 0, 0, $month, 1, $year));
        $last = date('t-m-Y', mktime(0, 0, 0, $month, 1, $year));

        $thisTime = strtotime($first);
        $endTime = strtotime($last);
        
        
        $resultSet = $this->select(function (Select $select) use ($var_countries, $var_locations, $year, $month) {
            $select->where(array('country'=>$var_countries,'location'=>$var_locations,new Expression("date_incident::TEXT like '$year-$month-%'")));
            $select->order('id_incident ASC');
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
    
    public function save(hiraDocuments $object)
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
