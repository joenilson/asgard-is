<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;

class UserModulesTable extends AbstractTableGateway {

	protected $table_name = 'view_modules_users';
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
	
	public function getUserModule($user_id, $lang) {
		$row = $this->select(array('id' => (int) $user_id, 'lang' => $lang))->toArray();
		if (!$row)
			return false;
	    
		return $row;
		/*
		$Usermodule = new Entity\Modules(array(
				'id' => $row->id,
				'mid' => $row->mid,
				'mshortdesc' => $row->mshortdesc,
				'icon' => $row->icon,
		        'helpurl' => $row->helpurl,
		        'ordering' => $row->ordering,
		        'typeof' => $row->typeof,		    
		        'status' => $row->status
		));
		return $Usermodule;
		*/
	}
}