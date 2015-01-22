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
//use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\ProcessThreadOwner;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;

class ProcessThreadOwnerTable extends AbstractTableGateway 
    implements AdapterAwareInterface 
{

    protected $table_name = 'process_thread_owner';
    protected $table_owner_name = 'process_owner';
    protected $schema_name = 'ims';
    protected $empty_value = '0000';
    /*
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    */
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
            $select->order('id_owner,id ASC');
        });
        return $resultSet->toArray();
    }

    public function getOwnersByCCLId($company,$country,$location,$id)
    {
        $rows = $this->select(function (Select $select) use ($company,$country,$location,$id) {
            $select->columns(array('id_owner','id'));
            $select->where(array('company'=>$company, 'country'=>$country, 'location'=>$location,'id'=>$id));
        });
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getOwnerByCCLId($lang,$company,$country,$location,$id) {
        $row = $this->select(function (Select $select) use ($lang,$company,$country,$location,$id) {
            $select->columns(array('id','id_owner'));
            $select->join( array('po'=>new TableIdentifier($this->table_owner_name, $this->schema_name)),
                $this->table_name.'.id_owner = po.id', array('lang', 'name'));
            $select->where(array('lang' => (string) $lang,  'status'=>'A', 
                    'company'=>$company, 'country'=>$country, 'location'=>$location,$this->table_name.'.id'=>$id
                    ));
            //$select->order('ordering ASC');
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        
        return $row->toArray();
        
        /*
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
        */
    }
    
    public function save(ProcessThreadOwner $object)
    {
        $data = array(
            'type' => $object->getType(),
            'id' => $object->getId(),
            'date_creation' => $object->getDate_creation(),
            'user_id' => $object->getUser_id(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location'=> $object->getLocation(),
            'id_owner'=> $object->getId_owner()
        );
        
        $id = (int) $object->getId();
        $id_owner = (int) $object->getId_owner();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        if (!$this->getOwnersByCCLId($company,$country,$location,$id)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getOwnersByCCLId($company,$country,$location,$id)) {
            $this->update(
                $data,
                array('id' => $id, 'company'=>$company, 'country'=>$country, 'location'=>$location)
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateProcessThreadOwner($company,$country,$location,$id,$lang,$data,$user,$date)
    {
        $id = (int) $id;
        $lang = (string) $lang;
        
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
}
?>
