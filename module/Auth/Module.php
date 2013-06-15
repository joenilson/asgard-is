<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/Auth for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Auth;

use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\Mvc\ModuleRouteListener;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Adapter\DbTable as DbTableAuthAdapter;
use Zend\Authentication\Adapter\Ldap as LdapAuthAdapter;

class Module implements AutoloaderProviderInterface
{
    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php',
            ),
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
		    // if we're in a namespace deeper than one level we need to fix the \ in the path
                    __NAMESPACE__ => __DIR__ . '/src/' . str_replace('\\', '/' , __NAMESPACE__),
                ),
            ),
        );
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function onBootstrap($e)
    {
        // You may not need to do this if you're doing it elsewhere in your
        // application
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }
    
    public function getServiceConfig()
    {
    	return array(
			'factories'=>array(
				'Auth\Model\MyAuthStorage' => function($sm){
					return new \Auth\Model\MyAuthStorage('asgard');
				},
				'AuthService' => function($sm) {
				    $config       = $sm->get('Config');
				    
					$dbAdapter    = $sm->get('Zend\Db\Adapter\Adapter');
					$dbTableAuthAdapter  = new DbTableAuthAdapter($dbAdapter,
							new \Zend\Db\Sql\TableIdentifier('users', 'system'),'username','password', 'MD5(CONCAT(\''.$config['salt'].'\',?,salt))');
					$authService = new AuthenticationService();
					$authService->setAdapter($dbTableAuthAdapter);
					$authService->setStorage($sm->get('Auth\Model\MyAuthStorage'));

					return $authService;
				},
				'LdapAuthService' => function($sm) {
					$config       = $sm->get('Config');
			        $LdapAdapter  = $config['ldap_config'];
					$LdapAuthAdapter  = new LdapAuthAdapter($LdapAdapter,'username','password');
					$authService = new AuthenticationService();
					$authService->setAdapter($LdapAuthAdapter);
					$authService->setStorage($sm->get('Auth\Model\MyAuthStorage'));
				
					return $authService;
				},
			),
    	);
    }
}
