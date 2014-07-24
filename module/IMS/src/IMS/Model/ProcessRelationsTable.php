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
use IMS\Model\Entity\ProcessRelations;

class ProcessRelationsTable extends AbstractTableGateway {

    protected $table_name = 'process_relations';
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

    public function getProcessValue($country,$company,$location,$id,$parent_id,$type)
    {
        $row = $this->select(array(
            'id'=>(int) $id, 
            'parent_id'=>(int) $parent_id,
            'type'=>(string) strtolower($type),
            'country'=> array((string) $country, (string) $this->empty_value),
            'company'=> array((string) $company, (string) $this->empty_value),
            'location'=> array((string) $location, (string) $this->empty_value)
            ));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getProcessRelationList($country,$company,$location,$parent_id,$type) 
    {
        $row = $this->select(function (Select $select) use ($country,$company,$location,$parent_id,$type) {
            $select->where(array(
                'parent_id' => (int) $parent_id, 
                'type'=>(string) strtolower($type),
                'country'=> array((string) $country, (string) $this->empty_value),
                'company'=> array((string) $company, (string) $this->empty_value),
                'location'=> array((string) $location, (string) $this->empty_value)
                ))->order('id ASC');
        });
        if (!$row)return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(ProcessRelations $object)
    {
        $data = array(
            'type' => $object->getType(),
            'id' => $object->getId(),
            'parent_id' => $object->getParent_id(),
            'date_creation' => $object->getDate_creation(),
            'user_id' => $object->getUser_id(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation()
        );

        $id = (int) $object->getId();
        $parent_id = (int) $object->getParent_id();
        $type =  (string) $object->getType();
        $country = (string) $object->getCountry();
        $company = (string) $object->getCompany();
        $location = (string) $object->getLocation();
        
        if (count($this->getProcessValue($country,$company,$location,$id,$parent_id,$type)===0)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif (count($this->getProcessValue($country,$company,$location,$id,$parent_id,$type)!==0)) {
            $this->updateProcessRelations($country,$company,$location,$id,$parent_id,$type,$data);
            return true;
        } else {
            throw new \Exception('id or parent_id or type in object process_relations does not exist');
        }
    }

    public function updateProcessRelations($country,$company,$location,$id,$parent_id,$type,$data)
    {
        $id = (int) $id;
        $parent_id = (int) $parent_id;
        $type = (string) $type;
        $this->update($data, array(
                    'country' => $country,
                    'company' => $company,
                    'location' => $location,
                    'id' => $id,
                    'parent_id' => $parent_id,
                    'type' => $type
                )
            );
    }
    
    public function removeProcessRelations(ProcessRelations $object)
    {
        $data = array(
            'type' => $object->getType(),
            'id' => $object->getId(),
            'parent_id' => $object->getParent_id(),
            'date_creation' => $object->getDate_creation(),
            'user_id' => $object->getUser_id(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation()
        );

        $id = (int) $object->getId();
        $parent_id = (int) $object->getParent_id();
        $type =  (string) $object->getType();
        $country = (string) $object->getCountry();
        $company = (string) $object->getCompany();
        $location = (string) $object->getLocation();
        
        
        if (count($this->getProcessValue($country,$company,$location,$id,$parent_id,$type)!==0)) {
            $this->update($data, array(
                    'country' => $country,
                    'company' => $company,
                    'location' => $location,
                    'id' => $id,
                    'parent_id' => $parent_id,
                    'type' => $type
                )
            );
            
            $this->delete(array(
            'id'=>$id,
            'parent_id'=>$parent_id,
            'type'=>$type,
            'country'=>$country,
            'company'=>$company,
            'location'=>$location
            ));
            return true;
        }else{
            return false;
        }
        
    }
    
}
?>

