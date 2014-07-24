<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\ContentText;

class ContentTextTable extends AbstractTableGateway {

    protected $table_name = 'content_text';
    protected $schema_name = 'ims';
    protected $empty_value = '0000';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id_module, id_submodule ASC');
        });
        return $resultSet->toArray();
    }

    public function getContent($mid,$smid,$lang) {
        $row = $this->select(array('id_module' => (int) $mid,'id_submodule' => (int) $smid,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getContentByCCL($mid,$smid,$lang,$country,$company,$location) {
        
        $row = $this->select(
            array(
                'id_module' => (int) $mid,
                'id_submodule' => (int) $smid,
                'lang' => (string) $lang,
                'country'=> array((string) $country, (string) $this->empty_value),
                'company'=> array((string) $company, (string) $this->empty_value),
                'location'=> array((string) $location, (string) $this->empty_value)
            )
        )->current();
        if (!$row)
            return false;
        return $row;
    }
    
    public function save(ContentText $object)
    {
        $data = array(
            'id_module' => $object->getId_module(),
            'id_submodule' => $object->getId_submodule(),
            'lang' => $object->getLang(),
            'content' => $object->getContent(),
            'majorversion' => $object->getMajorversion(),
            'minorversion' => $object->getMinorversion(),
            'correction' => $object->getCorrection(),
            'date_creation' => $object->getDate_creation(),
            'date_lastmodif' => $object->getDate_lastmodif(),
            'user_id' => $object->getUser_id(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation()
        );

        $id_module = (int) $object->id_module;
        $id_submodule = (int) $object->id_submodule;
        $lang = (string) $object->lang;
        $country = (string) $object->country;
        $company = (string) $object->company;
        $location = (string) $object->location;
        
        if (!$this->getContentByCCL($id_module,$id_submodule,$lang,$country,$company,$location)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getContentByCCL($id_module,$id_submodule,$lang,$country,$company,$location)) {
            $this->update(
                $data,
                array(
                    'id_module' => $id_module, 
                    'id_submodule' => $id_submodule, 
                    'lang' => $lang,
                    'country' => $country, 
                    'company' => $company,
                    'location' => $location
                    )
            );
            return true;
        } else {
            throw new \Exception('id_module, or id_submodule or lang in object ContentText does not exist');
        }
    }

    public function updateContent($id_module,$id_submodule,$lang,$data)
    {
        $id_module = (int) $id_module;
        $id_submodule = (int) $id_submodule;
        $lang = (string) $lang;
        $this->update($data, array('id_module' => $id_module, 'id_submodule' => $id_submodule, 'lang' => $lang));
    }
}