<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Companies;

class CompaniesTable extends AbstractTableGateway {

	protected $table_name = 'companies';
	protected $schema_name = 'system';

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
            $resultSet = $this->select(function (Select $select) {
                $select->order('id ASC');
            });
            return $resultSet->toArray();
	}
	
	public function getCompanyById($id) {
            $row = $this->select(array('id' => $id))->current();
            if (!$row)
                return false;
            return $row;
	}
	
	public function getCompanyByLegalName($legal_name) {
            $row = $this->select(array('legal_name' => $legal_name))->toArray();
            if (!$row)
                return false;
            return $row;
	}
        
        public function getCompanyByComercialName($comercial_name) {
            $row = $this->select(array('comercial_name' => $comercial_name))->toArray();
            if (!$row)
                return false;
            return $row;
	}
        
	public function save(Companies $company)
	{
            $data = array(
                'username' => $company->getUsername(),
                'password' => $company->getPassword(),
                'salt' => $company->getSalt(),
                'realname' => $company->getRealname(),
                'role' => $company->getRole(),
                'date_created' => $company->getDate_created(),
                'date_lastlogin' => $company->getDate_lastlogin(),
                'country' => $company->getCountry(),
                'company' => $company->getCompany(),
                'location' => $company->getLocation(),
                'admin' => $company->getAdmin(),
                'status' => $company->getStatus(),
                'type' => $company->getType(),
                'account_type' => $company->getAccount_type(),
            );
		
		$id = (int) $company->id;
		if ($id == 0) {
                    if (!$this->insert($data))
                        return false;
                    return $this->getLastInsertValue();
                //return $this->adapter->getDriver()->getLastGeneratedValue();
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
	    $id = (string) $id;
	    $this->update($data, array('id' => $id));
	}
}