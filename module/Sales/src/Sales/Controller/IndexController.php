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

namespace Sales\Controller;

use AsgardLib\Sources\Soap;

/**
 * Description of IndexController
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class IndexController {
    
    protected $systemConfig;

    public function indexAction(){
        
    }
    
    public function sapConnector(){
        
        $wsdl = "http://erpqas.kolareal.com.do:8001/sap/bc/srt/wsdl/bndg_C597B55359CF1B7EE1000000C0A80373/wsdl11/allinone/standard/document?sap-client=300";
        $mappingFunctions = array(
            'ListSupervisor'=>'ZFmGetSupervisor',
            'getCustomerInfo'=>'ZFmGetCustomer01',
            'getRoute'=>'ZFmGetRoute',
            'getSalesChannel'=>'ZFmGetVtweg',
            'getLocation'=>'ZFmGetVkorg');
        
        $soap = new Soap();
        $client = $soap->SoapConnection($wsdl, $this->getConfig()['soap']);
        
    }
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }
    
    protected function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
    
}
