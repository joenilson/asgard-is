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
use IMS\Model\Entity\hiraIncidentDetails;

class hiraIncidentDetailsTable extends AbstractTableGateway {

    protected $table_name = 'hira_incidents_details';
    protected $ct_table_name = 'hira_incidents_causes_type';
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
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getIncidentDetails($company,$country,$location,$id_incident,$lang)
    {
        $var_companies = $this->processList($company);
        $var_countries = $this->processList($country);
        $var_locations = $this->processList($location);
        $id_incident = (int) $id_incident;
        $resultSet = $this->select(function (Select $select) use ($var_companies, $var_countries, $var_locations, $id_incident,$lang) {
            $select->join(
                    array('ct'=>new TableIdentifier($this->ct_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_cause = ct.id and ct.lang =\''.$lang.'\''), array('cause_desc'=>'description')
                    );
            $select->where(array('company'=>$var_companies,'country'=>$var_countries,'location'=>$var_locations,new Expression("status!=0")));
            $select->order('id_cause ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getIncidentDetailCauseLang($id_incident,$id_cause,$lang)
    {
        $row = $this->select(function (Select $select) use ($id_incident,$id_cause,$lang){
            $select->join(
                    array('ct'=>new TableIdentifier($this->ct_table_name, $this->schema_name)),
                        new Expression($this->table_name.'.id_cause = ct.id and ct.lang =\''.$lang.'\''), array('cause_desc'=>'description')
                    );
            $select->where(array('id'=>(int) $id_incident,'id_cause'=> (int) $id_cause));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getIncidentDetailCause($id_incident,$id_cause)
    {
        $row = $this->select(function (Select $select) use ($id_incident,$id_cause){
            $select->where(array('id'=>(int) $id_incident,'id_cause'=> (int) $id_cause));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
 
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id_incident')));
        });
        $row = $resultSet->current();
        $id = $row->id_incident;
        $id++;
        return $id;
    }
    
    public function save(hiraIncidentDetails $object)
    {
        $data = array(
            'status' => $object->getStatus(),
            'id' => $object->getId(),
            'id_cause' => $object->getId_cause(),
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'description_cause' => $object->getDescription_cause(),
            'description_ia' => $object->getDescription_ia(),
            'description_ca' => $object->getDescription_ca(),
            'fullname_employee' => $object->getFullname_employee(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation()
        );
        
        $id_incident = (int) $object->getId();
        $id_cause = (string) $object->getId_cause();
        $user_id = (int) $object->getUser_id();
        if (!$this->getIncidentDetailCause($id_incident,$id_cause)) {
            //$id_incident = $this->getNextId();
            //$data['id'] = $id_incident;
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return $id_incident;
        } elseif ($this->getIncidentDetailCause($id_incident,$id_cause)) {
            $data['user_modification'] = $user_id;
            $data['date_modification'] = \date('Y-m-d H:i:s');
            $this->update($data, array('id' => $id_incident,'id_cause'=>$id_cause));
            return $id_incident;
        } else {
            throw new \Exception('id ord id_cause in object hiraIncidentDetails does not exist or is wrong format');
        }
    }

}