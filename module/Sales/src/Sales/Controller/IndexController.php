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

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;



/**
 * Description of IndexController
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class IndexController extends AbstractActionController {
    
    protected $systemConfig;

    public function indexAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function masterdataAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function freeloansAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function agreementsAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
            
    public function rlocationAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function salesofficesAction() {
        $soap = $this->SoapPlugin();
        $listDocuments = $soap->getsalesoffices(1000);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=true;
            $data['results']="";
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    public function saleschannelsAction() {
        $soap = $this->SoapPlugin();
        $listDocuments = $soap->getsaleschannels();
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=true;
            $data['results']="";
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    //getcustomerinfo($client,$country,$office,$channel)
    public function customerinfoAction() {
        $request = $this->getRequest();
        $client = $request->getQuery('client');
        $office = $request->getQuery('offices');
        $channel = $request->getQuery('channels');
        
        $soap = $this->SoapPlugin();
        $listDocuments = $soap->getcustomerinfo($client,'DO',$office,$channel,1000);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=true;
            $data['results']="";
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    private function listSupervisor() {
        
    }
    
    private function sapConnector(){
        
        $wsdl = "http://erpqas.kolareal.com.do:8001/sap/bc/srt/wsdl/bndg_C597B55359CF1B7EE1000000C0A80373/wsdl11/allinone/standard/document?sap-client=300";
        $wsdl_prd = "http://erpapp1.kolareal.com.do:8001/sap/bc/srt/wsdl/bndg_A0EDC953C6AB1C47E1000000C0A8036B/wsdl11/allinone/standard/document?sap-client=300";
        
        /**
                *  $mappingFunctions 
                */
        $mappingFunctions = array(
            'ListSupervisor'=>'ZFmGetSupervisor',
            'getCustomerInfo'=>'ZFmGetCustomer01',
            'getRoute'=>'ZFmGetRoute',
            'getSalesChannel'=>'ZFmGetVtweg',
            'getLocation'=>'ZFmGetVkorg',
            'getEmployeeOffice'=>'ZFmGetBtrtl',
            'getEmployeeList'=>'ZFmGetEmployeeData');
        
        $soap = new Soap();
        
        try {
            $client = $soap->SoapConnection($wsdl, $this->getConfig()['soap']);
        } catch (Exception $ex) {
            error_log($ex);
        }
        
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
