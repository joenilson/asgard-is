<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\AdminUserSubmodules;
use Application\Model\SubmodulesTable;

class AdminUserSubmodulesTable extends AbstractTableGateway {

	protected $table_name = 'submodules_users';
	protected $schema_name = 'system';

	//public $table = new \TableIdentifier($table_name,$schema_name);

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
		$resultSet = $this->select(function (Select $select) {
			$select->order('mid,smid ASC');
		});
		return $resultSet->toArray();
	}
	
	public function getUserSubmodulesRaw($user_id, $mid) {
		$row = $this->select(array('user_id' => (int) $user_id, 'mid' => (int) $mid))->toArray();
		if (!$row)
			return false;
		return $row;
	}

	public function getUserSubmodulesAccess($user_id, $mid, $smid) {
		$row = $this->select(array('user_id' => (int) $user_id, 'mid' => (int) $mid, 'smid' => (int) $smid))->toArray();
		if (!$row)
			return false;
		return $row;
	}
	
	public function populateUserSubmodule(AdminUserSubmodules $usersubmodule){
		$initialData=new SubmodulesTable($this->adapter);
		$resultInitialData = $initialData->getSubmodulesByMidRaw($usersubmodule->getMid());
		//print_r($resultInitialData);
		
		foreach ($resultInitialData as $key) {
		    $userSmid = $key['smid'];
		    $usersubmodule->setSmid($userSmid);
    	    $data = array(
    			'user_id' => $usersubmodule->getUser_id(),
    			'mid' => $usersubmodule->getMid(),
    			'smid' => $usersubmodule->getSmid(),
    			'view' => $usersubmodule->getView(),
    			'edit' => $usersubmodule->getEdit(),
    			'add' => $usersubmodule->getAdd(),
    			'admin' => $usersubmodule->getAdmin()
    		);
    	    $this->insert($data);
		}
		//print_r($data);
		/*
		if (!$this->insert($data))
			return false;
		return true;
		*/
	}
	
	public function saveUserSubmodule(AdminUserSubmodules $usersubmodule){
	    $data = array(
	    		'user_id' => $usersubmodule->getUser_id(),
	    		'mid' => $usersubmodule->getMid(),
	            'smid' => $usersubmodule->getSmid(),
    	        'view' => $usersubmodule->getView(),
    	        'edit' => $usersubmodule->getEdit(),
    	        'add' => $usersubmodule->getAdd(),
	            'admin' => $usersubmodule->getAdmin(),
	    );
	    if (!$this->insert($data))
	    	return false;
	    return true;
	}
	
	public function deleteUserSubmodule(AdminUserSubmodules $usersubmodule){
		$data = array(
				'user_id' => $usersubmodule->getUser_id(),
				'mid' => $usersubmodule->getMid(),
		        'smid' => $usersubmodule->getMid(),
		);
		if (!$this->delete($data))
			return false;
		return true;
	}
	
}