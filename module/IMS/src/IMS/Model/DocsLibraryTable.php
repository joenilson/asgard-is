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
    protected $table_owners = 'process_owner';
    protected $table_thread_i18n = 'process_thread_i18n';
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
    
    public function getNextDocId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(doc_id) as doc_id')));
        });
        $row = $resultSet->current();
        $docid = $row->doc_id;
        $docid++;
        return $docid;
    }

    public function getLibraryByCCL($id_subprocess)
    {
        $row = $this->select(array('id'=>(int) $id_subprocess));
        if (!$row)
            return false;
        return $row;
    }
    
    public function getLibraryByPT($lang,$companies,$countries,$locations,$process,$thread,$status,$type){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $thread_id = (int) $thread;
        $status = (string) $status;
        
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$thread_id,$status,$type) {
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
            $typeSqlEqual = ($type==5)?"":"!";
            $typeSql = ".doc_classification $typeSqlEqual= 5";
            $select->where(array('doc_status_general'=>$status,'company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id,'id_thread'=>$thread_id, new Expression ( $this->table_name.$typeSql)));
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
    
    public function getLibrary($lang,$companies,$countries,$locations,$process,$status,$type) {
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $status = (string) $status;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process,$status,$type) {
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
            if($type != 9){
                $select->join(
                    array('h8'=>new TableIdentifier($this->table_owners, $this->schema_name)), 
                    new Expression ( $this->table_name.'.doc_owner = h8.id AND h8.lang=\''.$lang.'\''), 
                    array('desc_owner'=>'name'),'left'
                );
                $select->join(
                    array('h9'=>new TableIdentifier($this->table_thread_i18n, $this->schema_name)), 
                    new Expression ( $this->table_name.'.id_thread = h9.id AND h9.lang=\''.$lang.'\''), 
                    array('desc_thread'=>'value')
                );
            }
            
            if($type == 9){
                $select->join(
                    array('h10'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                    new Expression ( $this->table_name.'.doc_minimal_time = h10.id AND h10.helper=\'retention\' AND h10.lang=\''.$lang.'\''), 
                    array('desc_regretention'=>'description')
                );
                $select->join(
                    array('h11'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                    new Expression ( $this->table_name.'.doc_final_dispose = h11.id AND h11.helper=\'dispose\' AND h11.lang=\''.$lang.'\''), 
                    array('desc_dispose'=>'description')
                );                
                $typeSql = ".doc_classification = 9";
            } elseif ($type == 5) {
                $typeSql = ".doc_classification = 5";
            } else {
                $typeSql = ".doc_classification NOT IN (5,9)";
            }
            
            $dataSelect['doc_status_general']=$status;
            $dataSelect['company']=$companies;
            $dataSelect['country']=$countries;
            $dataSelect['location']=$locations;
            if($process!=0){
                $dataSelect['id_process']= (int) $process;
            }
            $dataSelect[]=new Expression ($this->schema_name.".".$this->table_name.$typeSql);
            $select->where($dataSelect);
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
    
    public function getDocInfo($doc_id) {
        
        $doc_id = $this->processArray($doc_id);
        $row = $this->select(function (Select $select) use ($doc_id) {
            //$select->columns(array('id','ordering','status'));
            //$select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
            //    $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->where(array('doc_id' => (int) $doc_id));
            //$select->order('doc_date_creation ASC');
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
    
    public function save(DocsLibrary $object)
    {
        $data = array(
            'doc_id' => $object->getDoc_id(),
            'lang' => $object->getLang(),
            'doc_classification' => $object->getDoc_classification(),
            'doc_desc' => $object->getDoc_desc(),
            'doc_file' => $object->getDoc_file(),
            'doc_type' => $object->getDoc_type(),
            'doc_review' => $object->getDoc_review(),
            'doc_protection' => $object->getDoc_protection(),
            'doc_owner' => $object->getDoc_owner(),
            'doc_location' => $object->getDoc_location(),
            'doc_origin' => $object->getDoc_origin(),
            'doc_retention' => $object->getDoc_retention(),
            'doc_record' => $object->getDoc_record(),
            'doc_version_number' => $object->getDoc_version_number(),
            'doc_version_label' => $object->getDoc_version_label(),
            'doc_date_creation' => $object->getDoc_date_creation(),
            'doc_user_creation' => $object->getDoc_user_creation(),
            'doc_date_modification' => $object->getDoc_date_modification(),
            'doc_user_modification' => $object->getDoc_user_modification(),
            'doc_date_revision_req' => $object->getDoc_date_revision_req(),
            'doc_user_revision_req' => $object->getDoc_user_revision_req(),
            'doc_date_revision_actual' => $object->getDoc_date_revision_actual(),
            'doc_date_revision_next' => $object->getDoc_date_revision_next(),
            'doc_status_general' => $object->getDoc_status_general(),
            'doc_status_revision' => $object->getDoc_status_revision(),
            'doc_reference' => $object->getDoc_reference(),
            'country' => $object->getCountry(),
            'company' => $object->getCompany(),
            'location' => $object->getLocation(),
            'id_process' => $object->getId_process(),
            'id_thread' => $object->getId_thread(),
            'id_activity' => $object->getId_activity(),
            'doc_final_dispose'=> $object->getDoc_final_dispose(),
            'doc_minimal_time'=> $object->getDoc_minimal_time(),
            'doc_minimal_time'=> $object->getDoc_minimal_time(),
            'doc_source'=>$object->getDoc_source(),
            'reg_location'=>$object->getReg_location(),
            'reg_reference'=>$object->getReg_reference()
        );

        $id = (int) $object->getDoc_id();
        
        if (!$this->getDocInfo($id)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getDocInfo($id)) {
            $this->update(
                $data,
                array(
                    'doc_id' => $id
                    )
            );
            return true;
        } else {
            throw new \Exception('id_incident or lang in object hiraIncidentType does not exist');
        }
    }

    public function updateDoc($data,$id)
    {
        $id = (int) $id;
        $this->update($data, array('doc_id' => $id));
    }
}

