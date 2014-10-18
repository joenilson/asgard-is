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
use IMS\Model\Entity\ProcessThread;

class ProcessThreadTable extends AbstractTableGateway {

    protected $table_name = 'process_thread';
    protected $schema_name = 'ims';
    protected $table_i18n = 'process_thread_i18n';
    protected $table_relations = 'process_relations';
    protected $empty_value = '0000';
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
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
            $select->order('ordering ASC');
        });
        return $resultSet->toArray();
    }

    public function getSubProcessValue($id_subprocess)
    {
        $row = $this->select(array('id'=>(int) $id_subprocess));
        if (!$row)
            return false;
        return $row;
    }
   
    
    public function getAllThreads($lang,$assigned,$companies,$countries,$locations) {
        
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $typeJoin = ($assigned==='U')?'left':'';
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$typeJoin) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->join(
                array('pr'=>new TableIdentifier($this->table_relations, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id = pr.id AND pr.type=\'s\' and pr.company IN (\''.$companies.'\')  and pr.country IN (\''.$countries.'\') and pr.location IN (\''.$locations.'\')'), 
                array('type', 'parent_id', 'company', 'country', 'location'),$typeJoin
            );
            $select->where(array('lang' => (string) $lang, $this->table_name.'.status'=>'A'));
            $select->order('ordering ASC');
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
    
    public function getThreads($lang,$assigned,$companies,$countries,$locations,$process_id) {
        
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $parent_id = $this->processArray($process_id);
        $parentSql = ($assigned==='U')?null:$parent_id;
        $typeJoin = ($assigned==='U')?'left':'';
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$typeJoin,$parentSql) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->join(
                array('pr'=>new TableIdentifier($this->table_relations, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id = pr.id AND pr.type=\'s\' and pr.company IN (\''.$companies.'\')  and pr.country IN (\''.$countries.'\') and pr.location IN (\''.$locations.'\')'), 
                array('type', 'parent_id', 'company', 'country', 'location'),$typeJoin
            );
            $select->where(array('lang' => (string) $lang,  $this->table_name.'.status'=>'A','parent_id'=>$parentSql));
            $select->order('ordering ASC');
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
    
    public function getThreadInfo($lang,$thread_id) {
        
        $thread_id = $this->processArray($thread_id);
        $row = $this->select(function (Select $select) use ($lang,$thread_id) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->where(array('lang' => (string) $lang,  $this->table_name.'.status'=>'A','process_thread.id'=>$thread_id));
            $select->order('ordering ASC');
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
    
    
    public function getSubProcessListByParent($lang,$parent_id) {
        $row = $this->select(function (Select $select) use ($lang,$parent_id) {
            $select->where(array('lang' => (string) $lang,'parent_id'=>$parent_id, 'status'=>'A'))->order('ordering ASC');
        });
        //$row = $this->select(array('lang' => (string) $lang));
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    
    public function save(ProcessThread $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'value' => $object->getValue(),
            'description' => $object->getDescription(),
            'ordering' => $object->getOrdering(),
            'status' => $object->getStatus(),
            'type'=> $object->getType(),
            'parent_id'=> $object->getParent_id(),
            'assignment'=> $object->getAssignment()
        );

        $id = (int) $object->getId();
        $lang = (string) $object->getLang();
        
        if (!$this->getProcessValue($id,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getProcessValue($id,$lang)) {
            $this->update(
                $data,
                array(
                    'id_incident' => $id, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateProcessMain($id,$lang,$data)
    {
        $id = (int) $id;
        $lang = (string) $lang;
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
    
    public function updateProcessThreadI18n($id,$lang,$field,$value)
    {
        $idThread = (int) $id;
        $langThread = (string) $lang;
        $fieldThread = (string) $field;
        $this->table = new TableIdentifier($this->table_i18n, $this->schema_name);
        return $this->update(array($fieldThread=>$value), array('id' => $idThread, 'lang' => $langThread));
    }
}
?>
