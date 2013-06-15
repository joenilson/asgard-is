<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\AdminUserModules;

class AdminUserModulesTable extends AbstractTableGateway {

	protected $table_name = 'modules_users';
	protected $schema_name = 'system';

	//public $table = new \TableIdentifier($table_name,$schema_name);

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
		$resultSet = $this->select(function (Select $select) {
			$select->order('mid ASC');
		});
		return $resultSet->toArray();
	}
	
	public function getUserModulesRaw($user_id) {
		$row = $this->select(array('user_id' => (int) $user_id))->toArray();
		if (!$row)
			return false;
		return $row;
	}
	
	public function getUserModulesAccess($user_id, $mid) {
		$row = $this->select(array('user_id' => (int) $user_id, 'mid' => (int) $mid))->toArray();
		if (!$row)
			return false;
		return $row;
	}
	
	public function populateUserModule(AdminUserModules $usersubmodule){
		$data=array(
			'user_id' => $usersubmodule->getUser_id(),
			'mid' => $usersubmodule->getMid(),
		);
	
		if (!$this->insert($data))
			return false;
		return true;
	}
	
	public function saveUserModule(AdminUserModules $usermodule){
	    $data = array(
	    		'user_id' => $usermodule->getUser_id(),
	    		'mid' => $usermodule->getMid(),
	    );
	    if (!$this->insert($data))
	    	return false;
	    return true;
	}
	
	public function deleteUserModule(AdminUserModules $usermodule){
		$data = array(
				'user_id' => $usermodule->getUser_id(),
				'mid' => $usermodule->getMid(),
		);
		if (!$this->delete($data))
			return false;
		return true;
	}
	
}