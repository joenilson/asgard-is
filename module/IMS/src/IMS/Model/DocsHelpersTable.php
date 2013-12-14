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
use IMS\Model\Entity\DocsHelpers;

class DocsHelpersTable extends AbstractTableGateway {

    protected $table_name = 'docs_helpers';
    protected $schema_name = 'ims';
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
            $select->order('helper,id ASC');
        });
        return $resultSet->toArray();
    }

    public function getHelpersByType($lang,$helper)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper) {
            $select->columns(array('helper','id','lang','description','code'));
            $select->where(array('status'=>'A','lang'=>$lang, 'helper'=>$helper));
            $select->order(array('helper','id'));
        });
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getHelpers($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->columns(array('helper','id','lang','description','code'));
            $select->where(array('status'=>'A','lang'=>$lang));
            $select->order(array('helper','id'));
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
}
?>
