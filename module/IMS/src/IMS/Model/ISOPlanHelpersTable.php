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
use IMS\Model\Entity\ISOPlanHelpers;

class ISOPlanHelpersTable extends AbstractTableGateway {

    protected $table_name = 'isoplan_helpers';
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

    public function getObjectValue($helper,$id,$lang)
    {
        $row = $this->select(array('helper'=>$helper,'id'=>(int) $id,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getObjectList($lang,$helper) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->where(array('lang' => (string) $lang,'helper'=>$helper,'status'=>'A'))->order('id ASC');
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
    
    public function save(ISOPlanHelpers $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'helper' => $object->getHelper(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'date_modification' => $object->getDate_modification()
        );

        $id = (int) $object->getId();
        $lang = (string) $object->getLang();
        $helper = (string) $object->getHelper();
        
        if (!$this->getObjectValue($helper,$id,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getObjectValue($helper,$id,$lang)) {
            $this->update(
                $data,
                array(
                    'id' => $id, 
                    'lang' => $lang,
                    'helper' => $helper
                    )
            );
            return true;
        } else {
            throw new \Exception('id or lang or helper in object ISOPlan Helpers does not exist');
        }
    }

    public function updateMTMType($helper,$idi,$lang,$data)
    {
        $id = (int) $idi;
        $lang = (string) $lang;
        $helper = (string) $helper;
        $this->update($data, array('id' => $id, 'lang' => $lang,'helper'=>$helper));
    }
}
