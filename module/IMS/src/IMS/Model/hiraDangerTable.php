<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraDanger;

class hiraDangerTable extends AbstractTableGateway {

    protected $table_name = 'hira_danger';
    protected $schema_name = 'ims';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('desc_danger ASC');
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
    public function getDangerValue($ids,$lang) {
        $row = $this->select(array('id_danger' => (int) $ids,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getDangerList($lang) {
        
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
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id_danger) as id_danger')));
        });
        $row = $resultSet->current();
        $id = $row->id_danger;
        $id++;
        return $id;
    }
    
    public function save(hiraDanger $object)
    {
        $data = array(
            'id_danger' => $object->getId_danger(),
            'lang' => $object->getLang(),
            'desc_danger' => $object->getDesc_danger(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation(),
            'date_modification' => $object->getDate_modification(),
            'user_modification' => $object->getUser_modification(),
            'status' => $object->getStatus()
        );
        
        $id_danger = (int) $object->getId_danger();
        $lang = (string) $object->getLang();
        if($id_danger == 0){
            $id = $this->getNextId();
        }
        if (!$this->getDangerValue($id_danger,$lang)) {
            $data['id_danger'] = $id;
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getDangerValue($id_danger,$lang)) {
            $this->update(
                $data,
                array(
                    'id_danger' => $id_danger, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_danger or lang in object Danger does not exist');
        }
    }

}