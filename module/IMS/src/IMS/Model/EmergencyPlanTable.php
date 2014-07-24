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
use IMS\Model\Entity\EmergencyPlan;

class EmergencyPlanTable extends AbstractTableGateway {

    protected $table_name = 'emergencyplan';
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
            $select->order(array('date_emergencyplan DESC'));
        });
        return $resultSet->toArray();
    }
    
    public function getEmergencyPlanByCCL($company,$country,$location)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'status'=>'A'));
            $select->order('date_creation DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getEmergencyPlanByCCLType($company,$country,$location,$type)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$type){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'type_doc'=>(string) $type,
                                'status'=>'A'));
            $select->order('date_creation DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getEmergencyPlanByCCLId($company,$country,$location,$id)
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
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row->id;
        $id++;
        return $id;
    }
   
    public function save(EmergencyPlan $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'type_doc' => $object->getType_doc(),
            'description' => $object->getDescription(),
            'date_emergencyplan' => $object->getDate_emergencyplan(),
            'status' => $object->getStatus(),
        );
        
        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        $file = (string) $object->getFilename();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if(!empty($file)){
            $data['filename'] = $file;
        }
        
        if (!$this->getEmergencyPlanByCCLId($company,$country,$location,$id)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getEmergencyPlanByCCLId($company,$country,$location,$id)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object Emergency Plan does not exist');
        }
    }

    public function updateEmergencyPlan($company,$country,$location,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id));
    }
}
