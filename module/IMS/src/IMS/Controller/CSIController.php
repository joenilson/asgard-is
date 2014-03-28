<?php

/*
 * Copyright (C) 2014 Joe Nilson <joenilson@grupoism.com.do>
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

namespace IMS\Controller;

/**
 * Description of CSIController
 *
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;
use Zend\Escaper\Escaper;

use AsgardLib\Versioning\Documents;
use AsgardLib\Versioning\Scope;

class CSIController extends AbstractActionController {
    protected $adminusersubmodulesTable;
    protected $contentTextTable;
    protected $messagesTable;
    protected $translationTable;
    protected $processmainView;
    protected $processmainTable;
    protected $processownerTable;
    protected $processRelationsTable;
    protected $processThreadTable;
    protected $docsLibraryTable;
    protected $docsHelpersTable;
    protected $docsRequestTable;
    protected $companiesTable;
    protected $countriesTable;
    protected $locationsTable;
    protected $systemConfig;
    protected $managementindicatorsTable;
    protected $csbTable;
    protected $csiTable;
    protected $csrTable;
    protected $cssTable;
    

    public function indexAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $dataResult['contentData'] = "Contenido";
        $dataResult['lang'] = $lang;
        $dataResult['companyId'] = $userData->company;
        $dataResult['countryId'] = $userData->country;
        $dataResult['locationId'] = $userData->location;
        return new ViewModel($dataResult);
    }

    
    public function csi_resumenAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $dataResult['contentData'] = "Contenido";
        $dataResult['lang'] = $lang;
        $dataResult['companyId'] = $userData->company;
        $dataResult['countryId'] = $userData->country;
        $dataResult['locationId'] = $userData->location;
        return new ViewModel($dataResult);
        
    }
    
    public function csbAction(){
        $dataResult = array();
        $dataResult['success'] = true;
        return new ViewModel($dataResult); 
    }
    
    public function csbjsonAction(){
        $dataResult = array();
        $dataResult['success'] = true;
        return new JsonModel($dataResult); 
    }
    
    public function cssAction(){
        $dataResult = array();
        $dataResult['success'] = true;
        return new JsonModel($dataResult); 
    }
    
    private function getCSBTable()
    {
        if(!$this->csbTable){
            $sm = $this->getServiceLocator();
            $this->csbTable = $sm->get('IMS\Model\CSBTable');
        }
        return $this->csbTable;
    }
    
    private function getCSITable()
    {
        if(!$this->csiTable){
            $sm = $this->getServiceLocator();
            $this->csiTable = $sm->get('IMS\Model\CSITable');
        }
        return $this->csiTable;
    }

    private function getCSRTable()
    {
        if(!$this->csrTable){
            $sm = $this->getServiceLocator();
            $this->csrTable = $sm->get('IMS\Model\CSRTable');
        }
        return $this->csrTable;
    }

    private function getCSSTable()
    {
        if(!$this->cssTable){
            $sm = $this->getServiceLocator();
            $this->cssTable = $sm->get('IMS\Model\CSSTable');
        }
        return $this->cssTable;
    }
    
    private function getManagementIndicatorsTable()
    {
        if(!$this->managementindicatorsTable){
            $sm = $this->getServiceLocator();
            $this->managementindicatorsTable = $sm->get('IMS\Model\ManagementIndicatorsTable');
        }
        return $this->managementindicatorsTable;
    }
    
    private function getDocsHelpersTable()
    {
    	if (!$this->docsHelpersTable) {
            $sm = $this->getServiceLocator();
            $this->docsHelpersTable = $sm->get('IMS\Model\DocsHelpersTable');
    	}
    	return $this->docsHelpersTable;
    }
    
    private function getDocsLibraryTable()
    {
    	if (!$this->docsLibraryTable) {
            $sm = $this->getServiceLocator();
            $this->docsLibraryTable = $sm->get('IMS\Model\DocsLibraryTable');
    	}
    	return $this->docsLibraryTable;
    }
    
    private function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
            $sm = $this->getServiceLocator();
            $this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
    
    private function getContentTextTable()
    {
    	if (!$this->contentTextTable) {
            $sm = $this->getServiceLocator();
            $this->contentTextTable = $sm->get('IMS\Model\ContentTextTable');
    	}
    	return $this->contentTextTable;
    }
    
    private function getProcessMainTable() {
        if(!$this->processmainTable) {
            $sm = $this->getServiceLocator();
            $this->processmainTable = $sm->get('IMS\Model\ProcessMainTable');
        }
        return $this->processmainTable;
    }
    
    private function getProcessMainView() {
        if(!$this->processmainView) {
            $sm = $this->getServiceLocator();
            $this->processmainView = $sm->get('IMS\Model\ProcessMainView');
        }
        return $this->processmainView;
    }

    private function getProcessRelationsTable() {
        if(!$this->processRelationsTable) {
            $sm = $this->getServiceLocator();
            $this->processRelationsTable = $sm->get('IMS\Model\ProcessRelationsTable');
        }
        return $this->processRelationsTable;
    }
    
    private function getProcessOwnerTable() {
        if(!$this->processownerTable) {
            $sm = $this->getServiceLocator();
            $this->processownerTable = $sm->get('IMS\Model\ProcessOwnerTable');
        }
        return $this->processownerTable;
    }
    
    
    private function getProcessThreadTable() {
        if(!$this->processThreadTable) {
            $sm = $this->getServiceLocator();
            $this->processThreadTable = $sm->get('IMS\Model\ProcessThreadTable');
        }
        return $this->processThreadTable;
    }
    
    private function getMessagesTable()
    {
    	if (!$this->messagesTable) {
            $sm = $this->getServiceLocator();
            $this->messagesTable = $sm->get('Application\Model\MessagesTable');
    	}
    	return $this->messagesTable;
    }
    
    private function getTranslationTable()
    {
    	if (!$this->translationTable) {
    		$sm = $this->getServiceLocator();
    		$this->translationTable = $sm->get('Application\Model\TranslationTable');
    	}
    	return $this->translationTable;
    }
    
    private function getCompaniesTable()
    {
        if (!$this->companiesTable){
            $sm = $this->getServiceLocator();
            $this->companiesTable = $sm->get('Application\Model\CompaniesTable');
        }
        return $this->companiesTable;
    }

    
    private function getCountriesTable()
    {
        if (!$this->countriesTable){
            $sm = $this->getServiceLocator();
            $this->countriesTable = $sm->get('Application\Model\CountriesTable');
        }
        return $this->countriesTable;
    }
    
    private function getLocationsTable()
    {
        if (!$this->locationsTable){
            $sm = $this->getServiceLocator();
            $this->locationsTable = $sm->get('Application\Model\LocationsTable');
        }
        return $this->locationsTable;
    }
    
    private function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }
    
    private function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
}
