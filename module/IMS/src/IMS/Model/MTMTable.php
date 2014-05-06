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
use IMS\Model\Entity\MTM;

class MTMTable extends AbstractTableGateway {

    protected $table_name = 'mtm';
    protected $type_table_name = 'mtm_types';
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
    
    public function getObjectByCCLY($company,$country,$location,$year)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$year){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'year_date'=>(string) $year,
                                'status'=>'A'));
            $select->order('date_creation DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLYByLang($company,$country,$location,$year,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$year,$lang){
            $select->join(
                array('h1'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'year_date'=>(string) $year,
                                $this->table_name.'.status'=>'A'));
            $select->order('id_type DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLByTL($company,$country,$location,$type,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$type,$lang){
            $select->join(
                array('h1'=>new TableIdentifier($this->type_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'id_type'=>(int) $type,
                                $this->table_name.'.status'=>'A'));
            $select->order('id_type DESC');
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
    
    public function getObjectByCCLIT($company,$country,$location,$id,$type)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$type){
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
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row->id;
        $id++;
        return $id;
    }
   
    public function save(MTM $object)
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
