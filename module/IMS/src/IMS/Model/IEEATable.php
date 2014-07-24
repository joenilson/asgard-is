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
use IMS\Model\Entity\IEEA;

class IEEATable extends AbstractTableGateway {

    protected $table_name = 'ieea';
    protected $schema_name = 'ims';
    protected $table_helper = 'ieea_helper';
    protected $table_process = 'process_main_i18n';
    protected $table_thread = 'process_thread_i18n';
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
            $select->order('id ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getNextDocId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
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
    
    public function getIEEAByPT($lang,$companies,$countries,$locations,$process,$thread){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $thread_id = (int) $thread;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$thread_id) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.helper=\'type\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_cycle = h2.id AND h2.helper=\'cycle\' and h2.status=\'A\' AND h2.lang=\''.$lang.'\''), 
                array('desc_cycle'=>'description')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ea = h3.id AND h3.helper=\'ea\' and h3.status=\'A\' AND h3.lang=\''.$lang.'\''), 
                array('desc_ea'=>'description')
            );
            $select->join(
                array('h4'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ei = h4.id AND h4.helper=\'ei\' and h4.status=\'A\' AND h4.lang=\''.$lang.'\''), 
                array('desc_ei'=>'description')
            );
            $select->join(
                array('h5'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.unit_measure = h5.id AND h5.helper=\'um\' and h5.status=\'A\' AND h5.lang=\''.$lang.'\''), 
                array('desc_unit_measure'=>'description')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), 
                array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), 
                array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id,'id_thread'=>$thread_id));
            $select->order(array('id_process','id_thread','id_type','id_cycle','id'));
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
    
    public function getIEEAByP($lang,$companies,$countries,$locations,$process,$limit,$offset){
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
        $process_id = (int) $process;
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$process_id,$limit,$offset) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.helper=\'type\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_cycle = h2.id AND h2.helper=\'cycle\' and h2.status=\'A\' AND h2.lang=\''.$lang.'\''), 
                array('desc_cycle'=>'description')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ea = h3.id AND h3.helper=\'ea\' and h3.status=\'A\' AND h3.lang=\''.$lang.'\''), 
                array('desc_ea'=>'description')
            );
            $select->join(
                array('h4'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ei = h4.id AND h4.helper=\'ei\' and h4.status=\'A\' AND h4.lang=\''.$lang.'\''), 
                array('desc_ei'=>'description')
            );
            $select->join(
                array('h5'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.unit_measure = h5.id AND h5.helper=\'um\' and h5.status=\'A\' AND h5.lang=\''.$lang.'\''), 
                array('desc_unit_measure'=>'description')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), 
                array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), 
                array('desc_thread'=>'value')
            );
            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations, 'id_process'=>$process_id));
            $select->order(array('id_process','id_thread','id_type','id_cycle','id'));
            if($limit!=0){
                $select->limit($limit);
                $select->offset($offset);
            }
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
    
    public function getIEEA($lang,$companies,$countries,$locations,$limit,$offset) {
        $companies = $this->processArray($companies);
        $countries = $this->processArray($countries);
        $locations = $this->processArray($locations);
       
        $row = $this->select(function (Select $select) use ($lang,$companies,$countries,$locations,$limit,$offset) {
            $select->join(
                array('h1'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_type = h1.id AND h1.helper=\'type\' and h1.status=\'A\' AND h1.lang=\''.$lang.'\''),
                array('desc_type'=>'description')
            );
            $select->join(
                array('h2'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_cycle = h2.id AND h2.helper=\'cycle\' and h2.status=\'A\' AND h2.lang=\''.$lang.'\''), 
                array('desc_cycle'=>'description')
            );
            $select->join(
                array('h3'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ea = h3.id AND h3.helper=\'ea\' and h3.status=\'A\' AND h3.lang=\''.$lang.'\''), 
                array('desc_ea'=>'description')
            );
            $select->join(
                array('h4'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_ei = h4.id AND h4.helper=\'ei\' and h4.status=\'A\' AND h4.lang=\''.$lang.'\''), 
                array('desc_ei'=>'description')
            );
            $select->join(
                array('h5'=>new TableIdentifier($this->table_helper, $this->schema_name)), 
                new Expression ( $this->table_name.'.unit_measure = h5.id AND h5.helper=\'um\' and h5.status=\'A\' AND h5.lang=\''.$lang.'\''), 
                array('desc_unit_measure'=>'description')
            );
            $select->join(
                array('pm'=>new TableIdentifier($this->table_process, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_process = pm.id AND pm.lang=\''.$lang.'\''), array('desc_process'=>'value')
            );
            $select->join(
                array('pt'=>new TableIdentifier($this->table_thread, $this->schema_name)), 
                new Expression ( $this->table_name.'.id_thread = pt.id AND pt.lang=\''.$lang.'\''), array('desc_thread'=>'value')
            );

            $select->where(array($this->table_name.'.status'=>'A','company'=>$companies,'country'=>$countries,'location'=>$locations));
            $select->order(array('id_process','id_thread','id_type','id_cycle','id'));
            if($limit!=0){
                $select->limit($limit);
                $select->offset($offset);
            }

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
    
    public function getIEEAById($id) {
        
        $id = $this->processArray($id);
        $row = $this->select(function (Select $select) use ($id) {
            //$select->columns(array('id','ordering','status'));
            //$select->join( array('pti'=>new TableIdentifier($this->table_i18n, $this->schema_name)),
            //    $this->table_name.'.id = pti.id', array('lang', 'value', 'mission', 'scope', 'rich_content'));
            $select->where(array('id' => (int) $id));
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
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row->id;
        $id++;
        return $id;
    }
    
    public function save(IEEA $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'id_type' => $object->getId_type(),
            'id_cycle' => $object->getId_cycle(),
            'id_process' => $object->getId_process(),
            'id_thread' => $object->getId_thread(),
            'id_ea' => $object->getId_ea(),
            'id_ei' => $object->getId_ei(),
            'quantity' => $object->getQuantity(),
            'unit_measure' => $object->getUnit_measure(),
            'influence' => $object->getInfluence(),
            'magnitude' => $object->getMagnitude(),
            'frequency' => $object->getFrequency(),
            'e_impact' => $object->getE_impact(),
            'save' => $object->getSave(),
            't_normal_c' => $object->getT_normal_c(),
            'legal_req' => $object->getLegal_req(),
            'corporative_req' => $object->getCorporative_req(),
            'voluntary_req' => $object->getVoluntary_req(),
            'total_req' => $object->getTotal_req(),
            'abnormal_ha_a' => $object->getAbnormal_ha_a(),
            'abnormal_ha_b' => $object->getAbnormal_ha_b(),
            'abnormal_ha_c' => $object->getAbnormal_ha_c(),
            'abnormal_ha_d' => $object->getAbnormal_ha_d(),
            'abnormal_im_e' => $object->getAbnormal_im_e(),
            'abnormal_im_f' => $object->getAbnormal_im_f(),
            'abnormal_su_g' => $object->getAbnormal_su_g(),
            'abnormal_factor' => $object->getAbnormal_factor(),
            'abnormal_table' => $object->getAbnormal_table(),
            'ranking' => $object->getRanking(),
            'status' => $object->getStatus(),
        );

        $id = (int) $object->getId();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getIEEAById($id)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getIEEAById($id)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'id' => $id) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object IEEA does not exist');
        }
    }

    public function updateIEEA($data,$id)
    {
        $id = (int) $id;
        $this->update($data, array('id' => $id));
    }
}

