<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/Auth for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Auth\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Authentication\Result;
use Zend\View\Model\JsonModel;
use Application\Model\Entity\Users;
use Application\Model\Entity\UserPreferences;
use Application\Model\Entity\AdminUserModules;
use Application\Model\Entity\AdminUserSubmodules;

class IndexController extends AbstractActionController
{
    protected $storage;
    protected $authservice;
    protected $translationTable;
    protected $userpreferencesTable;
    protected $usersTable;
    protected $systemConfig;
    protected $adminusermodulesTable;
    protected $adminusersubmodulesTable;
    
    public function getAuthService($type)
    {
    	if (! $this->authservice) {
    	    $factoryAuth = ($type=='db')?'AuthService':'LdapAuthService';
    		  $this->authservice = $this->getServiceLocator()
    		->get($factoryAuth);
    	}
    
    	return $this->authservice;
    }
     
    public function getSessionStorage()
    {
    	if (! $this->storage) {
    		$this->storage = $this->getServiceLocator()
    		->get('Auth\Model\MyAuthStorage');
    	}
    
    	return $this->storage;
    }
    
    public function indexAction()
    {
        return true;
    }
    
    public function loginAction()
    {
    	
        $layout = $this->layout();
        if($this->getServiceLocator()->get('layoutType') == 'web' ){
        	$layout->setTemplate('layout/login');
        }else{
        	$layout->setTemplate('layout/mobilelogin');
        }
        
        if ($this->getServiceLocator()
        ->get('AuthService')->hasIdentity()){
        	return $this->redirect()->toRoute('home');
        }
    }

    public function authenticateAction()
    {
        if ($this->getServiceLocator()
        ->get('AuthService')->hasIdentity()){
        	return $this->redirect()->toRoute('home');
        }
        
    	$data['success']= false;
    	$data['redirect']='auth/login';
        
    	$request = $this->getRequest();
    
    	if ($request->isPost() && $request->getPost('module')=='login'){
    	    
    	    $userAuth = $request->getPost('username');
    	    $passAuth = $request->getPost('password');
    	    $userField = explode('@',$userAuth);
            $userType = (!empty($userField[1]))?'ldap':'db';
            $userLang = substr($request->getPost('userlanguage'),0,2);
            $userLang = (empty($userLang))?'en':$userLang;
            $userTimezone = $request->getPost('client_timezone');
            //check authentication...
            $authHeader = $this->getAuthService($userType)->getAdapter();
            if($userType == 'db'){
              $authHeader->setIdentity($userAuth)
                  ->setCredential($passAuth);
            }elseif ($userType == 'ldap'){
                $authHeader->setUsername($userAuth)
                ->setPassword($passAuth);
            }
            $result = $this->getAuthService($userType)->authenticate();

            $TranslationTable=$this->getTranslationTable();

            switch ($result->getCode()) {

                case Result::FAILURE_IDENTITY_NOT_FOUND:
                    /** do stuff for nonexistent identity **/
                    $data['message']=$TranslationTable->getTranslationItem(
                    substr($request->getPost('userlanguage'),0,2),
                    $request->getPost('module'),
                    'erroridentityText')->value;
                    //$data['message']='User not allowed to login... ';
                    break;

                case Result::FAILURE_CREDENTIAL_INVALID:
                    /** do stuff for invalid credential **/
                    $data['message']=$TranslationTable->getTranslationItem(
                    substr($request->getPost('userlanguage'),0,2),
                    $request->getPost('module'),
                    'errorcredentialText')->value;
                    //$data['message']='User/Password dont match... ';
                    break;

                case Result::SUCCESS:
                    /** do stuff for successful authentication **/
                    $data['redirect'] = $request->getBaseUrl();
                    $data['success'] = true;
                    $now = date('Y-m-d H:i:s.'). str_pad(substr((float)microtime(), 2), 6, '0', STR_PAD_LEFT);
                    //check if it has rememberMe :
                    $UsersTable=$this->getUsersTable();
                    $UserPrefsTable = $this->getUserPreferencesTable();
                    if ($request->getPost('rememberme')){
                        if( $request->getPost('rememberme') == 'on' ) {
                            $this->getSessionStorage()->setRememberMe(1);
                            //set storage again
                            $this->getAuthService($userType)->setStorage($this->getSessionStorage());
                        }
                    }
                    //print_r($user_prefs);
                    if($userType == 'db'){
                        $userData = $this->getAuthService($userType)
                            ->getAdapter()
                            ->getResultRowObject(null,array('password','salt'));
                        $dataValues = array ('date_lastlogin' => $now);

                        $UsersTable->updateById($userData->id, $dataValues);

                    }elseif ($userType === 'ldap'){
                        $resultMessages = $this->getAuthService($userType)
                            ->getAdapter()
                            ->getAccountObject();
                        $userRegistry = $UsersTable->getUserByUsername($resultMessages->uid,$userType);

                        if(!empty($userRegistry)){
                            $userData = $UsersTable->getUserByIdRaw($userRegistry[0]['id']);
                            $dataValues = array ('date_lastlogin' => $now);
                            $UsersTable->updateById($userRegistry[0]['id'], $dataValues);
                        }else{
                            $country=($userField[1]=='kolareal.com.do')?'0001':'0002';
                            $country=($userField[1]=='kr.com.pe')?'0002':$country;
                            $country=($userField[1]=='group-ism.com')?'0002':$country;
                            $country=($userField[1]=='group-ism.com.br')?'0003':$country;

                            $company=($country=='0001')?'0001':'0002';
                            $company=($country=='0002')?'0002':$company;
                            $company=($country=='0003')?'0003':$company;
                            
                            $location = ($country=='0001')?"0008":"0001";
                            $location = ($country=='0002')?"0002":$location;
                            $location = ($country=='0003')?"0001":$location;
                            
                            $salt=md5($resultMessages->uid.$now.$country);

                            $prePassword = $this->getConfig()['salt'].$passAuth.$salt;
                            $password=md5($prePassword);

                            $user = new Users();

                            $user->setId(0)
                            ->setUsername($resultMessages->uid)
                            ->setPassword($password)
                            ->setSalt($salt)
                            ->setRealname($resultMessages->cn)
                            ->setRole(1)
                            ->setDate_created($now)
                            ->setDate_lastlogin(null)
                            ->setCountry($country)
                            ->setCompany($company)
                            ->setLocation($location)
                            ->setAdmin('f')
                            ->setStatus('A')
                            ->setType('single')
                            ->setAccount_type('ldap')
                            ->setType_system(null)
                            ->setId_company(null)
                            ->setId_location(null)
                            ->setId_employee(null);

                            $newUserId=$UsersTable->save($user);

                            $userMail = (is_array($resultMessages->mail))?$resultMessages->mail[0]:$resultMessages->mail;
                            
                            $user->setId($newUserId);
                            /*
                             * User preferences first load
                            * All data is from the LDAP Server
                            */
                            $userPrefs = new UserPreferences();
                            $userPrefs->setUser_id($newUserId)
                                ->setLang($userLang)
                                ->setEmail($userMail)
                                ->setAlias($resultMessages->givenname)
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
                            $userData = $user;
                            $dataValues = array ('date_lastlogin' => $now);
                            $UsersTable->updateById($newUserId, $dataValues);

                        }
                    }
                    $this->getAuthService($userType)->getStorage()->write($userData);
                    break;

                default:
                    /** do stuff for other failure **/
                    $data['message']=$TranslationTable->getTranslationItem(
                    substr($request->getPost('userlanguage'),0,2),
                    $request->getPost('module'),
                    'errorprocessText')->value;
                    break;
            }
    	}
    
    	$result = new JsonModel($data);
    	return $result;
    }
     
    public function logoutAction()
    {
    	$this->getSessionStorage()->forgetMe();
    	$this->getAuthService('ldap')->clearIdentity();
    
    	$this->flashmessenger()->addMessage("You've been logged out");
    	//echo 'hola';
    	return $this->redirect()->toRoute('auth/login');
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
