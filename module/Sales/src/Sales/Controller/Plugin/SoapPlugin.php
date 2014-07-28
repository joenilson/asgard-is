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

namespace Sales\Controller\Plugin;

use Zend\Mvc\Controller\Plugin\AbstractPlugin;
use AsgardLib\Sources\Soap;

/**
 * Description of SoapPlugin
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class SoapPlugin  extends AbstractPlugin {
    
    protected $systemConfig;
    protected $wsdl = "http://erpapp1.kolareal.com.do:8001/sap/bc/srt/wsdl/bndg_A0EDC953C6AB1C47E1000000C0A8036B/wsdl11/allinone/standard/document?sap-client=300";
   
    public function connect() {
        $soap = new Soap();
        $client = $soap->SoapConnection($this->wsdl, $this->getConfig()['soap']);
        return $client;
    }
    
    public function getsalesoffices($society) {
        $dataResult = array();
        $client = $this->connect();
        $params = array ('PBukrs'=>(int) $society, 'ItT001w'=>"T001W");
        try {
            $result = $client->ZFmGetVkorg($params);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        if($result){
            foreach ($result->ItT001w as $key=>$values ){
                foreach($values as $innerValues){
                    array_push($dataResult, array('id'=>$innerValues->Werks, 'description'=>$innerValues->Werks." - ".$innerValues->Name1));
                    //$dataResult[$innerValues->Werks] = $innerValues->Werks." - ".$innerValues->Name1;
                }
            }
        }
        return $dataResult;
    }
    
    public function getsaleschannels() {
        $dataResult = array();
        $client = $this->connect();
        $params = array ('ItVtweg'=>"TVTWT");
        try {
            $result = $client->ZFmGetVtweg($params);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        if($result){
            foreach ($result->ItVtweg as $key=>$values ){
                foreach($values as $innerValues){
                    array_push($dataResult, array('id'=>$innerValues->Vtweg, 'description'=>$innerValues->Vtweg." - ".$innerValues->Vtext));
                }
            }
        }
        return $dataResult;
    }
    
    public function getcustomerinfo($customer,$country,$office,$channel,$society) {
        $dataProcess = array();
        $dataResult = array();
        $client = $this->connect();
        
        $params0 = array ('PVkorg'=>$office,
                        'ItRoute'=>"ZsdStrucRoute");
        try {
            $result0 = $client->ZFmGetRoute($params0);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        
        
        
        if($result0){
            foreach ($result0->ItRoute as $key=>$values ){
                foreach($values as $innerValues){
                    if(!isset($dataProcess[$innerValues->Auth][$innerValues->Kunnr])){
                        $dataProcess[$innerValues->Auth][$innerValues->Kunnr] = array();
                    }
                    $dataProcess[$innerValues->Auth][$innerValues->Kunnr] = array(
                                    'name'=>$innerValues->Name1Driver2,
                                    'route'=>$innerValues->Route,
                                    'Supervisor'=>$innerValues->Supervisor,
                                    'VendorCode'=>$innerValues->Driver1,
                                    'Vendor'=>$innerValues->Name1Driver1);
                }
            }
        }
        
        //echo count($dataProcess);
        
        $params1 = array ('PKunnr'=>$customer,
                        'PLand1'=>$country,
                        'PVkorg'=>$office,
                        'PVtweg'=>$channel,
                        'ItKnvv'=>"ZsdStrucKnvv");
        try {
            $result = $client->ZFmGetCustomer01($params1);
        } catch (SoapFault $exception) {
            print_r($exception);
        }
        
        //print_r($result);
        
        if($result){
            foreach ($result->ItKnvv as $key=>$values ){
                foreach($values as $innerValues){
                    if(!empty($dataProcess[$office][$innerValues->Kunnr])){
                        $moreValues = array(
                            'id'=>$innerValues->Kunnr, 
                            'inactive_status'=>$innerValues->VtextLif,
                            'inactive_reason'=>$innerValues->VtextFak,
                            'coords'=>$innerValues->Zcoord,
                            'status'=>(empty($innerValues->Au))?"Active":"Inactive",
                            'name'=>$dataProcess[$office][$innerValues->Kunnr]['name'],
                            'route'=>$dataProcess[$office][$innerValues->Kunnr]['route'],
                            'supervisor'=>$dataProcess[$office][$innerValues->Kunnr]['Supervisor'],
                            'vendor_code'=>$dataProcess[$office][$innerValues->Kunnr]['VendorCode'],
                            'vendor'=>$dataProcess[$office][$innerValues->Kunnr]['Vendor']);
                    }else{
                        $moreValues = array(                       
                            'id'=>$innerValues->Kunnr, 
                            'inactive_status'=>$innerValues->VtextLif,
                            'inactive_reason'=>$innerValues->VtextFak,
                            'coords'=>$innerValues->Zcoord,
                            'status'=>(empty($innerValues->Au))?"Active":"Inactive");
                    }
                    array_push($dataResult, $moreValues);
                }
            }
        }
        
        return $dataResult;
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
