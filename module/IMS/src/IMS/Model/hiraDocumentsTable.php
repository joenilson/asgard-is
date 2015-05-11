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
    protected $pai_table_name = 'process_activity_i18n';
    
    protected $hh_table_name = 'hira_helpers';
    
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
    
    public function getHiraByProcess($lang,$country,$company,$location,$process_id){
        $process_main_id = (int) $process_id;
        $result = $this->select(function (Select $select) use ($lang,$country,$company,$location,$process_main_id){
            $select->join(
                array('pmi'=>new TableIdentifier($this->pmi_table_name, $this->schema_name)), 
                new Expression( $this->table_name.'.process_main_id = pmi.id AND pmi.lang=\''.$lang.'\''), array('process_main_desc'=>'value' )
            );
            $select->join(
                array('pti'=>new TableIdentifier($this->pti_table_name, $this->schema_name)), 
                new Expression( $this->table_name.'.process_thread_id = pti.id AND pti.lang=\''.$lang.'\''), array('process_thread_desc'=>'value' )
            );
            $select->join(
                array('hh'=>new TableIdentifier($this->hh_table_name, $this->schema_name)), 
                new Expression( $this->table_name.'.danger_code = hh.id AND hh.helper=\'dangers\' AND hh.lang=\''.$lang.'\''), array('description_danger','description_risk','description_consequence' )
            );
            $select->where(
                array( $this->table_name.'.country'=>(string) $country, 
                    $this->table_name.'.company'=>(string) $company,
                    $this->table_name.'.location'=>(string) $location,
                    $this->table_name.'.status'=>'A' )
            );
            if($process_main_id!=0){
                $select->where(array($this->table_name.'.process_main_id'=>(int) $process_main_id));
            }
        });
        return $result->toArray();
    }
    
    public function getHiraByThread($lang,$country,$company,$location,$thread_id){
        $process_thread_id = (int) $thread_id;
        $result = $this->select(function (Select $select) use ($lang,$country,$company,$location,$process_thread_id){
            $select->join(
                array('hh'=>new TableIdentifier($this->hh_table_name, $this->schema_name)), 
                new Expression( $this->table_name.'.danger_code = hh.id AND hh.helper=\'dangers\' AND hh.lang=\''.$lang.'\''), array('description_danger','description_risk','description_consequence' )
            );
            $select->where(
                array( $this->table_name.'.country'=>(string) $country, 
                    $this->table_name.'.company'=>(string) $company,
                    $this->table_name.'.location'=>(string) $location,
                    $this->table_name.'.process_thread_id'=>(int) $process_thread_id,
                    $this->table_name.'.status'=>'A' )
            );
        });
        return $result->toArray();
    }
    
    public function fetchAllView($lang,$country,$company,$location,$process_id) {
        
        $row = $this->select(function (Select $select) use ($lang,$country,$company,$location,$process_id){
            $sqlPRocess = ($process_id==0)?"":" and p2.id = $process_id ";
            //$select->columns(array('id','ordering','status'));
            $select->join( array('pr'=>new TableIdentifier($this->pr_table_name, $this->schema_name)),
                new Expression( 
                    $this->table_name.'.id_process_main = pr.id and type=\'s\' and pr.country=\''.$country.'\' and pr.company=\''.$company.'\' and pr.location=\''.$location.'\' '), array('parent_id')
                );
            $select->join(
                array('pti'=>new TableIdentifier($this->pti_table_name, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id_process_main = pti.id AND pr.type=\'s\' and pti.lang=\''.$lang.'\''), array('process_main_desc'=>'value')
                );
            $select->join(
                array('p2'=>new TableIdentifier($this->pr_table_name, $this->schema_name)),
                    new Expression('pr.parent_id = p2.id and p2.type=\'p\' and pr.country = p2.country and pr.location=p2.location '.$sqlPRocess), array('type'=>'parent_id')
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
                array('pai'=>new TableIdentifier($this->pai_table_name, $this->schema_name)),
                    new Expression($this->table_name.'.id_activity = pai.id and pai.lang=\''.$lang.'\''), array('activity_desc'=>'value')
                ,'left');
            $select->join(
                array('hr'=>new TableIdentifier($this->hr_table_name, $this->schema_name)),
                    new Expression($this->table_name.'.id_risk = hr.id_risk and hr.lang=\''.$lang.'\''), array('desc_risk')
                );
            $select->join(
                array('hd'=>new TableIdentifier($this->hd_table_name, $this->schema_name)),
                    new Expression($this->table_name.'.id_danger = hd.id_danger and hd.lang=\''.$lang.'\''), array('desc_danger')
                );
            $select->where(array(new IsNotNull('control_measures'),$this->table_name.'.country'=>(string) $country,$this->table_name.'.company'=>(string) $company,$this->table_name.'.location'=>(string) $location,$this->table_name.'.status'=>1));
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
            $select->join(
                array('pai'=>new TableIdentifier($this->pai_table_name, $this->schema_name)),
                    new Expression($this->table_name.'.id_activity = pai.id and pai.lang=\''.$lang.'\''), array('activity_desc'=>'value')
                ,'left');
            $select->where(array(new IsNotNull('control_measures'),'id_process_main'=>(int) $thread_id,'country'=>(string) $country,'company'=>(string) $company,'location'=>(string) $location, $this->table_name.'.status'=>1));
            $select->order('id_danger_risk ASC');
            //echo $select->getSqlString();
        });
        return $row->toArray();
    }
        
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row->id;
        $id++;
        return $id;
    }
    
    public function getHIRAItem($id)
    {
        $row = $this->select(array('id'=>(int) $id));
        if (!$row)
            return false;
        return $row->toArray();
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
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'process_main_id' => $object->getProcess_main_id(),
            'process_thread_id' => $object->getProcess_thread_id(),
            'activity' => $object->getActivity(),
            'danger_code' => $object->getDanger_code(),
            'danger_frequency' => $object->getDanger_frequency(),
            'danger_severity' => $object->getDanger_severity(),
            'danger_fxs' => $object->getDanger_fxs(),
            'control_measures' => $object->getControl_measures(),
            'tracing' => $object->getTracing(),
            'measurement' => $object->getMeasurement(),
            'status' => $object->getStatus(),
        );

        $id = (int) $object->getId();
        if($id == 0) {
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getHIRAItem($id)) {
            $data['date_creation']=$object->getDate_creation();
            $data['user_creation']=$object->getUser_creation();
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return $id;
        } elseif ($this->getHIRAItem($id)) {
            $data['date_modification'] = $object->getDate_modification();
            $data['user_modification'] = $object->getUser_modification();
            $this->update( $data, array('id' => $id ) );
            return true;
        } else {
            throw new \Exception('id in object hiraDocuments does not exist');
        }
    }

    public function updateHiraDocuments($id,$data)
    {
        $id = (int) $id;
        if($id!=0){
            $this->update($data, array('id' => $id));
        }
    }
}
