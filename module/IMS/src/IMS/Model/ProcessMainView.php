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
use IMS\Model\Entity\ProcessMain;

class ProcessMainView extends AbstractTableGateway {

    protected $table_name = 'process_main_view';
    protected $schema_name = 'ims';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('ordering ASC');
        });
        return $resultSet->toArray();
    }

    public function getProcessValue($id_process,$lang)
    {
        $row = $this->select(array('id'=>(int) $id_process,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getProcessList($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->where(array('lang' => (string) $lang))->order('ordering ASC');
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
    
    public function save(ProcessMain $object)
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
