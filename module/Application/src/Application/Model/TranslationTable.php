<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;


class TranslationTable extends AbstractTableGateway

{
	protected $table_name = 'translation';
	protected $schema_name = 'system';
	
	//public $table = new \TableIdentifier($table_name,$schema_name);
	
	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}

	public function fetchAll() {
		$resultSet = $this->select(function (Select $select) {
			$select->order('ordering ASC');
		});
		return $resultSet->toArray();
	}

	public function getTranslation($lang_id,$module_id,$key_id)
	{
		//$id  = (int) $id;
		$rowset = $this->select(array('lang' => $lang_id,'module'=>$module_id, 'key'=>$key_id));
		$row = $rowset->current();
		if (!$row) {
			throw new \Exception("Could not find row $lang_id or $module_id or $key_id");
		}
		return $row;
	}

	public function getTranslationItem($lang_id,$module_id,$key_id)
	{
		//$id  = (int) $id;
		$rowset = $this->select(array('lang' => $lang_id,'module'=>$module_id, 'key'=>$key_id));
		$row = $rowset->current();
		if (!$row) {
			throw new \Exception("Could not find row $lang_id or $module_id or $key_id");
		}
		return $row;
	}	
	
	/*
	public function saveTranslation(Translation $translation)
	{
		$data = array(
				'lang'      => $translation->lang,
				'module'    => $translation->module,
		        'key'       => $translation->key,
		        'value'     => $translation->value,
		        'active'    => $translation->active,
		        'date_create' => $translation->date_create,
		        'date_modify' => $translation->date_modify,
		);

		$lang_id = $translation->lang;
		$module_id = $translation->module;
		$key_id = $translation->key;
		if ($lang_id == 0 AND $module_id == 0 AND $key_id == 0 ) {
			$this->tableGateway->insert($data);
		} else {
			if ($this->getTranslation($lang_id,$module_id,$key_id)) {
				$this->tableGateway->update($data, array('lang' => $lang_id,'module'=>$module_id, 'key'=>$key_id));
			} else {
				throw new \Exception('Data with this id does not exist');
			}
		}
	}
	*/

	public function deleteTranslation($lang_id,$module_id,$key_id)
	{
		$this->tableGateway->delete(array('lang' => $lang_id,'module'=>$module_id, 'key'=>$key_id));
	}
}