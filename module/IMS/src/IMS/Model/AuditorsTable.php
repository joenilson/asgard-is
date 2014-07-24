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
use IMS\Model\Entity\Auditors;

class AuditorsTable extends AbstractTableGateway {

    protected $table_name = 'auditors';
    protected $dh_table_name = 'docs_helpers';
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
            $select->order('country,company,location,id ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getAuditorsByCCLY($company,$country,$location,$year)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$year){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'year' =>(int) $year));
            $select->order('id ASC');
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
    
    public function getAuditorsByCCLYId($company,$country,$location,$year,$id)
    {
        $row = $this->select(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'year' =>(int) $year,
                                'id' => (int) $id));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function save(Auditors $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'auditor_name' => $object->getAuditor_name(),
            'auditor_dip' => $object->getAuditor_dip(),
            'year' => $object->getYear(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation(),
            'user_mod' => $object->getUser_mod(),
            'date_modification' => $object->getDate_modification()
        );
        
        $year = (string) $object->getYear();
        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getAuditorsByCCLYId($company,$country,$location,$year,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getAuditorsByCCLYId($company,$country,$location,$year,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_mod'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id, 'year' => $year) );
            return true;
        } else {
            throw new \Exception('company or country or location or id or year in object Auditors does not exist');
        }
    }

    public function updateAuditor($company,$country,$location,$year,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $year = (int) $year;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id, 'year' => $year));
    }
}
