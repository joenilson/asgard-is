<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Admin' => 'Admin\Controller\AdminController',
            'Admin\Controller\Users' => 'Admin\Controller\UsersController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'admin' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route' => '/admin',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        '__NAMESPACE__' => 'Admin\Controller',
                        //'controller' => 'Admin\Controller\Admin',
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
                    'users' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/users[/:action[/:id_user]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                'controller' => 'Admin\Controller\Users',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
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
            'admin' => __DIR__ . '/../view',
            //'users' => __DIR__ . '/../view',
        ),
        
        'strategies' => array(
            'ViewJsonStrategy',
        ),
        /*
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
        */
    ),
    
);