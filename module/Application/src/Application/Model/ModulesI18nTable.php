<?php 
// module/Application/src/Application/Model/ModulesI18nTable.php

namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;

class ModulesI18nTable extends AbstractTableGateway {
    
    protected $table_name = 'modules_i18n';
    protected $schema_name = 'system';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    
    public function fetchAll() {
    	$resultSet = $this->select(function (Select $select) {
    		$select->order('id_module,key ASC');
    	});
    	return $resultSet->toArray();
    }
    
    public function getModuleValuesById($id_module) {
    	$row = $this->select(array('id_module' => (int) $id_module))->current();
    	if (!$row)
    		return false;
        
    	$Module = new Entity\ModulesI18n(array(
    		'lang' => $row->lang,
    		'id_module' => $row->id_module,
    		'key' => $row->key,
    	    'value' => $row->value,
    	    'active' => $row->active,
    	    'icon' => $row->date_create,
    	    'status' => $row->date_modify
    	));
    	return $Module;
    }
    
    public function getModuleValuesByIdAndKey($lang,$id_module,$key) {
    	$row = $this->select(array('id_module' => (int) $id_module, 'key'=> (string) $key, 'lang'=> (string) $lang))->current();
    	if (!$row)
    		return false;
        
    	$Module = new Entity\ModulesI18n(array(
    		'lang' => $row->lang,
    		'id_module' => $row->id_module,
    		'key' => $row->key,
    	    'value' => $row->value,
    	    'active' => $row->active,
    	    'icon' => $row->date_create,
    	    'status' => $row->date_modify
    	));
    	return $Module;
    }
    
    public function saveModuleI18n(Entity\ModulesI18n $module) {
    	$data = array(
    	    'mshortdesc' => $module->getMshortdesc(),
    	    'mlongdesc' => $module->getMlongdesc(),
    	    'loadurl' => $module->getLoadurl(),
    	    'helpurl' => $module->getHelpurl(),
    	    'icon' => $module->getIcon(),
    	    'status' => $module->getStatus(),
    	    'typeof' => $module->getTypeof(),
    	    'ordering' => $module->getOrdering(),
    	    'datecreation' => $module->getDatecreation(),
    	    'dateactivation' => $module->getDateactivation(),
    	);
    
    	$mid = (int) $module->getMid();
    
    	if ($mid == 0) {
    		$data['datecreation'] = date("Y-m-d H:i:s");
    		if (!$this->insert($data))
    			return false;
    		return $this->adapter->getDriver()->getLastGeneratedValue($this->sequence_name);
    		//return $this->getLastInsertValue();
    	}
    	elseif ($this->getModuleValuesById($mid)) {
    		if (!$this->update($data, array('mid' => $mid)))
    			return false;
    		return $mid;
    	}
    	else
    		return false;
    }
    
    public function removeModuleI18n($mid) {
        $data['status']='X';
    	return $this->update($data, array('mid' => (int) $mid));
    }
    
}