<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;

class UserSubmodulesTable extends AbstractTableGateway {

	protected $table_name = 'view_submodules_users';
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
	
	
	public function getUserSubmodules($mid, $user_id,$lang) {
		$row = $this->select(array('mid' => (int) $mid, 'user_id' => (int) $user_id, 'lang' => (string) $lang, 'parent_smid' => 0))->toArray();
		if (!$row)
			return false;
		$submodules = array();
		$counter = 0;
		foreach($row as $key){
			$submodules[$counter]['id'] = $key['smid'];
			$submodules[$counter]['id_menu'] = $key['mid'].'-'.$key['smid'];
			$submodules[$counter]['text'] = $key['smshortdesc'];
			$submodules[$counter]['description'] = $key['smshortdesc'];
			$submodules[$counter]['path'] = $key['smloadurl'];
			$submodules[$counter]['iconCls'] = $key['smicon'];
			$submodules[$counter]['leaf'] = ($key['smtypeof']=='leaf')?true:false;
			$submodules[$counter]['contentHeader'] = $key['content_header'];
			$submodules[$counter]['contentBody'] = $key['content_body'];
			$counter++;
		}
		return $submodules;
	}
	
	public function getUserSubmodulesBySmid($mid, $parent_smid, $user_id, $lang) {
		$row = $this->select(array('mid' => (int) $mid, 'parent_smid' => (int) $parent_smid, 'user_id' => (int) $user_id, 'lang' => (string) $lang))->toArray();
		if (!$row)
			return false;
		$submodules = array();
		$counter = 0;
		foreach($row as $key){
			$submodules[$counter]['id'] = $key['smid'];
			$submodules[$counter]['id_menu'] = $key['mid'].'-'.$key['smid'];
			$submodules[$counter]['text'] = $key['smshortdesc'];
			$submodules[$counter]['description'] = $key['smshortdesc'];
			$submodules[$counter]['path'] = $key['mloadurl'];
			$submodules[$counter]['iconCls'] = $key['smicon'];
			$submodules[$counter]['leaf'] = ($key['smtypeof']=='leaf')?true:false;
			$submodules[$counter]['contentHeader'] = $key['content_header'];
			$submodules[$counter]['contentBody'] = $key['content_body'];
			$counter++;
		}
		return $submodules;
	}
	
	
	
}