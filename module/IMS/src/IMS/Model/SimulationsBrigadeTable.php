<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\SimulationsBrigade;

class SimulationsBrigadeTable extends AbstractTableGateway 
    implements AdapterAwareInterface {

    protected $table_name = 'simulationsbrigade';
    protected $at_table_name = 'brigade_positions';
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
    
    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        
        $this->initialize();
    }
    /*
        public function __construct(Adapter $adapter) {
            $this->table = new TableIdentifier($this->table_name, $this->schema_name);
            $this->adapter = $adapter;
        }
        */
    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order(array('country,company,location,fullname ASC'));
        });
        return $resultSet->toArray();
    }
    
    public function getObjectByCCL($company,$country,$location,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$lang){
            $select->join(
                array('cp'=>new TableIdentifier($this->at_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_position = cp.id AND cp.lang=\''.$lang.'\''),
                array('description','ordering'));

            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                $this->table_name.'.status'=>'A'));
            $select->order('cp.ordering ASC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLId($company,$country,$location,$id,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$lang){
            $select->join(
                array('cp'=>new TableIdentifier($this->at_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_position = cp.id AND cp.lang=\''.$lang.'\''),
                array('description'));
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                $this->table_name.'.id'=>(int) $id,
                                $this->table_name.'.status'=>'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }

    public function getObjectByCCLI($company,$country,$location,$id)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'id'=>(int) $id,
                                $this->table_name.'.status'=>'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }

    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        
        $result = $resultSet->current();
        $newid = $result['id'];
        $newid++;
        return $newid;
    }
   
    public function save(SimulationsBrigade $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'fullname' => $object->getFullname(),
            'id_position' => $object->getId_position(),
            'email' => $object->getEmail(),
            'phone' => $object->getPhone(),
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
        $photo = (string) $object->getPhoto();
        $thumbnail = (string) $object->getThumbnail();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if(!empty($photo)){
            $data['photo'] = $photo;
            $data['thumbnail'] = $thumbnail;
        }
        
        if (!$this->getObjectByCCLI($company,$country,$location,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getObjectByCCLI($company,$country,$location,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object SimulationsBrigade does not exist');
        }
    }

    public function updateObject($company,$country,$location,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id));
    }

}
