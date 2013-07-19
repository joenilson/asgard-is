<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraRiskLevelI18n;

class hiraRiskLevelI18nTable extends AbstractTableGateway {

    protected $table_name = 'hira_risk_level_i18n';
    protected $schema_name = 'ims';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id_level ASC');
        });
        return $resultSet->toArray();
    }

    public function getTextHRL($id_level,$lang) {
        $row = $this->select(
                array(
                    'id_level' => (int) $id_level,
                    'lang' => (string) $lang
            ));
        if ($row->count() == 0)
            return false;
        return $row->current();
    }

    public function getTextList($lang){
        
        $itemList = new hiraRiskLevelI18n;
        $dataList = array();
        
        $row = $this->select(array('lang' => (string) $lang));
        if ($row->count() == 0)
            return false;
        for ($index = 0; $index < $row->count(); $index++) {
            $row->current();
            $itemList->setId_level($row->id_level)
                    ->setLang($row->lang)
                    ->setKey($row->key)
                    ->setDescription($row->description);
            $dataList[]=$itemList;
            $row->next();
        }
        return $dataList;
    }
    
    public function save(hiraRiskLevelI18n $object)
    {
        $data = array(
            'id_level' => $object->getId_level(),
            'lang' => $object->getLang(),
            'key' => $object->getKey(),
            'description' => $object->getDescription()

        );

        $id_level = (int) $object->id_level;
        $lang = (string) $object->lang;
        
        if (!$this->getTextHRL($id_level,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getTextHRL($id_level,$lang)) {
            $this->update(
                $data,
                array(
                    'id_level' => $id_level, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_level, or lang in object hiraRiskLevelI18n does not exist');
        }
    }

    public function updateTextHRL($ids,$lang,$data)
    {
        $id_level = (int) $ids;
        $lang = (string) $lang;
        $this->update($data, array('id_level' => $id_level, 'lang' => $lang));
    }
}