<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'HCM\Controller\Index' => 'HCM\Controller\IndexController',
        ),
    ),
    'controller_plugins' => array(
        'invokables' => array(
            'SoapHcmPlugin' => 'HCM\Controller\Plugin\SoapPlugin',
        )
    ),
    'router' => array(
        'routes' => array(
            'hcm' => array(
                'type'    => 'Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route'    => '/hcm',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        '__NAMESPACE__' => 'HCM\Controller',
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
                    'getemployeeoffices' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getemployeeoffices[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getemployeeoffices'
                            ),
                        ),
                    ),
                    'getemployees' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getemployees[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getemployees'
                            ),
                        ),
                    ),
                    'getemployeesdependants' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getemployeesdependants[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getemployeesdependants'
                            ),
                        ),
                    ),
                    'addemployeesdependants' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addemployeesdependants[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addemployeesdependants'
                            ),
                        ),
                    ),
                    'employees' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/employees[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'employees'
                            ),
                        ),
                    ),
                    'employeesr' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/employeesr[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'employeesr'
                            ),
                        ),
                    ),
                    'getemployeesr' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getemployeesr[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getemployeesr'
                            ),
                        ),
                    ),
                    'getremployeesgrouped' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getremployeesgrouped[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getremployeesgrouped'
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'hcm' => __DIR__ . '/../view',
        ),
    ),
);