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
use IMS\Model\Entity\RequirementsHelper;

class RequirementsHelperTable extends AbstractTableGateway {

    protected $table_name = 'requirements_helper';
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
            $select->order(array('helper','id ASC'));
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
                                'helper'=>(string) $type,
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
            $select->where(array('helper'=>(string) $type,
                                'id'=>(int) $id,
                                'status'=>(string) 'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperByTL($type,$lang)
    {
        $row = $this->select(function (Select $select) use ($type,$lang){
            $select->where(array('helper'=>(string) $type,
                                'lang'=>(string) $lang,
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
   
    public function save(RequirementsHelper $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'helper' => $object->getHelper(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'user_creation' => $object->getUser_creation(),
            'date_creation' => $object->getDate_creation(),
            'user_modification' => $object->getUser_modification(),
            'date_modification' => $object->getDate_modification()
        );
        
        $id = (int) $object->getId();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
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
