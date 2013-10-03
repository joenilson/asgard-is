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
use IMS\Model\Entity\hiraIncidentType;

class hiraIncidentTypeTable extends AbstractTableGateway {

    protected $table_name = 'hira_incidents_type';
    protected $schema_name = 'ims';

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

    public function getIncidentValue($id_incident,$lang)
    {
        $row = $this->select(array('id_incident'=>(string) strtoupper($id_incident),'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getIncidentTypeList($lang) {
        
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
    
    public function save(hiraIncidentType $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id_incident' => $object->getId_incident(),
            'val_incident' => $object->getVal_incident(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'date_modification' => $object->getDate_modification()
        );

        $id_incident = (string) $object->id_incident;
        $lang = (string) $object->lang;
        
        if (!$this->getIncidentValue($id_incident,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getIncidentValue($id_incident,$lang)) {
            $this->update(
                $data,
                array(
                    'id_incident' => $id_incident, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateHiraIncidentType($idi,$lang,$data)
    {
        $id_incident = (string) $idi;
        $lang = (string) $lang;
        $this->update($data, array('id_incident' => $id_incident, 'lang' => $lang));
    }
}
?>
