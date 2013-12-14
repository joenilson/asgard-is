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
use IMS\Model\Entity\DocsLibrary;

class DocsLibraryTable extends AbstractTableGateway {

    protected $table_name = 'docs_library';
    protected $schema_name = 'ims';
    protected $table_helper = 'docs_helpers';
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

    public function getLibraryByCCL($id_subprocess)
    {
        $row = $this->select(array('id'=>(int) $id_subprocess));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getLibrary($lang,$companies,$countries,$locations) {
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations) {
            //$select->columns(array('id','ordering','status'));
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_classification = h1.id AND h1.helper=\'classification\' AND h1.lang=\''.$lang.'\''),
                array('desc_classification'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_type = h2.id AND h2.helper=\'type\' AND h2.lang=\''.$lang.'\''), 
                array('desc_type'=>'description')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_review = h3.id AND h3.helper=\'review\' AND h3.lang=\''.$lang.'\''), 
                array('desc_review'=>'description')
            );
            $select->join(
                array('h4'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_protection = h4.id AND h4.helper=\'protection\' AND h4.lang=\''.$lang.'\''), 
                array('desc_protection'=>'description')
            );
            $select->join(
                array('h5'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_location = h5.id AND h5.helper=\'location\' AND h5.lang=\''.$lang.'\''), 
                array('desc_location'=>'description')
            );
            $select->join(
                array('h6'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_origin = h6.id AND h6.helper=\'origin\' AND h6.lang=\''.$lang.'\''), 
                array('desc_origin'=>'description')
            );
            $select->join(
                array('h7'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.doc_retention = h7.id AND h7.helper=\'retention\' AND h7.lang=\''.$lang.'\''), 
                array('desc_retention'=>'description')
            );

            $select->where(array('doc_status_general'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations));
            $select->order('doc_id ASC');
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
    
    public function getThreadInfo($lang,$thread_id) {
        
        $thread_id = $this->processArray($thread_id);
        $row = $this->select(function (Select $select) use ($lang,$thread_id) {
            $select->columns(array('id','ordering','status'));
            $select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
                $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->where(array('lang' => (string) $lang, 'status'=>'A','process_thread.id'=>$thread_id));
            $select->order('ordering ASC');
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
