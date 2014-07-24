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
use IMS\Model\Entity\AuditType;

class AuditTypeTable extends AbstractTableGateway {

    protected $table_name = 'audit_type';
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
    
    public function getAuditTypeByLang($lang)
    {
        $row = $this->select(function (Select $select) use ($lang){
            $select->where(array('lang'=>(string) $lang));
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
    
    public function getAuditTypeByLangId($lang,$id)
    {
        $row = $this->select(array('lang'=>(string) $lang,
                                'id' => (int) $id));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function save(AuditType $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'user_id' => $object->getUser_id(),
            'date_creation' => $object->getDate_creation(),
            'user_mod' => $object->getUser_mod(),
            'date_modification' => $object->getDate_modification()
        );
        
        $lang = (string) $object->getLang();
        $id = (int) $object->getId();
       
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getAuditTypeByLangId($lang,$id)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getAuditTypeByLangIdByCCLYId($lang,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_mod'] = $data['user_id'];
            $this->update( $data, 
                    array('lang'=>$lang,'id' => $id) );
            return true;
        } else {
            throw new \Exception('lang or id in object AuditType does not exist');
        }
    }

    public function updateAuditType($lang,$id,$data)
    {
        $lang = (string) $lang;
        $id = (int) $id;
        $this->update($data, array('lang'=> $lang,'id' => $id));
    }
}
