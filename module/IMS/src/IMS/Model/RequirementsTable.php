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
use IMS\Model\Entity\Requirements;

class RequirementsTable extends AbstractTableGateway {

    protected $table_name = 'requirements';
    protected $helper_table_name = 'requirements_helper';
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
            $select->order(array('class_req,type_req ASC','country,company,location,id ASC'));
        });
        return $resultSet->toArray();
    }
    
    public function getRequirementByCCL($company,$country,$location,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$lang){
            $select->join( array('rh1'=>new TableIdentifier($this->helper_table_name, $this->schema_name)),
                new Expression( 
                    $this->table_name.'.class_req = rh1.id and rh1.helper=\'class\' and rh1.lang=\''.$lang.'\' '), array('desc_class'=>'description')
                    );
            $select->join( array('rh2'=>new TableIdentifier($this->helper_table_name, $this->schema_name)),
                new Expression( 
                    $this->table_name.'.type_req = rh2.id and rh2.helper=\'type\' and rh2.lang=\''.$lang.'\' '), array('desc_type'=>'description')
                    );
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                $this->table_name.'.status'=>'A'));
            $select->order('class_req, type_req ASC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getRequirementByCCLId($company,$country,$location,$id)
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

    public function getRequirementByCCLD($company,$country,$location,$date)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$date){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'status'=>'A',
                                new Expression ( 'valid_begin like \''.$date.'%\'')));
            $select->order('class_req,type_req ASC');
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
   
    public function save(Requirements $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'type_req' => $object->getType_req(),
            'class_req' => $object->getClass_req(),
            'description' => $object->getDescription(),
            'valid_begin' => $object->getValid_begin(),
            'valid_end' => $object->getValid_end(),
            'code_req' => $object->getCode_req(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation(),
            'user_modification' => $object->getUser_modification(),
            'date_modification' => $object->getDate_modification()
        );
        
        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        $file = (string) $object->getFile_req();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if(!empty($file)){
            $data['file_req'] = $file;
        }
        
        if (!$this->getRequirementByCCLId($company,$country,$location,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getRequirementByCCLId($company,$country,$location,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object Requirements does not exist');
        }
    }

    public function updateRequirement($company,$country,$location,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id));
    }
}
