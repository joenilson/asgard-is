<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace HCM\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use HCM\Model\Entity\EmployeesDependants;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;

class EmployeesDependantsTable extends AbstractTableGateway
    implements AdapterAwareInterface 
{

    protected $table_name = 'employees_dependants';
    protected $schema_name = 'hcm';
    
    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        $this->initialize();
    }
    
    private function processArray($value)
    {
        if(is_array($value)){
            $value_processed = implode("','",$value);
        }else{
            $value_processed = $value;
        }
        return $value_processed;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order(array('id ASC','id_dependant'));
        });
        return $resultSet->toArray();
    }
    
    public function getDependantsById($id) {
        $employee_id = (int) $id;
        $resultSet = $this->select(function (Select $select) use ($employee_id) {
            $select->where(array('id'=> (int) $employee_id, 'status' => 'A'));
        });
        $result = $resultSet->toArray();
        return $result;
    }
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id_dependant) AS id_dependant')));
        });
        $result = $resultSet->current();
        $newid = $result['id_dependant'];
        $newid++;
        return $newid;
    }
    
    public function save(EmployeesDependants $object)
    {
        $data = array(
            'id' => $object->getId(),
            'surname' => $object->getSurname(),
            'lastname' => $object->getLastname(),
            'firstname' => $object->getFirstname(),
            'birthday'=> $object->getBirthday(),
            'type' => $object->getType(),
            'gender' => $object->getGender(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation()
        );
        
        if($object->getId_dependant()===0){
            $data['id_dependant'] = $this->getNextId();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }else{
                return $data['id_dependant'];
            }
        }else{
            $data['user_modification'] = $object->getUser_modification();
            $data['date_modification'] = $object->getDate_modification();
            return $this->updateData($data,$object->getId(),$object->getId_dependant());
        }
        return true;
    }

    public function updateData($data,$employee_id, $dependant_id)
    {
        $id_employee = (int) $employee_id;
        $id_dependant = (int) $dependant_id;
        return $this->update($data, array('id' => $id_employee, 'id_dependant'=>$id_dependant ));
    }
}
