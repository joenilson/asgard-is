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
use IMS\Model\Entity\ISOPlan;

class ISOPlanTable extends AbstractTableGateway {

    protected $table_name = 'isoplan';
    protected $helpers_table_name = 'isoplan_helpers';
    protected $docshelpers_table_name = 'docs_helpers';
    protected $process_table_name = 'process_main_i18n';
    protected $owners_table_name = 'process_owner';
    protected $thread_table_name = 'process_thread_i18n';
    protected $docs_table_name = 'docs_library';
    protected $ieea_table_name = 'ieea_helper';
    protected $iper_table_name = 'hira_danger';
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
            //$select->order(array('class_req,type_req ASC','country,company,location,id ASC'));
        });
        return $resultSet->toArray();
    }
    
    public function getObjectByCCL($company,$country,$location)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location){
            $select->join(
                array('h1'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'value')
            );
            $select->join(
                array('po'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'status'=>'A'));
            $select->order(array('id_process','id_thread','id_indicator DESC'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLByLang($company,$country,$location,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$year,$lang){
            $select->join(
                array('h1'=>new TableIdentifier($this->docshelpers_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_frequency = h1.id AND h1.status=\'A\' AND h1.helper=\'frequency\' AND h1.lang=\''.$lang.'\''),
                array('desc_frequency'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->helpers_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_indicator = h2.id AND h2.status=\'A\' AND h2.helper=\'indicator\' AND h2.lang=\''.$lang.'\''),
                array('desc_indicator'=>'description')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->process_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''),
                array('desc_process'=>'value')
            );$select->join(
                array('pt'=>new TableIdentifier($this->thread_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''),
                array('desc_thread'=>'value')
            );
            $select->join(
                array('po'=>new TableIdentifier($this->owners_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_owner = po.id AND po.status=\'A\' AND po.lang=\''.$lang.'\''),
                array('desc_owner'=>'name')
            );
            $select->join(
                array('df'=>new TableIdentifier($this->docs_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_doc = df.doc_id AND df.doc_status_general=\'A\' AND df.lang=\''.$lang.'\''),
                array('filename'=>'doc_file'),'left'
            );
            $select->where(array(
                $this->table_name.'.company'=>(string) $company,
                $this->table_name.'.country'=>(string) $country,
                $this->table_name.'.location'=>(string) $location,
                $this->table_name.'.status'=>'A'));
            $select->order(array('id_process','id_thread','id_doc'));
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLId($company,$country,$location,$id)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'id'=>(int) $id));
            //$select->order('class_req,type_req ASC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
       
    public function getObjectByCCLIT($company,$country,$location,$id,$type,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$type,$lang){
            $select->join(
                array('h1'=>new TableIdentifier($this->docshelpers_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.helper AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description')
            );
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'id_type'=>(int) $type,
                                'id'=>(int) $id));
            //$select->order('class_req,type_req ASC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLPT($company,$country,$location,$id_process,$type,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id_process,$type,$lang){
            if($type=='quality_vars' OR $type=='record_file'){
                $select->join(
                    array('h1'=>new TableIdentifier($this->helpers_table_name, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_type = h1.helper AND '.$this->table_name.'.id_variable = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                    array('description')
                );
            }elseif($type=='ea'){
                $select->join(
                    array('h1'=>new TableIdentifier($this->ieea_table_name, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_type = h1.helper AND '.$this->table_name.'.id_variable = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                    array('description')
                );
            }elseif($type=='iper'){
                $select->join(
                    array('h1'=>new TableIdentifier($this->iper_table_name, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_variable = h1.id_danger AND h1.lang=\''.$lang.'\''),
                    array('description'=>'desc_danger')
                );
            }elseif($type=='owners' OR $type=='assoc'){
                $select->join(
                    array('h1'=>new TableIdentifier($this->owners_table_name, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_variable = h1.id AND h1.lang=\''.$lang.'\''),
                    array('description'=>'name')
                );
            }elseif($type=='doc'){
                $select->join(
                    array('h1'=>new TableIdentifier($this->docs_table_name, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_variable = h1.doc_id '),
                    array('description'=>'doc_desc')
                );
            }
            
            $select->join(
                array('h2'=>new TableIdentifier($this->thread_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = h2.id AND h2.lang=\''.$lang.'\''),
                array('desc_thread'=>'value')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->process_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = h3.id AND h3.lang=\''.$lang.'\''),
                array('desc_process'=>'value')
            );
            $dataSelect [$this->table_name.'.company'] = $company;
            $dataSelect [$this->table_name.'.country'] = $country;
            $dataSelect [$this->table_name.'.location'] = $location;
            $dataSelect ['id_type'] = $type;
            if($id_process!=0){
                $dataSelect[$this->table_name.'.id_process'] = $id_process;
            }
            $select->where($dataSelect);
            
            $select->order(array('id_process','id_thread','id_io'));
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getIEEAByCCLPT($company,$country,$location,$id_process,$type,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id_process,$type,$lang){
            $select->join(
                array('h1'=>new TableIdentifier($this->ieea_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.helper AND '.$this->table_name.'.id_variable = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->thread_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = h2.id AND h2.lang=\''.$lang.'\''),
                array('desc_thread'=>'value')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->process_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = h3.id AND h3.lang=\''.$lang.'\''),
                array('desc_process'=>'value')
            );
            $dataSelect ['company'] = $company;
            $dataSelect ['country'] = $country;
            $dataSelect ['location'] = $location;
            $dataSelect ['id_type'] = $type;
            if($id_process!=0){
                $dataSelect['id_process'] = $id_process;
            }
            $select->where($dataSelect);
            
            $select->order(array('id_process','id_thread','id_io'));
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
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
   
    public function save(ISOPlan $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'id_type' => $object->getId_type(),
            'year_date' => $object->getYear_date(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
        );
        
        $id = (int) $object->getId();
        $id_type = (int) $object->getId_type();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getObjectByCCLIT($company,$country,$location,$id,$id_type)) {
            $data['date_creation']= $object->getDate_creation();
            $data['user_creation'] = $object->getUser_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getObjectByCCLIT($company,$country,$location,$id,$id_type)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id, 'id_type'=> $id_type) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object Occupational Health Registry does not exist');
        }
    }

    public function updateObject($company,$country,$location,$id,$type,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $id_type = (int) $type;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id, 'id_type'=>$id_type));
    }
}
