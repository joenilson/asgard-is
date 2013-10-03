<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Countries;

class CountriesTable extends AbstractTableGateway {

	protected $table_name = 'countries';
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
	
	public function getCountryById($id) {
            $row = $this->select(array('id' => $id))->toArray();
            if (!$row)
                return false;
            return $row;
	}
       
	public function save(Countries $object)
	{
            $data = array(
                'id' => $object->getId(),
                'abrev' => $object->getAbrev(),
                'name' => $object->getName(),
                'locale' => $object->getLocale(),
                'currency_symbol' => $object->getCurrency_symbol(),
                'currency_descrition' => $object->getCurrency_description(),
                'timezone' => $object->getTimezone(),
            );
		
		$id = (string) $object->id;
		if ($id == 0) {
                    if (!$this->insert($data))
                        return false;
                    return $this->getLastInsertValue();
                //return $this->adapter->getDriver()->getLastGeneratedValue();
		} elseif ($this->getCountryById($id)) {
                    $this->update(
                        $data,
                        array('id' => $id)
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