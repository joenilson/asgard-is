<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\ContentText;

class ContextTextTable extends AbstractTableGateway {

    protected $table_name = 'context_text';
    protected $schema_name = 'ims';

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
        $row = $this->select(array('id_module' => (int) $mid,'id_submodule' => (int) $smid,'lang' => (int) $lang))->toArray();
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
            'date_lastmodif' => $object->getDate_lastmodif()
        );

        $id_module = (int) $object->id_module;
        $id_submodule = (int) $object->id_submodule;
        $lang = (string) $object->lang;
        if (!$this->getContent($id_module,$id_submodule,$lang)) {
            if (!$this->insert($data))
                return false;
            return true;
        } elseif ($this->getContent($id_module,$id_submodule,$lang)) {
            $this->update(
                $data,
                array('id_module' => $id_module, 'id_submodule' => $id_submodule, 'lang' => $lang)
            );
            return $object->content;
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