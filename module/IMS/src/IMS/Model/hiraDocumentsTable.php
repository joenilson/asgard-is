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
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraDocuments;

class hiraDocumentsTable extends AbstractTableGateway {

    protected $table = 'ISOv2_IPER_Peligro_Riesgo';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function fetchAll() {
        //$resultSet = $this->select(array(new \Zend\Db\Sql\Predicate\IsNotNull('in_idProc')));
        //echo "Laguna";
        //$this->select($where=null);
        //$resultSet = $this->select();
        
        $query1="SELECT [idProc]
            ,[Proceso]
            ,[idProcSup]
        FROM [Proceso]
        WHERE tipo = 't' 
        order by idProc";
        $result1 = $this->getAdapter()->query($query1,Adapter::QUERY_MODE_EXECUTE);
        $bulkTypeProcess = $result1->toArray();
        $listTypeProcess = array();
        for ($index = 0; $index < count($bulkTypeProcess); $index++) {
            $listTypeProcess[$bulkTypeProcess[$index]['idProc']]=$bulkTypeProcess[$index]['Proceso'];
        }
        
        $query2="SELECT [idProc]
            ,[Proceso]
            ,[idProcSup]
        FROM [Proceso]
        WHERE tipo = 'p' 
        order by idProc";
        $result2 = $this->getAdapter()->query($query2,Adapter::QUERY_MODE_EXECUTE);
        $bulkListProcess = $result2->toArray();
        $listProcess = array();
        for ($index = 0; $index < count($bulkListProcess); $index++) {
            $listProcess[$bulkListProcess[$index]['idProc']]=array(
                'idProcSup'=>$bulkListProcess[$index]['idProcSup'],
                'idProcSupDesc'=>$listTypeProcess[$bulkListProcess[$index]['idProcSup']],
                'idProcDesc'=>$bulkListProcess[$index]['Proceso']
            );
        }
        
        $query3="select 
		iper_pr.[in_idPeligroRiesgo]
                ,iper_pr.[in_idPeligro]
                ,iper_p.[vc_Descripcion] as in_PeligroDesc
                ,iper_pr.[in_idRiesgo]
                ,iper_r.[vc_Descripcion] as in_RiesgoDesc
                ,iper_proc.[idProcSup] as in_ProcesoSup
                ,iper_pr.[in_idProc]
                ,iper_proc.[Proceso] as in_ProcesoDesc
                ,iper_pr.[in_EI_A]
                ,iper_pr.[in_EI_M]
                ,iper_pr.[in_EI_B]
                ,iper_pr.[vc_MedidasControl]
                ,iper_pr.[in_ER_A]
                ,iper_pr.[in_ER_M]
                ,iper_pr.[in_ER_B]
                ,iper_pr.[dt_FechaCreacion]
                ,iper_pr.[vc_UsuarioCreacion]
                ,iper_pr.[dt_FechaModificacion]
                ,iper_pr.[vc_UsuarioModificacion]
                ,iper_pr.[in_Estado]
                ,iper_pr.[in_idUbicacion]
                ,iper_pr.[in_idMaquinaria] 
            from 
                [ISOv2_IPER_Peligro_Riesgo] as iper_pr,
                [ISOv2_IPER_Peligro] as iper_p,
                [ISOv2_IPER_Riesgo] as iper_r,
                [Proceso] as iper_proc
            where 
                iper_pr.in_idProc IS NOT NULL and iper_pr.vc_MedidasControl !='' and 
                iper_pr.vc_MedidasControl IS NOT NULL and iper_pr.in_Estado=1 and
                iper_pr.in_idPeligro = iper_p.in_idPeligro and
                iper_pr.in_idRiesgo = iper_r.in_idRiesgo and
                iper_pr.in_idProc = iper_proc.idProc
                order by iper_pr.in_idPeligroRiesgo";
        $result3 = $this->getAdapter()->query($query3,Adapter::QUERY_MODE_EXECUTE);
        if (!$result3)
            return false;
        $listItems=array();
        
        $bulkData =$result3->toArray();
       
        //echo $row->toArray();
        
        for ($index = 0; $index < count($bulkData); $index++) {
            $listItems[$index]['in_idPeligroRiesgo']=$bulkData[$index]['in_idPeligroRiesgo'];
            $listItems[$index]['in_idPeligro']=$bulkData[$index]['in_idPeligro'];
            $listItems[$index]['in_PeligroDesc']=$bulkData[$index]['in_PeligroDesc'];
            $listItems[$index]['in_idRiesgo']=$bulkData[$index]['in_idRiesgo'];
            $listItems[$index]['in_RiesgoDesc']=$bulkData[$index]['in_RiesgoDesc'];
            $listItems[$index]['in_TypeProcess']=$listProcess[$bulkData[$index]['in_ProcesoSup']]['idProcSup'];
            $listItems[$index]['in_TypeProcessDesc']=$listProcess[$bulkData[$index]['in_ProcesoSup']]['idProcSupDesc'];
            $listItems[$index]['in_ProcessSup']=$bulkData[$index]['in_ProcesoSup'];
            $listItems[$index]['in_ProcessSupDesc']=$listProcess[$bulkData[$index]['in_ProcesoSup']]['idProcDesc'];
            $listItems[$index]['in_idProc']=$bulkData[$index]['in_idProc'];
            $listItems[$index]['in_ProcesoDesc']=$bulkData[$index]['in_ProcesoDesc'];
            $listItems[$index]['in_EI_A']=$bulkData[$index]['in_EI_A'];
            $listItems[$index]['in_EI_M']=$bulkData[$index]['in_EI_M'];
            $listItems[$index]['in_EI_B']=$bulkData[$index]['in_EI_B'];
            $listItems[$index]['vc_MedidasControl']=strip_tags($bulkData[$index]['vc_MedidasControl']);
            $listItems[$index]['in_ER_A']=$bulkData[$index]['in_ER_A'];
            $listItems[$index]['in_ER_M']=$bulkData[$index]['in_ER_M'];
            $listItems[$index]['in_ER_B']=$bulkData[$index]['in_ER_B'];
            $listItems[$index]['dt_FechaCreacion']=$bulkData[$index]['dt_FechaCreacion'];
            $listItems[$index]['vc_UsuarioCreacion']=$bulkData[$index]['vc_UsuarioCreacion'];
            $listItems[$index]['dt_FechaModificacion']=$bulkData[$index]['dt_FechaModificacion'];
            $listItems[$index]['vc_UsuarioModificacion']=$bulkData[$index]['vc_UsuarioModificacion'];
            $listItems[$index]['in_Estado']=$bulkData[$index]['in_Estado'];
            $listItems[$index]['in_idUbicacion']=$bulkData[$index]['in_idUbicacion'];
            $listItems[$index]['in_idMaquinaria']=$bulkData[$index]['in_idMaquinaria'];
        }
        
        return $listItems;
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