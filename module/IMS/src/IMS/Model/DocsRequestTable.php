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
use IMS\Model\Entity\DocsRequest;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;

class DocsRequestTable extends AbstractTableGateway
    implements AdapterAwareInterface 
{

    protected $table_name = 'docs_request';
    protected $schema_name = 'ims';
    protected $table_helper = 'docs_helpers';
    protected $table_library = 'docs_library';
    protected $empty_value = '0000';
    /*
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    */
    
    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        
        $this->initialize();
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
            $select->order('date_request ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getRequestById($id) {
        $doc_newid = (int) $id;
        $resultSet = $this->select(function (Select $select) use ($doc_newid) {
            $select->where(array('doc_newid'=> (int) $doc_newid));
        });
        $result = $resultSet->toArray();
        return $result;
    }
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(doc_newid) AS doc_newid')));
        });
        $result = $resultSet->current();
        $newid = $result['doc_newid'];
        $newid++;
        return $newid;
    }

    public function getRequestByCCL($countries,$companies,$locations)
    {
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);

        $row = $this->select(function (Select $select) use ($countries,$companies,$locations) {
            $select->join( array('l'=>new TableIdentifier($this->table_library, $this->schema_name)),
                new Expression ($this->table_name.'.doc_id = l.doc_id and l.doc_status_general = \'A\''), array('doc_original'=>'doc_file'));
            $select->where(array($this->table_name.'.company'=>$companies,$this->table_name.'.country'=>$countries,$this->table_name.'.location'=>$locations));
            $select->order('date_request ASC');
        });
        if (!$row){
            return false;
        }
        return $row->toArray();
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
    
    public function saveRequest(DocsRequest $object)
    {
        $data = array(
            'doc_id' => $object->getDoc_id(),
            'lang' => $object->getLang(),
            'doc_classification' => $object->getDoc_classification(),
            'doc_file' => $object->getDoc_file(),
            'desc_request' => $object->getDesc_request(),
            'user_request'=> $object->getUser_request(),
            'name_request' => $object->getName_request(),
            'email_request' => $object->getEmail_request(),
            'date_request' => $object->getDate_request(),
            'date_attention' => $object->getDate_attention(),
            'status' => $object->getStatus(),
            'user_auth' => $object->getUser_auth(),
            'doc_newid' => $object->getDoc_newid(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation()
        );
       
        if (!$this->insert($data)){
            throw new \Exception('insert statement can\'t be executed');
        }
        
        return true;
    }

    public function updateRequest($data,$docnewid)
    {
        $docnewid = (int) $docnewid;
        $this->update($data, array('doc_newid' => $docnewid ));
    }
}
