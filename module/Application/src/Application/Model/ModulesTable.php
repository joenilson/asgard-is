<?php 
// module/Application/src/Application/Model/ModulesTable.php

namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;


class ModulesTable extends AbstractTableGateway {
    
    protected $table_name = 'modules';
    protected $schema_name = 'system';
    protected $sequence_name = 'system.modules_mid_seq';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = new Feature\FeatureSet();
        $this->adapter->addFeature(new Feature\SequenceFeature('id',$this->sequence_name));
        $this->adapter = $adapter;
    }
    
    public function fetchAll() {
    	$resultSet = $this->select(function (Select $select) {
    		$select->order('ordering ASC');
    	});
    	return $resultSet->toArray();
    }
    
    public function getModule($mid) {
    	$row = $this->select(array('mid' => (int) $mid))->current();
    	if (!$row)
    		return false;
        
    	$Module = new Entity\Modules(array(
    		'mid' => $row->mid,
    		'mshortdesc' => $row->mshortdesc,
    		'mlongdesc' => $row->mlongdesc,
    	    'loadurl' => $row->loadurl,
    	    'helpurl' => $row->helpurl,
    	    'icon' => $row->icon,
    	    'status' => $row->status,
    	    'typeof' => $row->typeof,
    	    'ordering' => $row->ordering,
    	    'datecreation' => $row->datecreation,
    	    'dateactivation' => $row->dateactivation,
    	));
    	return $Module;
    }
    
    public function saveModule(Entity\Modules $module) {
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
    	elseif ($this->getModule($mid)) {
    		if (!$this->update($data, array('mid' => $mid)))
    			return false;
    		return $mid;
    	}
    	else
    		return false;
    }
    
    public function removeModule($mid) {
        $data['status']='X';
    	return $this->update($data, array('mid' => (int) $mid));
    }
    
}