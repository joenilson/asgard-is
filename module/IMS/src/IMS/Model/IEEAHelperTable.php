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
use IMS\Model\Entity\IEEAHelper;
use Zend\Db\Adapter\AdapterAwareInterface;
use Zend\Db\ResultSet\HydratingResultSet;


class IEEAHelperTable extends AbstractTableGateway 
    implements AdapterAwareInterface {

    protected $table_name = 'ieea_helper';
    protected $schema_name = 'ims';

    private function processList($value)
    {
        if(is_array($value)){
            $var_values = "";
            $counterValues = 0;
            foreach ($value as $val)
            {
                $separator = (count($value)==$counterValues)?"":",";
                $var_values+="{$val}".$separator;
            }
        }else{
            $var_values = $value;
        }
        return $var_values;
    }
    public function setDbAdapter(Adapter $adapter)
    {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
        $this->resultSetPrototype = new HydratingResultSet();
        
        $this->initialize();
    }
    
    /*
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }
    */
    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order(array('helper','id'));
        });
        return $resultSet->toArray();
    }
    
    public function getHelpers($lang)
    {
        $row = $this->select(function (Select $select) use ($lang){
            $select->where(array('lang'=>(string) $lang,
                                'status'=>(string) 'A'));
            $select->order(array('helper','id ASC'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperByIdLang($type,$id,$lang)
    {
        $row = $this->select(function (Select $select) use ($type,$id,$lang){
            $select->where(array('lang'=>(string) $lang,
                                'helper'=>(int) $type,
                                'id'=>(int) $id,
                                'status'=>(string) 'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperById($type,$id)
    {
        $row = $this->select(function (Select $select) use ($type,$id){
            $select->where(array('helper'=>(int) $type,
                                'id'=>(int) $id,
                                'status'=>(string) 'A'));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getHelperByAspectCode($lang,$helper,$aspectCode)
    {
        $row = $this->select(function (Select $select) use ($lang, $helper,$aspectCode){
            $select->where(array('helper'=>(int) $helper,
                                'aspect_code'=>(int) $aspectCode,
                                'lang' => $lang));
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getNextId() {
        $resultSet = $this->select(function (Select $select) {
            $select->columns(array(new Expression('max(id) as id')));
        });
        $row = $resultSet->current();
        $id = $row['id'];
        $id++;
        return $id;
    }
   
    public function getHelpersByType($lang,$helper)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper) {
            $select->columns(array('helper','id','aspect_code','aspect_type','lang','description','description_impact','legal_requirement'));
            $select->where(array('status'=>'A','lang'=>$lang, 'helper'=>$helper));
            $select->order(array('helper','aspect_type','aspect_code'));
            //echo $select->getSqlString();
        });
        
        if (!$rows)
            return false;
        
        $listItems=array();
        for ($index = 0; $index < $rows->count(); $index++) {
            $data = $rows->current();
            $listItems[$data['aspect_code']]['description']=$data['description'];
            $listItems[$data['aspect_code']]['description_impact']=$data['description_impact'];
            $listItems[$data['aspect_code']]['legal_requirement']=$data['legal_requirement'];
            $rows->next();
        }
        return $listItems;
    }
    
    public function getHelpersByTypeRaw($lang,$helper)
    {
        $rows = $this->select(function (Select $select) use ($lang,$helper) {
            $select->join(
                array('ih'=>new TableIdentifier($this->table_name, $this->schema_name)), 
                new Expression( $this->table_name.'.aspect_type = ih.id AND ih.helper=\'aspect_type\' AND ih.lang=\''.$lang.'\''), array('aspect_type_desc'=>'description' )
            );
            $select->columns(array('helper','id','id_type','lang','description','description_aspect','legal_requirement'));
            $select->where(array($this->table_name.'.status'=>'A',$this->table_name.'.lang'=>$lang, $this->table_name.'.helper'=>$helper));
            $select->order(array('helper','aspect_type','aspect_code'));
            //echo $select->getSqlString();
        });
        
        if (!$rows)
            return false;
        return $rows->toArray();
    }
    
    
    
    public function save(IEEAHelper $object)
    {
        $data = array(
            'lang' => $object->getLang(),
            'helper' => $object->getHelper(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'ordering' => $object->getOrdering(),
            'aspect_code' => $object->getAspect_code(),
            'aspect_type' => $object->getAspect_type(),
            'description_impact' => $object->getDescription_impact(),
            'legal_requirement' => $object->getLegal_requirement()
        );
        
        $id = (int) $object->getId();
        $helper = (string) $object->getHelper();
        $lang = (string) $object->getLang();
        $aspectType = (int) $object->getAspect_type();
        $aspectCode = (string) $object->getAspect_code();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if (!$this->getHelperById($id)) {
            $data['user_creation']=$object->getUser_creation();
            $data['date_creation']=$object->getDate_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getHelperByAspectCode($lang,$helper,$aspectCode)) {
            $data['date_modification'] = $object->getDate_creation();
            $data['user_modification'] = $object->getUser_creation();
            $this->update( $data, 
                    array('helper'=> $helper,'aspect_code'=> $aspectCode,'lang'=>$lang) );
            return $data['id'];
        } else {
            throw new \Exception('company or country or location or id in object IEEA Helper does not exist');
        }
    }

    public function updateIEEAHelper($lang,$helper,$aspectCode,$data)
    {
        $this->update($data, array('lang'=> $lang,'helper'=> $helper,'aspect_code'=>$aspectCode));
    }
}
