<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/Auth for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;
use Application\Model\Entity\Users;
use Application\Model\Entity\UserPreferences;
use Application\Model\Entity\AdminUserModules;
use Application\Model\Entity\AdminUserSubmodules;

class UsersController extends AbstractActionController
{
    protected $storage;
    protected $authservice;
    protected $translationTable;
    protected $userpreferencesTable;
    protected $usersTable;
    protected $systemConfig;
    protected $adminusermodulesTable;
    protected $adminusersubmodulesTable;
    
    public function indexAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return new ViewModel(array('companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        ));
    }
    
    public function getusersAction()
    {
        $sql = $this->getUsersTable();
        
        $request = $this->getRequest();
        $company = (string) $request->getQuery('company');
        $country = (string) $request->getQuery('country');
        $location = (string) $request->getQuery('location');
        
        $listUsers = $sql->getUsersList($company, $country, $location);
        
        if($listUsers){
            $data['success']=true;
            $data['results']=$listUsers;
        }else{
            $data['success']=true;
            $data['msg']="No data at this time..";
        }
        return new JsonModel($data);
    }
    
    public function validateAction()
    {
        $request = $this->getRequest();
        $user_name = $request->getQuery('u');
        $sql = $this->getUsersTable();
        $listUsers = $sql->getUserByUsername($user_name);
        if($listUsers){
            $data['success']=true;
            $data['results']=$listUsers;
        }else{
            $data['success']=true;
            $data['msg']="No data at this time..";
        }
        return new JsonModel($data);
    }
    
    public function pwdchangeAction()
    {
        if (!$this->getServiceLocator()->get('AuthService')->hasIdentity()){
            die();
        }
        
        $data['success']= false;
    	$data['msg']='Wrong Password update';
        
    	$request = $this->getRequest();
        $userId = (int) $request->getPost('uid');
        $passAuth = (string) $request->getPost('password');
        $country = (string) $request->getPost('country');
        $now = date('Y-m-d H:i:s.'). str_pad(substr((float)microtime(), 2), 6, '0', STR_PAD_LEFT);
        
        $salt=md5($userId.$now.$country);
        
    	if ($request->isPost() && $request->getPost('module')=='uadmin'){
            $UsersTable=$this->getUsersTable();
            
            $prePassword = $this->getConfig()['salt'].$passAuth.$salt;
            $password=md5($prePassword);

            $dataValues = array ('password' => $password, 'salt'=>$salt);
            
            $UsersTable->updateById($userId, $dataValues);

            $data['success']=true;
            $data['msg']="Succesfull pasword changed.";
        }
        
        return new JsonModel($data);
    }
    
    public function changeAction()
    {
        if (!$this->getServiceLocator()->get('AuthService')->hasIdentity()){
            die();
        }
        
        $data['success']= false;
    	$data['msg']='Wrong data sent';
        
    	$request = $this->getRequest();
        $userId = (int) $request->getPost('uid');
        $status = (string) $request->getPost('status');
        
    	if ($request->isPost() && $request->getPost('module')=='uadmin'){
            $UsersTable=$this->getUsersTable();
            
            $newStatus = ($status == 'A')?"X":"A";
            
            $dataValues = array ('status' => $newStatus);
            
            $UsersTable->updateById($userId, $dataValues);

            $data['success']=true;
            $data['msg']="Succesfull user status changed to $newStatus.";
        }
        
        return new JsonModel($data);
    }
    
    public function createuserAction()
    {
        if ($this->getServiceLocator()
        ->get('AuthService')->hasIdentity()){
            $userData = $this->getServiceLocator()->get('userSessionData');
            //print_r($userData);
            
        }
        
    	$data['success']= false;
        $data['msg']= "Procesando la información...";
        
    	$request = $this->getRequest();
    
    	if ($request->isPost() && $request->getPost('module')=='sysnu' && $userData->admin === true){

            $UsersTable=$this->getUsersTable();
            $UserPrefsTable = $this->getUserPreferencesTable();
            
            $company = (string) strip_tags($request->getPost('companiesCombo'));//	0002
            $country = (string) strip_tags($request->getPost('countriesCombo'));//	0002
            $location = (string) strip_tags($request->getPost('locationsCombo')); //	0002

            $user_email = (string) strtolower(strip_tags($request->getPost('email'))); //sheryl.bravo@kr.com.pe
            $userLang = (string) strtolower(strip_tags($request->getPost('lang'))); //	es
            $userLang = (empty($userLang))?'en':$userLang;
            $userAuth = (string) strtolower(strip_tags($request->getPost('username'))); //	sbravo
            $passAuth = (string) strip_tags($request->getPost('password')); //	sfdasdfasdfa

            $realname = (string) ucwords(strtolower(strip_tags($request->getPost('realname')))); //	Sheryl Bravo
            $is_admin = (string) strip_tags($request->getPost('admin')); //	sbravo
            
            $admin_user = ($is_admin==='on')?'t':'f';
            
            $now = date('Y-m-d H:i:s.'). str_pad(substr((float)microtime(), 2), 6, '0', STR_PAD_LEFT);
            
            $company = (strlen($company)>4)?"0000":$company;
            $country = (strlen($country)>4)?"0000":$country;
            $location = (strlen($location)>4)?"0000":$location;

            $userField = explode('@',$userAuth);
            $userType = (!empty($userField[1]))?'ldap':'db';

            $userTimezone = ($company==='0000')?"America/Santo_Domingo":"America/Santo_Domingo";
            $userTimezone = ($company==='0001')?"America/Santo_Domingo":$userTimezone;
            $userTimezone = ($company==='0002')?"America/Lima":$userTimezone;
            $userTimezone = ($company==='0003')?"America/Sao_Paulo":$userTimezone;

            $salt=md5($userAuth.$now.$country);

            $prePassword = $this->getConfig()['salt'].$passAuth.$salt;

            $password=md5($prePassword);

            $user = new Users();

            $user->setId(0)
            ->setUsername($userAuth)
            ->setPassword($password)
            ->setSalt($salt)
            ->setRealname($realname)
            ->setRole(1)
            ->setDate_created($now)
            ->setDate_lastlogin(null)
            ->setCountry($country)
            ->setCompany($company)
            ->setLocation($location)
            ->setAdmin($admin_user)
            ->setStatus('A')
            ->setType('single')
            ->setAccount_type('db');

            $newUserId=$UsersTable->save($user);

            $user->setId($newUserId);
            /*
             * User preferences first load
            * All data is from the LDAP Server
            */
            $userPrefs = new UserPreferences();
            $userPrefs->setUser_id($newUserId)
            ->setLang($userLang)
            ->setEmail($user_email)
            ->setAlias($realname)
            ->setAvatar(null)
            ->setRegional($userTimezone)
            ->setVacation_from(null)
            ->setVacation_to(null)
            ->setVacation_status(null)
            ->setOffice_phone(null)
            ->setCell_phone(null)
            ->setHome_phone(null)
            ->setOther_phone(null)
            ->setFax_phone(null)
            ->setOffice_ext(null);
            
            $UserPrefsTable->save($userPrefs);

            /*
             * Module and Submodule initial load for IMS
             * IMS is id 10
             */
            $imsMid=10;
            $imsModuleLoad = $this->getAdminUserModulesTable();

            $module = new AdminUserModules();
            $module->setUser_id($newUserId)
                    ->setMid($imsMid);

            $imsModuleLoad->populateUserModule($module);

            $ismSubmoduleLoad = $this->getAdminUserSubmodulesTable();

            $submodule = new AdminUserSubmodules();
            $submodule->setUser_id($newUserId)
                        ->setMid($imsMid)
                        ->setView('t')
                        ->setEdit('f')
                        ->setAdd('f')
                        ->setAdmin('f');

            $ismSubmoduleLoad->populateUserSubmodule($submodule);
            
            /*
            $userData = $user;
            $dataValues = array ('date_lastlogin' => $now);
            $UsersTable->updateById($newUserId, $dataValues);
             * 
             */
            $data['success']=true;
            $data['msg']='Usuario '.$userAuth. ' creado con id: '.$newUserId;

        }
    
    	$result = new JsonModel($data);
    	return $result;
    }
    
    public function getTranslationTable()
    {
    	if (!$this->translationTable) {
    		$sm = $this->getServiceLocator();
    		$this->translationTable = $sm->get('Application\Model\TranslationTable');
    	}
    	return $this->translationTable;
    }
    
    public function getUsersTable()
    {
    	if (!$this->usersTable) {
    		$sm = $this->getServiceLocator();
    		$this->usersTable = $sm->get('Application\Model\UsersTable');
    	}
    	return $this->usersTable;
    }

    public function getUserPreferencesTable()
    {
    	if (!$this->userpreferencesTable) {
    		$sm = $this->getServiceLocator();
    		$this->userpreferencesTable = $sm->get('Application\Model\UserPreferencesTable');
    	}
    	return $this->userpreferencesTable;
    }    

    public function getAdminUserModulesTable()
    {
    	if (!$this->adminusermodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->adminusermodulesTable = $sm->get('Application\Model\AdminUserModulesTable');
    	}
    	return $this->adminusermodulesTable;
    }
    
    public function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }
    
}
