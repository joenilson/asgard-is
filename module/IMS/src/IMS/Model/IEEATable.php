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
use IMS\Model\Entity\IEEA;

class IEEATable extends AbstractTableGateway {

    protected $table_name = 'ieea';
    protected $schema_name = 'ims';
    protected $table_helper = 'ieea_helper';
    protected $table_process = 'process_main_i18n';
    protected $table_thread = 'process_thread_i18n';
    protected $empty_value = '0000';
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    
    private function processArray($value) {
        if(is_array($value)){
            $value_processed = implode("','",$value);
        }else{
            $value_processed = $value;
        }
        return $value_processed;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }

    public function getIEEAByPT($lang,$companies,$countries,$locations,$process,$thread){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $thread_id = (int) $thread;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$thread_id) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.aspect_code = h1.aspect_code AND h1.helper=\'aspect_codes\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description','aspect_legal_requirement'=>'legal_requirement','description_impact')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), 
                array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), 
                array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id,'id_thread'=>$thread_id));
            $select->order(array('id_process','id_thread','aspect_code','id'));
            //echo $select->getSqlString();
        });
        
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getIEEAByPTOld($lang,$companies,$countries,$locations,$process,$thread){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $thread_id = (int) $thread;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$thread_id) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.aspect_code = h1.aspect_code AND h1.helper=\'aspect_codes\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description','aspect_legal_requirement'=>'legal_requirement','description_impact')
            );

            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), 
                array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), 
                array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id,'id_thread'=>$thread_id));
            $select->order(array('id_process','id_thread','aspect_code','id'));
            //echo $select->getSqlString();
        });
        
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getIEEAByP($lang,$companies,$countries,$locations,$process,$limit,$offset){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$limit,$offset) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.aspect_code = h1.aspect_code AND h1.helper=\'aspect_codes\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description','aspect_legal_requirement'=>'legal_requirement','description_impact')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), 
                array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), 
                array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id));
            $select->order(array('id_process','id_thread','aspect_code','id'));
            if($limit!=0){
                $select->limit($limit);
                $select->offset($offset);
            }
            //echo $select->getSqlString();
        });
        
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getIEEA($lang,$companies,$countries,$locations,$limit,$offset) {
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
       
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$limit,$offset) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.aspect_code = h1.aspect_code AND h1.helper=\'aspect_codes\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description','aspect_legal_requirement'=>'legal_requirement','description_impact')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations));
            $select->order(array('id_process','id_thread','id_type','id_cycle','id'));
            if($limit!=0){
                $select->limit($limit);
                $select->offset($offset);
            }

            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getIEEAById($id,$company,$country,$location) {
        
        $row = $this->select(function (Select $select) use ($id,$company,$country,$location) {
            $select->where(array('id' => (int) $id, 'company'=> (string) $company, 'country'=> (string) $company, 'location'=> (string) $location));
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
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
    
    public function save(IEEA $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'eval_date' => $object->getEval_time(),
            'eval_team' => $object->getEval_team(),
            'id_process' => $object->getId_process(),
            'id_thread' => $object->getId_thread(),
            'aspect_code' => $object->getAspect_code(),
            'normal_condition' => $object->getNormal_condition(),
            'abnormal_condition' => $object->getAbnormal_condition(),
            'emergency_condition' => $object->getEmergency_condition(),
            'magnitude' => $object->getMagnitude(),
            'severity' => $object->getSeverity(),
            'consequence' => $object->getConsequence(),
            'probability' => $object->getProbability(),
            'significance' => $object->getSignificance(),
            'significant' => $object->getSignicant(),
            'legal_requirement' => $object->getLegal_requirement(),
            'operational_control' => $object->getOperational_control(),
            'goal' => $object->getGoal(),
            'emergency_plan' => $object->getEmergency_plan(),
            'status' => $object->getStatus(),
        );

        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getIEEAById($id, $company, $country, $location)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getIEEAById($id, $company, $country, $location)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('company'=> $company, 'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object IEEA does not exist');
        }
    }

    public function updateIEEA($data,$id, $company, $country, $location)
    {
        $id = (int) $id;
        $this->update($data, array('id' => $id, 'company'=> $company, 'country'=> $country,'location'=>$location));
    }
}

