<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Application\Model\ApplicationTable;
use Application\Model\TranslationTable;
use Application\Model\ModulesTable;
use Application\Model\ModulesI18nTable;
use Application\Model\SubmodulesTable;
use Application\Model\UserModulesTable;
use Application\Model\UserSubmodulesTable;
use Application\Model\UserPreferencesTable;
use Application\Model\UsersTable;
use Application\Model\AdminUserModulesTable;
use Application\Model\AdminUserSubmodulesTable;
use Application\Model\CompaniesTable;
use Application\Model\MessagesTable;

class Module
{
    
    public $mobileSite;
    public $user;
    
    public function onBootstrap(MvcEvent $e)
    {
        $e->getApplication()->getServiceManager()->get('translator');
        $eventManager        = $e->getApplication()->getEventManager();
        $eventManager->attach(MvcEvent::EVENT_DISPATCH_ERROR, array($this,'onDispatchError'), 100);
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
        
        /*
         * User Agent validation
         */
        $headers = $e->getApplication()->getRequest()->getHeaders();
        $useragent = $headers->get('UserAgent')->toString();
        if (strpos($useragent,'Mobile') !== false OR strpos($useragent,'Mobi') !== false) {
        	$this->mobileSite='mobile';
        }else{
        	$this->mobileSite='web';
        }
        
        /*
         * Login Validation
         */
        
        $application   = $e->getApplication();
        $sm            = $application->getServiceManager();
        $router        = $sm->get('router');
        $request       = $sm->get('request');
        $dbAdapter     = $sm->get('Zend\Db\Adapter\Adapter');

        $matchedRoute = $router->match($request);
        if (null !== $matchedRoute) {
        	$controller = $matchedRoute->getParam('controller');
        	$action = $matchedRoute->getParam('action');
        	$id = $matchedRoute->getParam('id');
        	// check auth...
        	$response = $e->getResponse();
        	if (! $sm->get('AuthService')->hasIdentity() && $action != 'login' && $action != 'authenticate'){
        		$url    = $router->assemble(array(), array('name' => 'auth/login'));
        		$response->setStatusCode(302);
        		$response->getHeaders()->addHeaderLine('Location', $url);
        	}
        	
        	
        	if ($sm->get('AuthService')->hasIdentity() && $action != 'login' && $action != 'authenticate' && $id != 0){
        	    $userSession = $sm->get('Auth\Model\MyAuthStorage')->read();
        	    
        	    $moduleParams = explode('-',$id);
        	    
        	    $idUser = $userSession->id;
        	    $idModule = $moduleParams[0];
        	    $idSubmodule = (!isset($moduleParams[1]))?'':$moduleParams[1];
        	    if (!isset($moduleParams[1])){
        	        $userAccess = new AdminUserModulesTable($sm->get('Zend\Db\Adapter\Adapter'));
        	        $userAccess = $userAccess->getUserModulesAccess( $idUser, $idModule );
        	    }else{
        	        $userAccess = new AdminUserSubmodulesTable($sm->get('Zend\Db\Adapter\Adapter'));
        	        $userAccess = $userAccess->getUserSubmodulesAccess( $idUser, $idModule, $idSubmodule );
        	    }
        	    
        	    
        	    if(!$userAccess){
        	        echo "No access...";
        	        /*
        	        $url    = $router->assemble(array(), array('name' => 'forbidden'));
        	        $response->setStatusCode(302);
        	        $response->getHeaders()->addHeaderLine('Location', $url);
        	        */
        	    }
        	}
        }
        
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
    
    function onDispatchError(MvcEvent $e) {
    	$vm = $e->getViewModel();
    	$vm->setTemplate('layout/error');
    }
    
    public function getServiceConfig()
    {
    	return array(
            'factories' => array(
                'layoutType' => function ($sm) {
                    $layoutConfig = $sm->get('Config');
                    $layoutConfig['mobileSite'] = $this->mobileSite;
                    return $layoutConfig['mobileSite'];
                },
                'userSessionData' => function ($sm) {
                    $userSessionData = $sm->get('Auth\Model\MyAuthStorage')->read();
                    return $userSessionData;

                },
                'userPreferences' => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $tableUserPrefs = new UserPreferencesTable($dbAdapter);
                    $user = $sm->get('Auth\Model\MyAuthStorage')->read();
                    $userPreferences = $tableUserPrefs->getUserPreferences($user->id);
                    return $userPreferences;
                },
                'Application\Model\TranslationTable' =>  function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new TranslationTable($dbAdapter);
                    return $table;
                },
                'Application\Model\ModulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ModulesTable($dbAdapter);
                    return $table;
                },                    
                'Application\Model\ModulesI18nTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ModulesI18nTable($dbAdapter);
                    return $table;
                },
                'Application\Model\UserModulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserModulesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\UserSubmodulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserSubmodulesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\SubmodulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new SubmodulesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\UserPreferencesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserPreferencesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\UsersTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UsersTable($dbAdapter);
                    return $table;
                },

                'Application\Model\AdminUserModulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new AdminUserModulesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\AdminUserSubmodulesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new AdminUserSubmodulesTable($dbAdapter);
                    return $table;
                },

                'Application\Model\CompaniesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CompaniesTable($dbAdapter);
                    return $table;
                },
                        
                'Application\Model\ApplicationTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ApplicationTable($dbAdapter);
                    return $table;
                },
                        
                'Application\Model\MessagesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new MessagesTable($dbAdapter);
                    return $table;
                },        
    	    ),
        );
    }
}