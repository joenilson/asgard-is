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
use IMS\Model\Entity\SimulationPhotos;

class SimulationPhotosTable extends AbstractTableGateway {

    protected $table_name = 'simulation_photos';
    protected $albums_table_name = 'simulation_albums';
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
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            //$select->order(array('class_req,type_req ASC','country,company,location,id ASC'));
        });
        return $resultSet->toArray();
    }
    
    public function getObjectByAlbum($album)
    {
        $row = $this->select(function (Select $select) use ($album){
            $select->where(array('id_album'=>(int) $album,
                                'status'=>'A'));
            $select->order('id DESC');
        });
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getObjectByAlbumId($album,$id)
    {
        $row = $this->select(function (Select $select) use ($album,$id){
            $select->where(array('id_album'=>(int) $album,
                                'id'=>(int) $id));
            //$select->order('class_req,type_req ASC');
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
        $id = $row->id;
        $id++;
        return $id;
    }
   
    public function save(SimulationPhotos $object)
    {
        $data = array(
            'id_album' => $object->getId_album(),
            'id' => $object->getId(),
            'date_simulation' => $object->getDate_simulation(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
        );
        
        $id = (int) $object->getId();
        $album = (int) $object->getId_album();
        $file = (int) $object->getFilename();
        $thumb = (int) $object->getThumbnail();
        if(empty($id)){
            $id = $this->getNextId();
            $data['id'] = $id;
        }
        
        if(!empty($file)){
            $data['filename']=$file;
        }
        if(!empty($file)){
            $data['thumbnail']=$thumb;
        }
        
        if (!$this->getObjectByAlbumIdId($album,$id)) {
            $data['date_creation']= $object->getDate_creation();
            $data['user_creation'] = $object->getUser_creation();
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return $data['id'];
        } elseif ($this->getObjectByAlbumId($album,$id)) {
            $data['date_modification']=date('Y-m-d h:i:s');
            $data['user_modification'] = $data['user_id'];
            $this->update( $data, 
                    array('id' => $id, 'id_album' => $album) );
            return $data['id'];
        } else {
            throw new \Exception('album or id in object Simulations Photos does not exist');
        }
    }

    public function updateObject($album,$id,$data)
    {
        $album = (int) $album;
        $id = (int) $id;
        $this->update($data, array('id_album'=> $album,'id' => $id));
    }
}
