<?php

return array(
    'controllers' => array(
        'invokables' => array(
            'Auth\Controller\Index' => 'Auth\Controller\IndexController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'auth' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route' => '/auth',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        //'__NAMESPACE__' => 'Auth\Controller',
                        'controller' => 'Auth\Controller\Index',
                        'action' => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    // This route is a sane default when developing a module;
                    // as you solidify the routes for your module, however,
                    // you may want to remove it and replace it with more
                    // specific routes.
                    /*
                      'default' => array(
                      'type'    => 'Segment',
                      'options' => array(
                      'route'    => '[/:action]',
                      'constraints' => array(
                      'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                      'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                      ),
                      'defaults' => array(
                      ),
                      ),
                      ),
                     */
                    'login' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/login',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'login'
                            ),
                        ),
                    ),
                    'authenticate' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/authenticate',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'authenticate'
                            ),
                        ),
                    ),
                    'logout' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/logout',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'logout'
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'Auth' => __DIR__ . '/../view',
        ),
        'strategies' => array(
            'ViewJsonStrategy',
        ),
    ),
);
