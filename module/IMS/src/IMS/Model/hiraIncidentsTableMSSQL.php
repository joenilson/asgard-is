<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use IMS\Model\hiraIncidentTypeTable;


class hiraIncidentsTable extends AbstractTableGateway {

    protected $table = 'ISOv2_SACSAP_IdentificacionNC';

    protected $countries = array ('1'=>'0002','4'=>'0003','5'=>'0001');
    protected $countriesMSSQL = array ('0002'=>'1','0003'=>'4','0001'=>'5');
    
    protected $locations = array (
            '4'=>'0002', '5'=>'0003', '6'=>'0008', '7'=>'0003',
            '9'=>'0005', '10'=>'0001', '11'=>'0002', '12'=>'0006',
            '13'=>'0007', '14'=>'0010', '15'=>'0009', '16'=>'0004'
        );
    
    protected $locationsMSSQL = array (
            '0002'=>'4', '0003'=>'5', '0008'=>'6', '0003'=>'7',
            '0005'=>'9', '0001'=>'10', '0002'=>'11', '0006'=>'12',
            '0007'=>'13', '0010'=>'14', '0009'=>'15', '0004'=>'16'
        );
    
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    private function countriesList($country)
    {
        if(is_array($country)){
            $var_countries = "";
            //$var_countries = array ();
            $counterCountries = 0;
            foreach ($country as $value)
            {
                $separator = (count($country)==$counterCountries)?"":",";
                //$var_countries[]=$this->countriesMSSQL[$value];
                $var_countries+="{$this->countriesMSSQL[$value]}".$separator;
            }
        }else{
            $var_countries = $this->countriesMSSQL[$country];
        }
        return $var_countries;
    }
    
    private function locationsList($location)
    {
        if(is_array($location)){
            $var_locations = "";
            //$var_locations = array ();
            $counterLocations = 0;
            foreach ($location as $value)
            {
                $separator = (count($location)==$counterLocations)?"":",";
                //$var_locations[]=$this->locationsMSSQL[$value];
                $var_locations+="{$this->locationsMSSQL[$value]}".$separator;
            }
        }else{
            $var_locations = $this->locationsMSSQL[$location];
        }
        
        return $var_locations;
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
    
    public function getIncidentsDetails($country,$location,$dateValue,$lang)
    {
        $var_countries = $this->countriesList($country);
        $var_locations = $this->locationsList($location);

        $time=strtotime($dateValue);

        $month=date("m",$time);
        $year=date("Y",$time);
        
        $first = date('d-m-Y', mktime(0, 0, 0, $month, 1, $year));
        $last = date('t-m-Y', mktime(0, 0, 0, $month, 1, $year));

        $thisTime = strtotime($first);
        $endTime = strtotime($last);

        
        $query1="select 
        INC.in_IdIdentificacionNC,
        INC.in_IdTipoNC, 
        INC.in_IdEstadoNC,
        ITI.vc_tipoIncidente AS vc_TipoIncidente,
        INC.in_IdTipoIncidente, 
        in_IdPais,
        INC.in_IdUbicacion as in_IdUbicacion,
        vc_Descripcion,
        vc_ApellidoP+' '+vc_ApellidoM+', '+vc_Nombre as vc_fullName, 
        vc_Email, 
        INC.vc_UsuarioCreacion as vc_UsuarioCreacion, 
        INC.dt_FechaCreacion as dt_FechaCreacion, 
        INC.in_Estado as in_Estado
        from ISOv2_SACSAP_IdentificacionNC as INC, ISOv2_Ubicacion as U, ISOv2_Incidentes_TipoIncidente as ITI
        where [in_IdTipoNC] = 3 and INC.in_IdUbicacion = U.in_idUbicacion AND 
        ITI.in_idtipoincidente = INC.in_IdTipoIncidente AND 
        U.in_idPais IN ($var_countries) AND U.in_idUbicacion IN ($var_locations) 
        and INC.dt_FechaCreacion = '$dateValue'
        order by INC.in_IdTipoIncidente, INC.dt_FechaCreacion ;";
        
        //echo $query1;
        $resultQuery = $this->getAdapter()->query($query1,Adapter::QUERY_MODE_EXECUTE);
        
        $bulkData = $resultQuery->toArray();
        
        return $bulkData;

        
    }
    
    public function getIncidentsListFiltered($country,$location,$dateValue,$lang)
    {
        
        $var_countries = $this->countriesList($country);
        $var_locations = $this->locationsList($location);
        
        $time=strtotime($dateValue);

        $month=date("m",$time);
        $year=date("Y",$time);
        
        $first = date('d-m-Y', mktime(0, 0, 0, $month, 1, $year));
        $last = date('t-m-Y', mktime(0, 0, 0, $month, 1, $year));

        $thisTime = strtotime($first);
        $endTime = strtotime($last);
        
        $queryResumen="SELECT * FROM view_incidents_list 
        WHERE in_idPais IN ($var_countries) AND in_idUbicacion IN ($var_locations) 
        and (DATEPART(yy, dt_FechaCreacion) = $year
         AND DATEPART(mm, dt_FechaCreacion) = $month ) ORDER BY dt_FechaCreacion ASC";
        //echo $queryResumen;
        $resultResumen = $this->getAdapter()->query($queryResumen,Adapter::QUERY_MODE_EXECUTE);
        
        $bulkIncidents = $resultResumen->toArray();
        
        $resumenIncidents = array();
        
        for ($idx=0; $idx < count($bulkIncidents); $idx++)
        {
            $resumenIncidents[$bulkIncidents[$idx]['dt_FechaCreacion']][$bulkIncidents[$idx]['in_IdTipoIncidente']]+=$bulkIncidents[$idx]['quantityIncidents'];
        }
        
        
        $listIncidents=array();
        $counterList=0; $counterDate=array();
        while($thisTime <= $endTime)
        {
            $thisDate = date('Y-m-d', $thisTime);
            $listIncidents[$counterList]['dt_fechaCreacion']=$thisDate;
            foreach($resumenIncidents[$thisDate] as $key=>$values){
                $listIncidents[$counterList][$key]=$values;
                $counterDate[$thisDate]+=$values;
            }
            //$listIncidents[$counterList]['summaryIncidents']=count($resumenIncidents[$thisDate]);
            $listIncidents[$counterList]['summaryIncidents']=$counterDate[$thisDate];
            $thisTime = strtotime('+1 day', $thisTime); // increment for loop
            $counterList++;
        }

        //var_dump($listIncidents);
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