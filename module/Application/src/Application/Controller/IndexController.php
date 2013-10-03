<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{
    protected $applicationTable;
    protected $companiesTable;
    protected $modulesTable;
    protected $modulesI18nTable;
    
    public function indexAction()
    {
        $userData = $this->getServiceLocator()->get('userSessionData');
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        if($userPrefs[0]['lang'] != 'en'){
            $this->getViewHelper('HeadScript')->appendFile("/js/web/app/locales/app_locale_{$userPrefs[0]['lang']}.js","text/javascript");
            $this->getViewHelper('HeadScript')->appendFile("/js/extjs/locale/ext-lang-{$userPrefs[0]['lang']}.js","text/javascript");
        }
        
        
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/form/field/ClearButton.js","text/javascript");
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/form/field/OperatorButton.js","text/javascript");
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/grid/column/ActionPro.js","text/javascript");
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/grid/FilterBar.js","text/javascript");
        //$this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/grid/FilterBarOriginal.js","text/javascript");
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/grid/AutoResizer.js","text/javascript");
        
        $this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/form/field/Month.js","text/javascript");
        
        $this->getViewHelper('HeadLink')->appendStylesheet("/css/overrides.css");
        $this->getViewHelper('HeadLink')->appendStylesheet("/css/uxs.css");
        
        //$this->getViewHelper('HeadScript')->appendFile("/js/extjs/src/ux/grid/xFilterRow.js","text/javascript");
        
        return new ViewModel(array('username'=>$userData->realname));
    }
    
    public function presentationAction()
    {
        $layout = $this->layout();
        $layout->setTemplate('layout/contentlayout');
        /*
        if($this->getServiceLocator()->get('layoutType') == 'web' ){
        	$layout->setTemplate('layout/contentlayout');
        }else{
        	$layout->setTemplate('layout/mobilecontentlayout');
        }
         */
       
        $userData = $this->getServiceLocator()->get('userSessionData');
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        //print_r($userData);
        $dataApplication=$this->getApplicationTable()->fetchAll();
        //print_r($dataApplication);
        $dataModules=$this->getModulesTable()->getModule($dataApplication[0]['app_module_default']);
        $moduleReview=$dataModules->majorversion.".".$dataModules->minorversion.".".$dataModules->patch.".".$dataModules->build;
        $dataI18nModules=$this->getModulesI18nTable()->getModuleValuesByIdAndKey($userPrefs[0]['lang'],$dataModules->mid,$dataModules->mshortdesc);
        //print_r($dataModules);
        //echo $dataModules->date_revision;
       
        $dataCompany=$this->getCompaniesTable()->getCompanyById($userData->company);
        //$dateRevision=date_format(strtotime($dataModules->date_revision),"Y-m-d");
        return new ViewModel(array('lang'=>$userPrefs[0]['lang'], 
            'companyName'=>$dataCompany[0]['legal_name'],
            'systemDescription'=>$dataApplication[0]['app_name'],
            'defaultModule'=>$dataModules->mid,
            'presentationContentHeader'=>$dataI18nModules->value,
            'presentationContentReview'=>$moduleReview,
            'presentationContentApproved'=>$dataModules->date_revision));
    }
    
    public function getApplicationTable()
    {
    	if (!$this->applicationTable) {
    		$sm = $this->getServiceLocator();
    		$this->applicationTable = $sm->get('Application\Model\ApplicationTable');
    	}
    	return $this->applicationTable;
    }
    
    public function getCompaniesTable()
    {
    	if (!$this->companiesTable) {
    		$sm = $this->getServiceLocator();
    		$this->companiesTable = $sm->get('Application\Model\CompaniesTable');
    	}
    	return $this->companiesTable;
    }
    
    public function getModulesTable()
    {
    	if (!$this->modulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->modulesTable = $sm->get('Application\Model\ModulesTable');
    	}
    	return $this->modulesTable;
    }
    
    public function getModulesI18nTable()
    {
    	if (!$this->modulesI18nTable) {
    		$sm = $this->getServiceLocator();
    		$this->modulesI18nTable = $sm->get('Application\Model\ModulesI18nTable');
    	}
    	return $this->modulesI18nTable;
    }
        
    protected function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
}
