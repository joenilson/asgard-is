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
                    $moreValues = array(
                        'id'=>$innerValues->Pernr,
                        'surname'=>$innerValues->Nachn,
                        'lastname'=>$innerValues->Nach2,
                        'firstname'=>$innerValues->Cname,
                        'position'=>ucfirst(strtolower($innerValues->Plstx)),
                        'work'=>ucfirst(strtolower($innerValues->Orgtx)),
                        'birthday'=>str_replace('.', '-', $innerValues->Nacimiento),
                        'office'=>$office);
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
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getController()->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }   
}