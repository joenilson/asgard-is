<?php 
// module/Application/src/Application/Model/SubmodulesTable.php

namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;


class SubmodulesTable extends AbstractTableGateway {
    
    protected $table_name = 'submodules';
    protected $schema_name = 'system';
    
    //public $table = new \TableIdentifier($table_name,$schema_name);

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    
    public function fetchAll() {
    	$resultSet = $this->select(function (Select $select) {
    		$select->order('ordering ASC');
    	});
    	return $resultSet->toArray();
    }
    
    public function getSubmodule($smid) {
    	//$row = $this->select(array('smid' => (int) $smid))->current();
    	$row = $this->select(array('smid' => (int) $smid))->toArray();
    	if (!$row)
    		return false;
        return $row;
        /*
    	$Submodule = new Entity\Submodules(array(
    		'mid' => $row->mid,
    	    'smid' => $row->smid,
    	    'parent_smid' => $row->parent_smid,
    		'smshortdesc' => $row->smshortdesc,
    		'smlongdesc' => $row->smlongdesc,
    	    'loadurl' => $row->loadurl,
    	    'icon' => $row->icon,
    	    'status' => $row->status,
    	    'typeof' => $row->typeof,
    	    'ordering' => $row->ordering,
    	    'datecreation' => $row->datecreation,
    	    'dateactivation' => $row->dateactivation,
    	));
    	return $Submodule;
    	*/
    }
    
    public function getSubmodulesByMidRaw($mid) {
    	//$row = $this->select(array('smid' => (int) $smid))->current();
    	$row = $this->select(array('mid' => (int) $mid))->toArray();
    	if (!$row)
    		return false;
    	return $row;
    }
    
    public function getSubmodulesByMid($mid) {
    	$row = $this->select(array('mid' => (int) $mid, 'parent_smid' => 0))->toArray();
    	if (!$row)
    		return false;
    	$submodules = array();
    	$counter = 0;
    	foreach($row as $key){
    	   $submodules[$counter]['id'] = $key['smid'];
    	   $submodules[$counter]['id_menu'] = $key['mid'].'-'.$key['smid'];
    	   $submodules[$counter]['text'] = $key['smshortdesc'];
    	   $submodules[$counter]['description'] = $key['smshortdesc'];
    	   $submodules[$counter]['path'] = $key['loadurl'];
    	   $submodules[$counter]['leaf'] = ($key['typeof']=='leaf')?true:false;
    	   $counter++;
    	}
    	return $submodules;
    }
    
    public function getSubmodulesBySmid($mid, $parent_smid) {
    	$row = $this->select(array('mid' => (int) $mid, 'parent_smid' => (int) $parent_smid))->toArray();
    	if (!$row)
    		return false;
    	$submodules = array();
    	$counter = 0;
    	foreach($row as $key){
    		$submodules[$counter]['id'] = $key['smid'];
    		$submodules[$counter]['id_menu'] = $key['mid'].'-'.$key['smid'];
    		$submodules[$counter]['text'] = $key['smshortdesc'];
    		$submodules[$counter]['description'] = $key['smshortdesc'];
    		$submodules[$counter]['path'] = $key['loadurl'];
    		$submodules[$counter]['leaf'] = ($key['typeof']=='leaf')?true:false;
    		$counter++;
    	}
    	return $submodules;
    }
    
    public function getSubmodulesContentBySmid($mid, $parent_smid) {
    	$row = $this->select(array('mid' => (int) $mid, 'parent_smid' => (int) $parent_smid),
    	    array('mid','smid','loadurl','content_header','content_body'))
    	->toArray();
    	if (!$row)
    		return false;
    	$submodules = array();
    	$counter = 0;
    	foreach($row as $key){
    		$submodules[$counter]['id'] = $key['smid'];
    		$submodules[$counter]['id_menu'] = $key['mid'].'-'.$key['smid'];
    		$submodules[$counter]['text'] = $key['smshortdesc'];
    		$submodules[$counter]['description'] = $key['smshortdesc'];
    		$submodules[$counter]['path'] = $key['loadurl'];
    		$submodules[$counter]['leaf'] = ($key['typeof']=='leaf')?true:false;
    		$counter++;
    	}
    	return $submodules;
    }
    
    public function saveSubmodule(Entity\Submodules $submodule) {
    	$data = array(
    	    'mid' => $submodule->getMid(),
    	    'parent_smid' => $submodule->getParent_smid(),
    	    'smshortdesc' => $submodule->getSmshortdesc(),
    	    'smlongdesc' => $submodule->getSmlongdesc(),
    	    'loadurl' => $submodule->getLoadurl(),
    	    'icon' => $submodule->getIcon(),
    	    'status' => $submodule->getStatus(),
    	    'typeof' => $submodule->getTypeof(),
    	    'ordering' => $submodule->getOrdering(),
    	    'datecreation' => $submodule->getDatecreation(),
    	    'dateactivation' => $submodule->getDateactivation(),
    	);
    
    	$smid = (int) $submodule->getSmid();
    	if ($smid == 0) {
    		$data['datecreation'] = date("Y-m-d H:i:s");
    		if (!$this->insert($data))
    			return false;
    		return $this->getLastInsertValue();
    	}
    	elseif ($this->getSubmodule($smid)) {
    		if (!$this->update($data, array('smid' => $smid)))
    			return false;
    		return $smid;
    	}
    	else
    		return false;
    }
    
    public function removeModule($smid) {
        $data['status']='X';
    	return $this->update($data, array('smid' => (int) $smid));
    }
    
}