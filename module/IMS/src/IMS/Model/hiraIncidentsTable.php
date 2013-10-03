<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
//use Zend\Db\Sql\TableIdentifier;


class hiraDocumentsTable extends AbstractTableGateway {

    protected $table = 'ISOv2_Incidentes_Incidente';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function fetchAll() {
        //$resultSet = $this->select(array(new \Zend\Db\Sql\Predicate\IsNotNull('in_idProc')));
        //echo "Laguna";
        //$this->select($where=null);
        //$resultSet = $this->select();
        
        $query1="
        SELECT [in_idIncidente]
        ,'T'+CAST([in_idTipoIncidente] as varchar(2))
        ,[in_valor]
        ,[dt_FechaIncidente]
        ,CASE [in_idPais] 
            when 1 then '0002' 
            when 4 then '0003' 
            when 5 then '0001' 
            END as in_idPais
        ,CASE [in_idUbicacion] 
            when 4 then '0002'
            when 5 then '0003'
            when 6 then '0008'
            when 7 then '0003'
            when 9 then '0005'
            when 10 then '0001'
            when 11 then '0002'
            when 12 then '0006'
            when 13 then '0007'
            when 14 then '0010'
            when 15 then '0009'
            when 16 then '0004'
            end as in_idUbicacion 
        ,[in_idArea]
        ,[vc_UsuarioCreacion]
        ,[dt_FechaCreacion]
        ,[vc_UsuarioModificacion]
        ,[dt_FechaModificacion]
        ,[in_Estado]
        FROM [ISOv2_Incidentes_Incidente]";
        
        $result1 = $this->getAdapter()->query($query1,Adapter::QUERY_MODE_EXECUTE);
        $bulkIncidentsList = $result1->toArray();
        $listIncidents = array();
        for ($index = 0; $index < count($bulkIncidentsList); $index++) {
            $listIncidents[$bulkIncidentsList[$index]['idProc']]=$bulkIncidentsList[$index]['Proceso'];
        }
        
        
        return $listIncidents;
    }
    
    /*
     * Gets one severity values using id and lang
     * 
     * @param {int} ids Id of the severity
     * @param {varchar(4)} lang Language id to get the corresponding description
     * @return {object} Returns the object asociated to it: 
     *                  id_severity, lang, description, status and order
     */
    public function getDocumentList() {
        $row = $this->select(array(new \Zend\Db\Sql\Predicate\IsNotNull('in_idProc')));
        if (!$row)
            return false;
        $listItems=array();
        for ($index = 0; $index < $row->count(); $index++) {
            $listItems[]=$row->current();
            $row->next();
        }
        return $listItems;
    }
    
    public function save(hiraDocuments $object)
    {
        $data = array(
            'id_severity' => $object->getId_severity(),
            'lang' => $object->getLang(),
            'description' => $object->getDescription(),
            'status' => $object->getStatus(),
            'ordering' => $object->getOrdering()
        );

        $id_severity = (int) $object->id_severity;
        $lang = (string) $object->lang;
        
        if (!$this->getSeverityValue($id_severity,$lang)) {
            if (!$this->insert($data))
                throw new \Exception('insert statement can\'t be executed');
            return true;
        } elseif ($this->getSeverityValue($id_severity,$lang)) {
            $this->update(
                $data,
                array(
                    'id_severity' => $id_severity, 
                    'lang' => $lang,
                    )
            );
            return true;
        } else {
            throw new \Exception('id_module, or id_submodule or lang in object ContentText does not exist');
        }
    }

    public function updateHiraDocuments($ids,$lang,$data)
    {
        $id_severity = (int) $ids;
        $lang = (string) $lang;
        $this->update($data, array('id_severity' => $id_severity, 'lang' => $lang));
    }
}