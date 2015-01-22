<?php

/*
 * Copyright (C) 2014 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace HCM\Controller\Plugin;

use Zend\Mvc\Controller\Plugin\AbstractPlugin;
use AsgardLib\Sources\Soap;

/**
 * Description of SoapPlugin
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class SoapPlugin  extends AbstractPlugin {
    
    protected $systemConfig;
    protected $employeeDependants;
    protected $messagesTable;
    protected $wsdl = "http://erpapp1.kolareal.com.do:8001/sap/bc/srt/wsdl/bndg_BD75D653BC74CC2DE1000000C0A80374/wsdl11/allinone/standard/document?sap-client=300";
   
    public function connect() {
        ini_set('default_socket_timeout', 100000);
        $soap = new Soap();
        $client = $client = $soap->SoapConnection($this->wsdl, $this->getConfig()['soap']);
        return $client;
    }
    
    public function getemployeeoffices($society) {
        $dataResult = array();
        $client = $this->connect();
        $params = array ('PWerks'=>array('Werks'=>$society), 'ItT001p'=>"T001P");
        try {
            $result = $client->ZFmGetBtrtl($params);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        if($result){
            foreach ($result->ItT001p as $key=>$values ){
                foreach($values as $innerValues){
                    array_push($dataResult, array('id'=>$innerValues->Btrtl, 'description'=>$innerValues->Btrtl." - ".$innerValues->Btext));
                }
            }
        }
        return $dataResult;
    }
    
    private function getemployees($office) {
        $dataProcess = array();
        $dataResult = array();
        ini_set('default_socket_timeout', 100000);
        $client = $this->connect();

        $params1 = array ('PBtrtl'=>$office,
                        'ItPernr'=>"ZsdStrucEmployeeData",
                        'connection_timeout'=>180000);
        try {
            $result = $client->ZFmGetEmployeeData($params1);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        
        if($result){
            foreach ($result->ItPernr as $key=>$values){
                foreach($values as $innerValues){
                    $numberDependents = 0;
                    $sqlDependents = $this->getController()->getEmployeesDependantsTable();
                    $numberDependents = $sqlDependents->getNumberDependantsById($innerValues->Pernr);
                    $moreValues = array(
                        'id'=>$innerValues->Pernr,
                        'surname'=>$innerValues->Nachn,
                        'lastname'=>$innerValues->Nach2,
                        'firstname'=>$innerValues->Cname,
                        'position'=>ucfirst(strtolower($innerValues->Plstx)),
                        'work'=>ucfirst(strtolower($innerValues->Orgtx)),
                        'birthday'=>str_replace('.', '-', $innerValues->Nacimiento),
                        'office'=>$innerValues->Btrtl,
                        //'processed'=>$numberDependents);
                        'processed'=>($numberDependents!=0)?true:false);
                    array_push($dataResult, $moreValues);
                }
            }
        }
        return $dataResult;
    }
    
    public function getemployeesList($listOffices){
        $dataResult = array();
        if(is_array($listOffices)){
            foreach($listOffices as $office){
                $dataResult = array_merge($this->getemployees($office), $dataResult);
            }
        } else {
            $dataResult = $this->getemployees($office);
        }
        return $dataResult;
    }
    
    public function getemployeesReport($listOffices){
        $preResult = $this->getemployeesList($listOffices);
        $dataResult = array();
        foreach ($preResult as $value){
            $dependantsResult = $this->getDependants($value['id']);
            $dataResult[]= array('id'=>$value['id'],
            'surname'=>$value['surname'],
            'lastname'=>$value['lastname'],
            'firstname'=>$value['firstname'],
            'position'=>$value['position'],
            'work'=>$value['work'],
            'office'=>$value['office'],
            'birthday'=>$value['birthday'],
            'processed'=>$dependantsResult['processed'],
            'age'=>$this->personAge($value['birthday']),
            'marital_status'=>$dependantsResult['couple'],
            'children_male'=>$dependantsResult['children_male'],
            'children_female'=>$dependantsResult['children_female']);
        }
        return $dataResult;
    }
    
    public function getemployeesChart($query_type,$listOffices,$lang){
        $preResult = $this->getemployeesList($listOffices);
        $dataResult = array();
        foreach ($preResult as $value){
            $dataResult[]=$value['id'];
        }
        //echo count($dataResult);
        $result = $this->getResumeChart($query_type,$dataResult,$lang);
        return $result;
    }
    
    private function getResumeChart($query_type,$ids,$lang){
        if($query_type!='' and count($ids)!=0){
            $sql = $this->getEmployeeDependatsTable();
            $data = $sql->getDependantsGroupedByType($query_type,$ids);
            $result = $this->processDependantsGroup($query_type,$data,$lang);
            return $result;
        }
    }
    
    private function getDependants($id_employee){
        if($id_employee!==0){
            $sql = $this->getEmployeeDependatsTable();
            $data = $sql->getDependantsGroupedById($id_employee);
            $result = $this->processDependants($data);
            return $result;
        }
    }
    
    private function processDependants($dataList){
        if (count($dataList)!=0){
            foreach ($dataList as $value){
                $result['processed']=true;
                $result['couple']=($value['type']=='none')?'no':'yes';
                $result['children_male']=($value['type']=='children' AND $value['gender']=='male')?$value['number']:0;
                $result['children_female']=($value['type']=='children' AND $value['gender']=='female')?$value['number']:0;
            }
        }else{
            $result['processed']=false;
            $result['couple']='no';
            $result['children_male']=0;
            $result['children_female']=0;
        }
        return $result;
    }
    
    private function processDependantsGroup($type,$data,$lang){
        $dataResponse = array();
        $sql = $this->getMessagesTable();
        if(count($data)==0){
            return $dataResponse;
        }else{
            if($type!=='type'){
                foreach($data as $values){
                    $key = $values['min']." - ".$values['max'];
                    $dataResponse[]=array('name' => $key,'number' => $values['number']);
                }
            }else{
                foreach($data as $values){
                    $tipeValue = $sql->getMessage($lang,$values['type']);
                    $genderValue = $sql->getMessage($lang,$values['gender']);
                    $key = $tipeValue->value." - ".$genderValue->value;
                    $dataResponse[]=array('name' => $key,'number' => $values['number']);
                }
            }
            return $dataResponse;
        }
    }
    
    private function personAge($date){
        $interval = date_diff(date_create(), date_create($date));
        $age = $interval->format("%Y, %m");
        return $age;
    }

    private function getEmployeeDependatsTable(){
        if(!$this->employeeDependants) {
            $sm = $this->getController()->getServiceLocator();
            $this->employeeDependants = $sm->get('HCM\Model\EmployeesDependantsTable');
        }
        return $this->employeeDependants;
    }
    
    public function getMessagesTable()
    {
    	if (!$this->messagesTable) {
            $sm = $this->getController()->getServiceLocator();
            $this->messagesTable = $sm->get('Application\Model\MessagesTable');
    	}
    	return $this->messagesTable;
    }
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getController()->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }   
}