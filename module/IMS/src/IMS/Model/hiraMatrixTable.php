<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraMatrix;

class hiraMatrixTable extends AbstractTableGateway {

    protected $table_name = 'hira_matrix';
    protected $schema_name = 'ims';
    protected $empty_value = '0000';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('risk ASC');
        });
        return $resultSet->toArray();
    }

    public function getMatrix($country,$company,$location) {
        $row = $this->select(
                array(
                    'country' => array((string) $country, $this->empty_value),
                    'company' => array((string) $company, $this->empty_value), 
                    'location' => array((string) $location, $this->empty_value) 
            ));
        if (!$row)
            return false;
        $itemMatrix = new hiraMatrix;
        $resultMatrix = array();
        
        for ($i = 0; $i < $row->count(); $i++) {
            $resultMatrix[] = $row->current();
            /*
            $itemMatrix->setCompany($dataMatrix->company)
                    ->setCountry($dataMatrix->country)
                    ->setLocation($dataMatrix->location)
                    ->setId_frequency($dataMatrix->id_frequency)
                    ->setId_severity($dataMatrix->id_severity)
                    ->setRisk($dataMatrix->risk);
            $resultMatrix[]=$itemMatrix;
            */
            $row->next();
            
        }
        return $resultMatrix;
    }

    public function getSeverityList($lang) {
        
        $row = $this->select(array('lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
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