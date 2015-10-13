<?php

namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use Application\Model\Entity\Users;

class UsersTable extends AbstractTableGateway {

    protected $table_name = 'users';
    protected $schema_name = 'system';
    protected $sequence_name = 'system.users_id_seq';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = new Feature\FeatureSet();
        $this->adapter->addFeature(new Feature\SequenceFeature('id', 'system.users_id_seq'));
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            //$select->columns('id ASC');
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }

    public function getUsersList($company, $country, $location) {
        $dataSelect = array();
        if(!empty($company)){
            $dataSelect['users.company']=$company;
        }
        
        if(!empty($country)){
            $dataSelect['users.country']=$country;
        }
        
        if(!empty($location)){
            $dataSelect['users.location']=$location;
        }
        $resultSet = $this->select(function (Select $select) use ($dataSelect) {
            $select->columns(array('id', 'username', 'realname', 'date_created', 'date_lastlogin', 'admin', 'status', 'role', 'type', 'account_type', 'country', 'company', 'location','type_system','id_company','id_location','id_employee'));
            $select->join(
                    array('h1' => new TableIdentifier('companies', $this->schema_name)), new Expression($this->table_name . '.company = h1.id '), array('company_desc' => 'legal_name')
            );
            $select->join(
                    array('h2' => new TableIdentifier('countries', $this->schema_name)), new Expression($this->table_name . '.country = h2.id '), array('country_desc' => 'name')
            );
            $select->join(
                    array('h3' => new TableIdentifier('locations', $this->schema_name)), new Expression($this->table_name . '.location = h3.id AND h3.country_id = h2.id '), array('location_desc' => 'location_name')
            );
            if(!empty($dataSelect)){
                $select->where($dataSelect);
            }
            $select->order('id ASC');
            //echo $select->getSqlString();
        });
        
        return $resultSet->toArray();
    }
    

    public function getUserByIdRaw($user_id) {
        if (is_numeric($user_id)) {
            $row = $this->select(array('id' => $user_id))->current();
            if (!$row)
                return false;

            return $row;
        }else {
            return false;
        }
    }

    public function getUserById($user_id) {
        if (is_numeric($user_id)) {
            $row = $this->select(array('id' => $user_id))->toArray();
            if (!$row)
                return false;

            return $row;
        }else {
            return false;
        }
    }

    public function getUserByUsername($username, $accountType) {
        if (is_string($username)) {
            if ($accountType) {
                $row = $this->select(array('username' => $username, 'account_type' => $accountType))->toArray();
            } else {
                $row = $this->select(array('username' => $username))->toArray();
            }
            if (!$row){
                return false;
            }
            return $row;
        }else {
            return false;
        }
    }

    public function save(Users $user) {
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
            'type_system' => $user->getType_system(),
            'id_company' => $user->getId_company(),
            'id_location' => $user->getId_location(),
            'id_employee' => $user->getId_employee()
        );

        $id = (int) $user->getId();
        if ($id == 0) {
            if (!$this->insert($data))
                return false;
            return $this->adapter->getDriver()->getLastGeneratedValue($this->sequence_name);
        } elseif ($this->getUserById($id)) {
            $this->update(
                    $data, array('id' => $id,)
            );
            return $id;
        } else {
            throw new \Exception('id object does not exist');
        }
    }

    public function updateById($id, $data) {
        $idUser = (int) $id;
        $this->update($data, array('id' => $idUser));
    }

}
