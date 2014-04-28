<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraRisk;

class hiraRiskTable extends AbstractTableGateway {

    protected $table_name = 'hira_risk';
    protected $schema_name = 'ims';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('desc_risk ASC');
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
    public function getRiskValue($ids,$lang) {
        $row = $this->select(array('id_risk' => (int) $ids,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getRiskList($lang) {
        
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
            $select->columns(array(new Expression('max(id_risk) as id_risk')));
        });
        $row = $resultSet->current();
        $id = $row->id_risk;
        $id++;
        return $id;
    }
    
    public function save(hiraRisk $object)
    {
        $data = array(
            'id_risk' => $object->getId_risk(),
            'lang' => $object->getLang(),
            'desc_risk' => $object->getDesc_risk(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation(),
            'date_modification' => $object->getDate_modification(),
            'user_modification' => $object->getUser_modification(),
            'status' => $object->getStatus()
        );
        
        $id_risk = (int) $object->getId_risk();
        $lang = (string) $object->getLang();
        if($id_risk == 0){
            $id = $this->getNextId();
        }
        if (!$this->getDangerValue($id_risk,$lang)) {
            $data['id_risk'] = $id;
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getRiskValue($id_risk,$lang)) {
            $this->update(
                $data,
                array(
                    'id_risk' => $id_risk, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_risk or lang in object Risk does not exist');
        }
    }

}