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
use IMS\Model\Entity\IEEAHelper;

class IEEAHelperTable extends AbstractTableGateway {

    protected $table_name = 'ieea_helper';
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
            $select->order(array('helper','id'));
        });
        return $resultSet->toArray();
    }
    
    public function getHelpers($lang)
    {
        $row = $this->select(function (Select $select) use ($lang){
            $select->where(array('lang'=>(string) $lang,
                                'status'=>(string) 'A'));
            $select->order(array('helper','id ASC'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperByIdLang($type,$id,$lang)
    {
        $row = $this->select(function (Select $select) use ($type,$id,$lang){
            $select->where(array('lang'=>(string) $lang,
                                'helper'=>(int) $type,
                                'id'=>(int) $id,
                                'status'=>(string) 'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperById($type,$id)
    {
        $row = $this->select(function (Select $select) use ($type,$id){
            $select->where(array('helper'=>(int) $type,
                                'id'=>(int) $id,
                                'status'=>(string) 'A'));
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
   
    public function save(IEEAHelper $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'helper' => $object->getHelper(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'ordering' => $object->getOrdering(),
        );
        
        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getHelperById($id)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getHelperById($id)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object IEEA Helper does not exist');
        }
    }

    public function updateIEEA($company,$country,$location,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id));
    }
}
