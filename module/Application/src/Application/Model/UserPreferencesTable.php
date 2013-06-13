<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\UserPreferences;

class UserPreferencesTable extends AbstractTableGateway {

	protected $table_name = 'user_preferences';
	protected $schema_name = 'system';

	//public $table = new \TableIdentifier($table_name,$schema_name);

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
		$resultSet = $this->select(function (Select $select) {
			$select->order('user_id ASC');
		});
		return $resultSet->toArray();
	}
	
	public function getUserPreferences($user_id) {
	    if(is_numeric($user_id)){
	        $row = $this->select(array('user_id' => $user_id))->toArray();
	        if (!$row)
	        	return false;
	         
	        return $row;
	    }else{
	        return false;
	    }
		
	}
	public function save(UserPreferences $userPrefs)
	{
		$data = array(
				'user_id' => $userPrefs->getUser_id(),
				'lang' => $userPrefs->getLang(),
				'email' => $userPrefs->getEmail(),
				'alias' => $userPrefs->getAlias(),
				'avatar' => $userPrefs->getAvatar(),
				'regional' => $userPrefs->getRegional(),
				'vacation_from' => $userPrefs->getVacation_from(),
				'vacation_to' => $userPrefs->getVacation_to(),
				'vacation_status' => $userPrefs->getVacation_status(),
				'office_phone' => $userPrefs->getOffice_phone(),
				'cell_phone' => $userPrefs->getCell_phone(),
				'home_phone' => $userPrefs->getHome_phone(),
				'other_phone' => $userPrefs->getOther_phone(),
				'fax_phone' => $userPrefs->getFax_phone(),
		        'office_ext' => $userPrefs->getOffice_ext(),
		);
		
		$user_id = (int) $userPrefs->user_id;
	
		if (!$user_id == 0) {
			$this->insert($data);
		} else {
			throw new \Exception('user_id object does not exist');
		}
	}
	
	public function updateById($user_id,$data)
	{
		$user_id = (int) $user_id;
		$this->update($data, array('user_id' => $user_id));
	}
}