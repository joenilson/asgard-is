<?php
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
use IMS\Model\Entity\ProcessMain;

class ProcessMainTable extends AbstractTableGateway {

    protected $table_name = 'process_main';
    protected $schema_name = 'ims';
    protected $table_i18n = 'process_main_i18n';
    protected $table_relations = 'process_relations';
    protected $empty_value = '0000';
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    
    private function processArray($value)
    {
        if(is_array($value)){
            $value_processed = implode("','",$value);
        }else{
            $value_processed = $value;
        }
        return $value_processed;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('ordering ASC');
        });
        return $resultSet->toArray();
    }

    public function getProcessValue($id_process)
    {
        $row = $this->select(array('id'=>(int) $id_process));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getAllMainProcess($lang,$assigned,$companies,$countries,$locations) {
        
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $contatenation = ($assigned==='U')?" IN ":" IN ";
        $typeJoin = ($assigned==='U')?'left':'';
        $row = $this->select(function (Select $select) use ($lang,$contatenation,$companies,$countries,$locations,$typeJoin) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pmi'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pmi.id', array('lang', 'value', 'description'));
            $select->join(
                array('pr'=>new TableIdentifier($this->table_relations, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id = pr.id AND pr.type=\'p\' and pr.company '.$contatenation.' (\''.$companies.'\')  and pr.country '.$contatenation.' (\''.$countries.'\')  and pr.location '.$contatenation.' (\''.$locations.'\')'), 
                array('type', 'parent_id', 'company', 'country', 'location'),$typeJoin
            );
            $select->where(array('lang' => (string) $lang, 'status'=>'A'))->order('ordering ASC');
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getMainProcess($lang,$parent_id,$assigned,$companies,$countries,$locations) {
        
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $contatenation = ($assigned==='U')?" IN ":" IN ";
        $typeJoin = ($assigned==='U')?'left':'';
        $parentId = (!empty($parent_id))?$parent_id:null;
        $row = $this->select(function (Select $select) use ($lang,$contatenation,$companies,$countries,$locations,$typeJoin,$parentId) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pmi'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pmi.id', array('lang', 'value', 'description'));
            $select->join(
                array('pr'=>new TableIdentifier($this->table_relations, $this->schema_name)), 
                new Expression(
                    $this->table_name.'.id = pr.id AND pr.type=\'p\' and pr.company '.$contatenation.' (\''.$companies.'\')  and pr.country '.$contatenation.' (\''.$countries.'\')  and pr.location '.$contatenation.' (\''.$locations.'\')'), 
                array('type', 'parent_id', 'company', 'country', 'location'),$typeJoin
            );
            $select->where(array('lang' => (string) $lang, 'status'=>'A','parent_id'=>$parentId))->order('ordering ASC');
            //echo $select->getSqlString();
        });
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function getSubProcessListByParent($lang,$parent_id) {
        $row = $this->select(function (Select $select) use ($lang,$parent_id) {
            $select->where(array('lang' => (string) $lang,'parent_id'=>$parent_id))->order('ordering ASC');
        });
        //$row = $this->select(array('lang' => (string) $lang));
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    
    public function save(ProcessThread $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'id' => $object->getId(),
            'value' => $object->getValue(),
            'description' => $object->getDescription(),
            'ordering' => $object->getOrdering(),
            'status' => $object->getStatus(),
            'type'=> $object->getType(),
            'parent_id'=> $object->getParent_id(),
            'assignment'=> $object->getAssignment()
        );

        $id = (int) $object->getId();
        $lang = (string) $object->getLang();
        
        if (!$this->getProcessValue($id,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getProcessValue($id,$lang)) {
            $this->update(
                $data,
                array(
                    'id_incident' => $id, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateProcessMain($id,$lang,$data)
    {
        $id = (int) $id;
        $lang = (string) $lang;
        $this->update($data, array('id' => $id, 'lang' => $lang));
    }
}
?>
