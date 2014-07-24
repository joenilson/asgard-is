<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Sales\Controller\Index' => 'Sales\Controller\IndexController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'sales' => array(
                'type'    => 'Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route'    => '/sales',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        '__NAMESPACE__' => 'Sales\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'index' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/index[/:year[/:month]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'index'
                            ),
                        ),
                    ),
                    'masterdata' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/masterdata[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'masterdata'
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'sales' => __DIR__ . '/../view',
        ),
    ),
);