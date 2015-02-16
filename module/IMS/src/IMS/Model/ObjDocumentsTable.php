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
use IMS\Model\Entity\ObjDocuments;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;

class ObjDocumentsTable extends AbstractTableGateway
    implements AdapterAwareInterface 
{

    protected $table_name = 'documents';
    protected $schema_name = 'ims';

    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        
        $this->initialize();
    }
    
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
    /*
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    */
    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->where(array('status'=>'A'));
            $select->order(array('year','month','id'));
        });
        return $resultSet->toArray();
    }
    
    public function getObjectByCCL($company,$country,$location,$document,$year,$month,$process,$thread)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$document,$year,$month,$process,$thread){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'document'=>(string) $document,
                                'status'=>'A'));
            if(!empty($process)){
                $select->where(array('process'=>$process));
            }
            if(!empty($thread)){
                $select->where(array('thread'=>$thread));
            }
            if(!empty($year)){
                $select->where(array('year'=>$year));
            }
            if(!empty($month)){
                $select->where(array('month'=>$month));
            }
            $select->order('id ASC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLPId($company,$country,$location,$id,$document,$process)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$document,$process){
            $select->where(array(
                'company'=>(string) $company,
                'country'=>(string) $country,
                'location'=>(string) $location,
                'id'=>(int) $id,
                'document'=>(string) $document,
                'process'=>(string) $process));
            });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByCCLId($company,$country,$location,$id,$document)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$document){
            $select->where(array(
                'company'=>(string) $company,
                'country'=>(string) $country,
                'location'=>(string) $location,
                'id'=>(int) $id,
                'document'=>(string) $document));
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
        $id = $row['id'];
        $id++;
        return $id;
    }
   
    public function save(ObjDocuments $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'document' => $object->getDocument(),
            'process' => $object->getProcess(),
            'thread' => $object->getThread(),
            'year' => $object->getYear(),
            'month' => $object->getMonth(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
        );
        
        $id = (int) $object->getId();
        $document = (int) $object->getDocument();
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
        
        if (!$this->getObjectByCCLId($company,$country,$location,$id,$document)) {
            $data['date_creation']= $object->getDate_creation();
            $data['user_creation'] = $object->getUser_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getObjectByCCLId($company,$country,$location,$id,$document)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id,'document'=>$document) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object Objectives does not exist');
        }
    }

    public function updateObject($company,$country,$location,$id,$document,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id,'document'=>$document));
    }
}
