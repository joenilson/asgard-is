<?php
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;

class ContentTextHisytoryTable extends AbstractTableGateway {

    protected $table_name = 'content_text_history';
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
        $row = $this->select(array('id_module' => (int) $mid,'id_submodule' => (int) $smid,'lang' => (string) $lang))->current();
        if (!$row)
            return false;
        return $row;
    }

    public function getContentByCC($mid,$smid,$lang,$country,$company) {
        $row = $this->select(array('id_module' => (int) $mid,
            'id_submodule' => (int) $smid,
            'lang' => (string) $lang,
            'country'=> (string) $country,
            'company'=> (string) $company))->current();
        if (!$row)
            return false;
        return $row;
    }
    
    
}