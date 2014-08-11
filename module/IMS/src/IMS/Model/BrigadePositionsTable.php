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
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\BrigadePositions;

class BrigadePositionsTable extends AbstractTableGateway 
    implements AdapterAwareInterface {

    protected $table_name = 'brigade_positions';
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
    
    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        
        $this->initialize();
    }
    
//    public function __construct(Adapter $adapter) {
//        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
//        $this->adapter = $adapter;
//    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getPositionsByLang($lang)
    {
        $row = $this->select(function (Select $select) use ($lang){
            $select->where(array('lang'=>(string) $lang, 'status'=>'A'));
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
    
    public function getPositionByLangId($lang,$id)
    {
        $row = $this->select(array('lang'=>(string) $lang,
                                'id' => (int) $id));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function save(BrigadePositions $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'description' => $object->getDescription(),
            'ordering' => $object->getOrdering(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation(),
            'user_modification' => $object->getUser_modification(),
            'date_modification' => $object->getDate_modification()
        );
        
        $lang = (string) $object->getLang();
        $id = (int) $object->getId();
       
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getPositionByLangId($lang,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getPositionByLangId($lang,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('lang'=>$lang,'id' => $id) );
            return true;
        } else {
            throw new \Exception('lang or id in object Brigade Positions does not exist');
        }
    }

    public function updatePosition($lang,$id,$data)
    {
        $lang = (string) $lang;
        $id = (int) $id;
        $this->update($data, array('lang'=> $lang,'id' => $id));
    }
}
