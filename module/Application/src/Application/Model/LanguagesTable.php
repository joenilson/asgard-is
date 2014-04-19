<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Languages;

class LanguagesTable extends AbstractTableGateway {

	protected $table_name = 'languages';
	protected $schema_name = 'system';

	public function __construct(Adapter $adapter) {
		$this->table = new TableIdentifier($this->table_name, $this->schema_name);
		$this->adapter = $adapter;
	}
	
	public function fetchAll() {
            $resultSet = $this->select(function (Select $select) {
                $select->order('lang ASC');
            });
            return $resultSet->toArray();
	}
	
        public function getLanguages() {
            $row = $this->select(function (Select $select) {
                $select->where(array('status'=>'A'));
                $select->order('lang ASC');
            });
            if (!$row)
                return false;
            return $row->toArray();
	}
        
        public function getLanguageByLang($lang) {
            $row = $this->select(array('lang' => (string) $lang,'status' => 'A'))->toArray();
            if (!$row)
                return false;
            return $row;
	}
        
	public function save(Languages $object)
	{
            $data = array(
                'lang' => $object->getLang(),
                'description' => $object->getDescription(),
                'status' => $object->getStatus(),
                'user_id' => $object->getUser_id(),
                'date_creation' => $object->getDate_creation()
            );
		
            $lang = (string) $object->getLang();
            if (!empty($lang) and !$this->getLanguageByLang($lang)) {
                if($this->insert($data)){
                    return true;
                }else{
                    return false;
                }
            } elseif ($this->getLanguageByLang($lang)) {
                $this->update( $data, array('lang' => $lang) );
                return $lang;
            } else {
                throw new \Exception('id object does not exist');
            }
	}
	
	public function updateByLang($lang,$data)
	{
	    $lang = (string) $lang;
	    $this->update($data, array('lang' => $lang));
	}
}