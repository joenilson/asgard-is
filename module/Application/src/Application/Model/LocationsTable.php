<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Locations;

class LocationsTable extends AbstractTableGateway {

	protected $table_name = 'locations';
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
	
	public function getLocationsByCountry($country_id) {
            $row = $this->select(array('country_id' => $country_id))->toArray();
            if (!$row)
                return false;
            return $row;
	}
       
	public function save(Locations $object)
	{
            $data = array(
                'id' => $object->getId(),
                'country_id' => $object->getCountry_id(),
                'location_name' => $object->getLocation_name(),
            );
		
		$id = (string) $object->id;
                $country_id = (string) $object->country_id;
		if ($id == 0) {
                    if (!$this->insert($data))
                        return false;
                    return $this->getLastInsertValue();
                //return $this->adapter->getDriver()->getLastGeneratedValue();
		} elseif ($this->getLocationByCountry($country_id,$id)) {
                    $this->update(
                        $data,
                        array('id' => $id,'country_id'=>$country_id)
                    );
                    return $id;
		} else {
                    throw new \Exception('id object does not exist');
		}
	}
	
	public function updateById($country_id,$id,$data)
	{
	    $id = (string) $id;
            $country_id = (string) $country_id;
	    $this->update($data, array('id' => $id,'country_id'=>$country_id));
	}
}