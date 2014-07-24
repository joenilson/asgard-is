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
use IMS\Model\Entity\MTMType;

class MTMTypeTable extends AbstractTableGateway {

    protected $table_name = 'mtm_types';
    protected $schema_name = 'ims';

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

    public function getObjectValue($id,$lang)
    {
        $row = $this->select(array('id'=>(int) $id,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getObjectList($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->where(array('lang' => (string) $lang))->order('id ASC');
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
    
    public function save(MTMType $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'description' => $object->getDescription(),
            'ordering' => $object->getOrdering(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'date_modification' => $object->getDate_modification()
        );

        $id = (int) $object->getId();
        $lang = (string) $object->getLang();
        
        if (!$this->getObjectValue($id,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getObjectValue($id,$lang)) {
            $this->update(
                $data,
                array(
                    'id' => $id, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object MTM Types does not exist');
        }
    }

    public function updateMTMType($idi,$lang,$data)
    {
        $id = (int) $idi;
        $lang = (string) $lang;
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
}
?>
