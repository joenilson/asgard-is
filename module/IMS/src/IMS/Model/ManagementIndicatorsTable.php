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
use IMS\Model\Entity\ManagementIndicators;

class ManagementIndicatorsTable extends AbstractTableGateway {

    protected $table_name = 'management_indicators';
    protected $ht_table_name = 'docs_helpers';
    protected $schema_name = 'ims';

    private function processList($value)
    {
        if(is_array($value)){
            $var_values = "";
            $counterValues = 0;
            foreach ($value as $val)
            {
                $separator = (count($value)==$counterValues)?"":",";
                $var_values+="{$val}".$separator;
            }
        }else{
            $var_values = $value;
        }
        return $var_values;
    }
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id_incident ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getIndicatorsByLang($lang)
    {
        $row = $this->select(array('lang' => (string) $lang))->order(array('id'));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getIndicatorsById($id,$lang)
    {
        $row = $this->select(array('id'=>(int) $id,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getIndicatorsByProcess($id_process,$lang)
    {
        $row = $this->select(array('id_process_main'=>(int) $id_process,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getIndicatorsByThread($id_thread,$lang)
    {
        $row = $this->select(array('id_process_main'=>(int) $id_thread,'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row->toArray();
    }
   
    public function save(ManagementIndicators $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'description' => $object->getDescription(),
            'management_value' => $object->getManagement_value(),
            'management_register' => $object->getManagement_register(),
            'frequency_management' => $object->getFrequency_management(),
            'frecuency_indicator' => $object->getFrequency_indicator(),
            'formula'=> $object->getFormula(),
            'id_process_main' => $object->getId_process_main(),
            'id_process_thread' => $object->getId_process_thread(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation()
        );

        $id = (int) $object->getId();
        $lang = (string) $object->getLang();
        
        if (!$this->getIndicatorsById($id,$lang)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getIndicatorsById($id,$lang)) {
            $this->update( $data, array('id' => $id, 'lang' => $lang) );
            return true;
        } else {
            throw new \Exception('id or lang in object ManagementIndicators does not exist');
        }
    }

    public function updateManagementIndicators($id,$lang,$data)
    {
        $id = (int) $id;
        $lang = (string) $lang;
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
}
