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
use IMS\Model\Entity\Audits;

class AuditsTable extends AbstractTableGateway {

    protected $table_name = 'audits';
    protected $at_table_name = 'audit_type';
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
            $select->order(array('audit_date DESC','country,company,location,id ASC'));
        });
        return $resultSet->toArray();
    }
    
    public function getAuditsByCCL($company,$country,$location,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$lang){
            $select->join(
                array('at'=>new TableIdentifier($this->at_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.audit_type = at.id AND at.lang=\''.$lang.'\''),
                array('desc_type'=>'description'));

            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                $this->table_name.'.status'=>'A'));
            $select->order('audit_date DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getAuditByCCLId($company,$country,$location,$id,$lang)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id,$lang){
            $select->join(
                array('at'=>new TableIdentifier($this->at_table_name, $this->schema_name)), 
                new Expression ( $this->table_name.'.audit_type = at.id AND at.lang=\''.$lang.'\''),
                array('desc_type'=>'description'));
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                $this->table_name.'.id'=>(int) $id));
            $select->order('audit_date DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }

    public function getAuditByCCLI($company,$country,$location,$id)
    {
        $row = $this->select(function (Select $select) use ($company,$country,$location,$id){
            $select->where(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'id'=>(int) $id));
            $select->order('audit_date DESC');
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
   
    public function save(Audits $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id' => $object->getId(),
            'audit_type' => $object->getAudit_type(),
            'audit_desc' => $object->getAudit_desc(),
            'audit_date' => $object->getAudit_date(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation(),
            'user_mod' => $object->getUser_mod(),
            'date_modification' => $object->getDate_modification()
        );
        
        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        $file = (string) $object->getAudit_file();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if(!empty($file)){
            $data['audit_file'] = $file;
        }
        
        if (!$this->getAuditByCCLI($company,$country,$location,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getAuditByCCLI($company,$country,$location,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_mod'] = $data['user_id'];
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object Audits does not exist');
        }
    }

    public function updateAudit($company,$country,$location,$id,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $id = (int) $id;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id));
    }

}
