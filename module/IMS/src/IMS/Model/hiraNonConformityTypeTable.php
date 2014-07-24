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
use IMS\Model\Entity\hiraNonConformityType;

class hiraNonConformityTypeTable extends AbstractTableGateway {

    protected $table_name = 'hira_nc_type';
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

    public function getNCValue($id,$lang)
    {
        $row = $this->select(array('id'=>(string) strtoupper($id),'lang' => (string) $lang));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getNCTypeList($lang) {
        $row = $this->select(function (Select $select) use ($lang) {
            $select->where(array('lang' => (string) $lang))->order('id ASC');
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(hiraNonConformityType $object)
    {
        $data = array(
            'id' => $object->getId(),
            'lang' => $object->getLang(),
            'description' => $object->getDescription(),
            'code' => $object->getCode(),
            'version' => $object->getVersion(),
            'status' => $object->getStatus(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation(),
            'date_modification' => $object->getDate_modification(),
            'user_modification' => $object->getUser_modification()
        );

        $id = (int) $object->id;
        $lang = (string) $object->lang;
        
        if (!$this->getNCValue($id,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getNCValue($id,$lang)) {
            $this->update(
                $data,
                array(
                    'id' => $id, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id or lang in object hiraNonConformityType does not exist');
        }
    }

    public function updateHiraNCType($idi,$lang,$data)
    {
        $id = (int) $idi;
        $lang = (string) $lang;
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
}
?>
