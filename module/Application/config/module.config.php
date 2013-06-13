<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

return array(
    'router' => array(
        'routes' => array(
            'home' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/',
                    'defaults' => array(
                        'controller' => 'Application\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
            ),
            // The following is a route to simplify getting started creating
            // new controllers and actions without needing to create a new
            // module. Simply drop new controllers in, and you can access them
            // using the path /application/:controller/:action
            'application' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/application',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    /*
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/[:controller[/:action]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                    */
                ),
            ),
            'commons' => array(
            		'type'    => 'Literal',
            		'options' => array(
            				'route'    => '/commons',
            				'defaults' => array(
            						'__NAMESPACE__' => 'Application\Controller',
            						'controller'    => 'Commons',
            						'action'        => 'index',
            				),
            		),
            		'may_terminate' => true,
            		'child_routes' => array(
            		    /*
        				'default' => array(
    						'type'    => 'Segment',
    						'options' => array(
								'route'    => '/[:controller[/:action]]',
								'constraints' => array(
									'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
									'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
								),
								'defaults' => array(
								),
    						),
        				),
        				*/
        				'getmenus' => array(
    						'type'    => 'Segment',
    						'options' => array(
								'route'    => '/getmenus',
								'constraints' => array(
									'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
									'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
								),
								'defaults' => array(
									'action' => 'getmenus'
								),
    						),
        				),
        				'getsubmenus' => array(
        						'type'    => 'Segment',
        						'options' => array(
        								'route'    => '/getsubmenus',
        								'constraints' => array(
        										'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
        										'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
        								),
        								'defaults' => array(
        										'action' => 'getsubmenus'
        								),
        						),
        				),
        				'getusermenus' => array(
        						'type'    => 'Segment',
        						'options' => array(
        								'route'    => '/getusermenus',
        								'constraints' => array(
        										'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
        										'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
        								),
        								'defaults' => array(
        										'action' => 'getusermenus'
        								),
        						),
        				),
        				'getusersubmenus' => array(
        						'type'    => 'Segment',
        						'options' => array(
        								'route'    => '/getusersubmenus',
        								'constraints' => array(
        										'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
        										'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
        								),
        								'defaults' => array(
        										'action' => 'getusersubmenus'
        								),
        						),
        				),
        				'getuserpreferences' => array(
        						'type'    => 'Segment',
        						'options' => array(
        								'route'    => '/getuserpreferences',
        								'constraints' => array(
        										'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
        										'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
        								),
        								'defaults' => array(
        										'action' => 'getuserpreferences'
        								),
        						),
        				),
        				'getcontentpanel' => array(
        						'type'    => 'Segment',
        						'options' => array(
        								'route'    => '/getcontentpanel',
        								'constraints' => array(
        										'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
        										'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
        								),
        								'defaults' => array(
        										'action' => 'getcontentpanel'
        								),
        						),
        				),
            		),
            ),
        ),
    ),
    'service_manager' => array(
        'factories' => array(
            'translator' => 'Zend\I18n\Translator\TranslatorServiceFactory',
        ),
    ),
    'translator' => array(
        'locale' => 'es_ES',
        'translation_file_patterns' => array(
            array(
                'type'     => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern'  => '%s.mo',
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Application\Controller\Index' => 'Application\Controller\IndexController',
            'Application\Controller\Commons' => 'Application\Controller\CommonsController'
        ),
    ),
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => array(
            'layout/error'           => __DIR__ . '/../view/layout/errorlayout.phtml', 
            'layout/layout'           => __DIR__ . '/../view/layout/layout.phtml',
            'layout/contentlayout'    => __DIR__ . '/../view/layout/contentlayout.phtml',
            'layout/login'            => __DIR__ . '/../view/layout/loginlayout.phtml',
            'layout/mobilelogin'      => __DIR__ . '/../view/layout/mobileloginlayout.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
);
