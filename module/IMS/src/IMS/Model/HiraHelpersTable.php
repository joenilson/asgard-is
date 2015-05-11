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
use IMS\Model\Entity\HiraHelpers;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;

class HiraHelpersTable extends AbstractTableGateway 
    implements AdapterAwareInterface 
{

    protected $table_name = 'hira_helpers';
    protected $schema_name = 'ims';
    protected $empty_value = '0000';
    
    
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
            $select->order('helper,id,id_type ASC');
        });
        return $resultSet->toArray();
    }

    public function getHelpersByType($lang,$helper)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper) {
            $select->columns(array('helper','id','id_type','lang','description','description_danger','description_risk','description_consequence'));
            $select->where(array('status'=>'A','lang'=>$lang, 'helper'=>$helper));
            $select->order(array('helper','id','id_type'));
            //echo $select->getSqlString();
        });
        
        if (!$rows)
            return false;
        
        $listItems=array();
        for ($index = 0; $index < $rows->count(); $index++) {
            $data = $rows->current();
            $listItems[$data['id']]['description_danger']=$data['description_danger'];
            $listItems[$data['id']]['description_risk']=$data['description_risk'];
            $listItems[$data['id']]['description_consequence']=$data['description_consequence'];
            $rows->next();
        }
        return $listItems;
    }
    
    public function getHelpersByTypeId($lang,$helper,$id)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper,$id) {
            $select->columns(array('helper','id','id_type','lang','description','description_danger','description_risk','description_consequence'));
            $select->where(array('status'=>'A','lang'=>$lang, 'helper'=>$helper,'id'=>$id));
            $select->order(array('helper','id','id_type'));
        });
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getHelpersByTypeInnerId($lang,$helper,$id,$innerid)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper,$id,$innerid) {
            $select->columns(array('helper','id','id_type','lang','description','description_danger','description_risk','description_consequence'));
            $select->where(array('status'=>'A','lang'=>$lang, 'helper'=>$helper, 'id'=>$id, 'id_type'=>$innerid));
            $select->order(array('helper','id','id_type'));
        });
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getHelpers($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->columns(array('helper','id','id_type','lang','description','description_danger','description_risk','description_consequence'));
            $select->where(array('status'=>'A','lang'=>$lang));
            $select->order(array('helper','id','id_type'));
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(HiraHelpers $object)
    {
        $data = array(
            'helper' => $object->geHelper(),
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'id_type' => $object->getId_type(),
            'lang'=>$object->getLang(),
            'description' => $object->getDescription(),
            'description_danger' => $object->getDescription(),
            'description_risk' => $object->getDescription(),
            'description_consequence' => $object->getDescription(),
            'status' => $object->getStatus(),
            'date_creation'=> $object->getDate_creation(),
            'user_id'=> $object->getUser_id()
        );
        $helper = $object->getHelper();
        $id = $object->getId();
        $innerid = (int) $object->getId_type();
        $lang = (string) $object->getLang();
        
        if (!$this->getHelpersByTypeInnerId($lang,$helper,$id,$innerid)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getHelpersByTypeInnerId($lang,$helper,$id,$innerid)) {
            $this->update(
                $data,
                array(
                    'helper' => $id, 
                    'lang' => $lang,
                    'id' => $id,
                    'id_type' => $innerid
                )
            );
            return true;
        } else {
            throw new \Exception('helper or lang or id  or id_type in object hira_helpers does not exist');
        }
    }

    public function updateHiraHelpers($helper,$id,$innerid,$lang,$data)
    {
        $id = (string) $id;
        $innerid = (int) $innerid;
        $lang = (string) $lang;
        $helper = (string) $helper;
        $this->update($data, array('helper'=>$helper, 'id' => $id, 'id_type'=> $innerid, 'lang' => $lang));
    }
}
