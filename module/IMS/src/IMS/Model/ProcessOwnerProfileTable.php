<?php
/*
 * Copyright (C) 2013 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\ProcessOwnerProfile;

class ProcessOwnerProfileTable extends AbstractTableGateway {

    protected $table_name = 'process_owner_profile';
    protected $link_table = 'pld_processowners';
    protected $schema_name = 'ims';
    protected $empty_value = '0000';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function getDbAdapter() {
        return $this->adapter;       
    }
    
    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }

    public function getOwners($lang)
    {
        $rows = $this->select(array('lang'=>(string) $lang,'status' => 'A'));
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getOwnersByCCL($company,$country,$location,$lang)
    {
        $rows = $this->select(array('lang'=>(string) $lang,'company'=>$company,'country'=>$country,'location'=>$location,'status' => 'A'));
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getOwnerProfile($lang,$id,$company,$country,$location)
    {
        $rows = $this->select(array('lang'=>(string) $lang,'company'=>$company,'country'=>$country,'location'=>$location,'id'=>$id,'status' => 'A'));
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row->id;
        $id++;
        return $id;
    }
   
    public function save(ProcessOwnerProfile $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'profile_desc' => $object->getProfile_desc(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation(),
            'status' => $object->getStatus()
        );
        $id = (int) $object->getId();
        $country = (string) $object->getCountry();
        $company = (string) $object->getCompany();
        $location = (string) $object->getLocation();
        $file = (string) $object->getProfile_file();
        $lang = (string) $object->getLang();
        
        
        if(empty($id)){
            $id = $this->getNextId();
        }
        $data['id'] = $id;
        
        if(!empty($file)){
            $data['profile_file'] = $file;
        }
        
        if (!$this->getOwnerProfile($lang,$id,$country,$company,$location)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getOwnerProfile($lang,$id,$country,$company,$location)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id, 'lang' => $lang) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object IEEA does not exist');
        }
        
        /*
        if (count($this->getOwnerProfile($lang,$id,$country,$company,$location)===0)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif (count($this->getOwnerProfile($lang,$id,$country,$company,$location)!==0)) {
            $this->updateOwnerProfile($country,$company,$location,$id,$lang,$data);
            return true;
        } else {
            throw new \Exception('id or parent_id or type in object process_relations does not exist');
        }
         * 
         */
    }

    public function updateOwnerProfile($country,$company,$location,$id,$lang,$data)
    {
        $id = (int) $id;
        $this->update($data, array(
                    'country' => $country,
                    'company' => $company,
                    'location' => $location,
                    'id' => $id,
                    'lang' => $lang
                )
            );
    }
    
}

