<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Users;

class UsersTable extends AbstractTableGateway {

	protected $table_name = 'users';
	protected $schema_name = 'system';
	protected $sequence_name = 'system.users_id_seq';

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = new Feature\FeatureSet();
		$this->adapter->addFeature(new Feature\SequenceFeature('id','system.users_id_seq'));
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
		$resultSet = $this->select(function (Select $select) {
			$select->order('id ASC');
		});
		return $resultSet->toArray();
	}
	
	public function getUserByIdRaw($user_id) {
		if(is_numeric($user_id)){
			$row = $this->select(array('id' => $user_id))->current();
			if (!$row)
				return false;
	
			return $row;
		}else{
			return false;
		}
	}
	
	public function getUserById($user_id) {
	    if(is_numeric($user_id)){
	        $row = $this->select(array('id' => $user_id))->toArray();
	        if (!$row)
	        	return false;
	         
	        return $row;
	    }else{
	        return false;
	    }
	}

	public function getUserByUsername($username,$accountType) {
		if(is_string($username)){
			$row = $this->select(array('username' => $username, 'account_type' => $accountType))->toArray();
			if (!$row)
				return false;
	
			return $row;
		}else{
			return false;
		}
	}
	
	public function save(Users $user)
	{
		$data = array(
            'username' => $user->getUsername(),
            'password' => $user->getPassword(),
		    'salt' => $user->getSalt(),
            'realname' => $user->getRealname(),
		    'role' => $user->getRole(),
		    'date_created' => $user->getDate_created(),
		    'date_lastlogin' => $user->getDate_lastlogin(),
		    'country' => $user->getCountry(),
		    'company' => $user->getCompany(),
		    'location' => $user->getLocation(),
		    'admin' => $user->getAdmin(),
		    'status' => $user->getStatus(),
            'type' => $user->getType(),
            'account_type' => $user->getAccount_type(),
		);
		
		$id = (int) $user->id;
		if ($id == 0) {
			if (!$this->insert($data))
                return false;
            return $this->adapter->getDriver()->getLastGeneratedValue($this->sequence_name);
		} elseif ($this->getUserById($id)) {
			$this->update(
					$data,
					array('id' => $id,)
			);
			return $id;
		} else {
			throw new \Exception('id object does not exist');
		}
	}
	
	public function updateById($id,$data)
	{
	    $id = (int) $id;
	    $this->update($data, array('id' => $id));
	}
}