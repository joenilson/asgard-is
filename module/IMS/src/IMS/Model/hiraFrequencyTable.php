<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraFrequency;

class hiraFrequencyTable extends AbstractTableGateway {

    protected $table_name = 'hira_frequency';
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
    public function getFrequencyValue($idf,$lang) {
        $row = $this->select(array('id_frequency' => (int) $idf,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getFrequencyList($lang) {
        
        $row = $this->select(array('lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }
    
    public function save(hiraFrequency $object)
    {
        $data = array(
            'id_frequency' => $object->getId_frequency(),
            'lang' => $object->getLang(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'ordering' => $object->getOrdering()
        );

        $id_frequency = (int) $object->id_frequency;
        $lang = (string) $object->lang;
        
        if (!$this->getFrequencyValue($id_frequency,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getFrequencyValue($id_frequency,$lang)) {
            $this->update(
                $data,
                array(
                    'id_frequency' => $id_frequency, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_frequency or lang in object hiraFrequency does not exist');
        }
    }

    public function updateHiraFrequency($idf,$lang,$data)
    {
        $id_frequency = (int) $idf;
        $lang = (string) $lang;
        $this->update($data, array('id_frequency' => $id_frequency, 'lang' => $lang));
    }
}