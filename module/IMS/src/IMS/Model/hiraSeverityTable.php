<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraSeverity;

class hiraSeverityTable extends AbstractTableGateway {

    protected $table_name = 'hira_severity';
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

    /*
     * Gets one severity values using id and lang
     * 
     * @param {int} ids Id of the severity
     * @param {varchar(4)} lang Language id to get the corresponding description
     * @return {object} Returns the object asociated to it: 
     *                  id_severity, lang, description, status and order
     */
    public function getSeverityValue($ids,$lang) {
        $row = $this->select(array('id_severity' => (int) $ids,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getSeverityList($lang) {
        
        $row = $this->select(array('lang' => (string) $lang));
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(hiraSeverity $object)
    {
        $data = array(
            'id_severity' => $object->getId_severity(),
            'lang' => $object->getLang(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'ordering' => $object->getOrdering()
        );

        $id_severity = (int) $object->id_severity;
        $lang = (string) $object->lang;
        
        if (!$this->getSeverityValue($id_severity,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getSeverityValue($id_severity,$lang)) {
            $this->update(
                $data,
                array(
                    'id_severity' => $id_severity, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_module, or id_submodule or lang in object ContentText does not exist');
        }
    }

    public function updateHiraSeverity($ids,$lang,$data)
    {
        $id_severity = (int) $ids;
        $lang = (string) $lang;
        $this->update($data, array('id_severity' => $id_severity, 'lang' => $lang));
    }
}