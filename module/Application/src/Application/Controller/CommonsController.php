<?php
namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;

/**
 * CommonsController
 *
 * @author
 *
 * @version
 *
 */
class CommonsController extends AbstractActionController
{
    protected $modulesTable;
    protected $submodulesTable;
    protected $usermodulesTable;
    protected $usersubmodulesTable;
    protected $adminusermodulesTable;
    protected $adminusersubmodulesTable;
    
    protected $companiesTable;
    protected $countriesTable;
    protected $locationsTable;
    
    /**
     * The default action - show the home page
     */
    public function indexAction()
    {
        // TODO Auto-generated CommonsController::indexAction() default action
        return new ViewModel();
    }
    
    public function getcompaniesAction()
    {
        if (! $this->getServiceLocator()->get('AuthService')->hasIdentity()){
    	   return $this->redirect()->toRoute('login');
    	}
        $request = $this->getRequest();
        if ($request->isGet()){
            $Companies = $this->getCompaniesTable()->fetchAll();
            $data=array('success'=>true,'results'=>$Companies);
        }else{
            $data=array('success'=>false);
        }
        $result = new JsonModel($data);
    	return $result;
    }

    public function getcountriesAction()
    {
        if (! $this->getServiceLocator()->get('AuthService')->hasIdentity()){
    	   return $this->redirect()->toRoute('login');
    	}
        $request = $this->getRequest();
        if ($request->isGet() AND $request->getQuery('cid')==='' OR !$request->getQuery('cid')){
            $Countries = $this->getCountriesTable()->fetchAll();
            $data=array('success'=>true,'results'=>$Countries);
        }elseif ($request->isGet() AND $request->getQuery('cid')!==''){
            $company_id = (string) $request->getQuery('cid');
            $Countries = $this->getCountriesTable()->getCountriesByCompany($company_id);
            //print_r($Countries);
            $data=array('success'=>true,'results'=>$Countries);
        }else{
            $data=array('success'=>false);
        }
        return new JsonModel($data);
    }
    
    public function getlocationsAction()
    {
        if (! $this->getServiceLocator()
    	 		->get('AuthService')->hasIdentity()){
    	   return $this->redirect()->toRoute('login');
    	}
        $request = $this->getRequest();
        if ($request->isGet() AND $request->getQuery('cid')!==''){
            $country_id = (string) $request->getQuery('cid');
            $Locations = $this->getLocationsTable()->getLocationsByCountry($country_id);
            $data=array('success'=>true,'results'=>$Locations);
        }else{
            $data=array('success'=>false);
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    public function getmenusAction()
    {
    	/*
    	 if (! $this->getServiceLocator()
    	 		->get('AuthService')->hasIdentity()){
    	return $this->redirect()->toRoute('login');
    	}
    	*/
        //echo $this->users;
        //echo print_r($userData);
        $request = $this->getRequest();
    	if ($request->isPost() && $request->getPost('module')=='menu'){
    		$ModulesTable=$this->getModulesTable();
    		//print_r($ModulesTable->fetchAll());
    		$data=array('success'=>true,'results'=>$ModulesTable->fetchAll());
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }
    
    public function getsubmenusAction()
    {
    	/*
    	 if (! $this->getServiceLocator()
    	 		->get('AuthService')->hasIdentity()){
    	return $this->redirect()->toRoute('login');
    	}
    	*/
    	$request = $this->getRequest();
    	if ($request->isPost() && $request->getPost('module')=='submenu'){
    		$SubmodulesTable=$this->getSubmodulesTable();
    		if($request->getPost('node')=='root'){
    			$results=$SubmodulesTable->getSubmodulesByMid($request->getPost('idmenu'));
    		}else{
    			$results=$SubmodulesTable->getSubmodulesBySmid($request->getPost('idmenu'),$request->getPost('node'));
    		}
    
    		//print_r($results);
    		if(empty($results)){
    			$data=array('success'=>false);
    		}else{
    			$data=array('success'=>true,'nodes'=>$results);
    		}
    		//$SubmodulesTable->getSubmodules($request->getPost('idmenu'));
    		//$data=array('success'=>true);
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }
    
    public function getusermenusAction()
    {
    	
    	if (! $this->getServiceLocator()
    	 		->get('AuthService')->hasIdentity()){
    	   return $this->redirect()->toRoute('login');
    	}
    	
    	$userData = $this->getServiceLocator()->get('userSessionData');
    	$userPrefs = $this->getServiceLocator()->get('userPreferences');
    	//print_r($userData);
    	$request = $this->getRequest();
    	if ($request->isPost() && $request->getPost('module')=='menu' ){
    		$UserModulesTable=$this->getUserModulesTable();
    		$data=array('success'=>true,'results'=>$UserModulesTable->getUserModule($userData->id,$userPrefs[0]['lang']));
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }
    
    public function getusersubmenusAction()
    {
    	
    	if (! $this->getServiceLocator()
    	 		->get('AuthService')->hasIdentity()){
    	return $this->redirect()->toRoute('login');
    	}
    	$userData = $this->getServiceLocator()->get('userSessionData');
    	$userPrefs = $this->getServiceLocator()->get('userPreferences');
    	$request = $this->getRequest();
    	if ($request->isPost() && $request->getPost('module')=='submenu'){
    		$UserSubmodulesTable=$this->getUserSubmodulesTable();
    		if($request->getPost('node')=='root'){
    			$results=$UserSubmodulesTable->getUserSubmodules($request->getPost('idmenu'),$userData->id,$userPrefs[0]['lang']);
    		}else{
    			$results=$UserSubmodulesTable->getUserSubmodulesBySmid($request->getPost('idmenu'),$request->getPost('node'),$userData->id,$userPrefs[0]['lang']);
    		}
    
    		//print_r($results);
    		if(empty($results)){
    			$data=array('success'=>false);
    		}else{
    			$data=array('success'=>true,'nodes'=>$results);
    		}
    		//$SubmodulesTable->getSubmodules($request->getPost('idmenu'));
    		//$data=array('success'=>true);
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }
    

    public function getuserpreferencesAction()
    {

    	$request = $this->getRequest();
    	if ($request->isGet() && $request->getQuery('module')=='userprefs'){
    		$userPrefs = $this->getServiceLocator()->get('userPreferences');            
    		if(empty($userPrefs)){
    			$data=array('success'=>false);
    		}else{
    			$data=array('success'=>true,'prefs'=>$userPrefs);
    		}
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }

    public function getcontentpanelAction()
    {
    
    	$request = $this->getRequest();
    	if ($request->isGet() && $request->getQuery('module')=='contentpanel'){
    	    $userData = $this->getServiceLocator()->get('userSessionData');
    	    $preProcessData = $request->getQuery('mid');
    	    $user_id = $userData[0]['id'];
    		$smContent = $this->getSubmodulesTable();
    		if(empty($preProcessData)){
    		    $processData = explode('-', $preProcessData);
    		    $postProcessData=$smContent->getSubmodulesBySmid($processData[0], $processData[1]);
    			//$data=array('success'=>false);
    		}else{
    			$data=array('success'=>true,'prefs'=>$postProcessData);
    		}
    	}else{
    		$data=array('success'=>false);
    	}
    	$result = new JsonModel($data);
    	return $result;
    }
    
    public function getModulesTable()
    {
    
    	if (!$this->modulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->modulesTable = $sm->get('Application\Model\ModulesTable');
    	}
    	return $this->modulesTable;
    }
    
    public function getUserModulesTable()
    {
    	if (!$this->usermodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->usermodulesTable = $sm->get('Application\Model\UserModulesTable');
    	}
    	return $this->usermodulesTable;
    }
    
    public function getSubmodulesTable()
    {
    	if (!$this->submodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->submodulesTable = $sm->get('Application\Model\SubmodulesTable');
    	}
    	return $this->submodulesTable;
    }
    
    public function getUserSubmodulesTable()
    {
    	if (!$this->usersubmodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->usersubmodulesTable = $sm->get('Application\Model\UserSubmodulesTable');
    	}
    	return $this->usersubmodulesTable;
    }
    
    public function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }

    public function getCompaniesTable()
    {
        if (!$this->companiesTable){
            $sm = $this->getServiceLocator();
            $this->companiesTable = $sm->get('Application\Model\CompaniesTable');
        }
        return $this->companiesTable;
    }

    
    public function getCountriesTable()
    {
        if (!$this->countriesTable){
            $sm = $this->getServiceLocator();
            $this->countriesTable = $sm->get('Application\Model\CountriesTable');
        }
        return $this->countriesTable;
    }
    
    public function getLocationsTable()
    {
        if (!$this->locationsTable){
            $sm = $this->getServiceLocator();
            $this->locationsTable = $sm->get('Application\Model\LocationsTable');
        }
        return $this->locationsTable;
    }
}