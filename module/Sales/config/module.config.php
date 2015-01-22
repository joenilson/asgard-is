<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Sales\Controller\Index' => 'Sales\Controller\IndexController',
        ),
    ),
     'controller_plugins' => array(
        'invokables' => array(
            'SoapPlugin' => 'Sales\Controller\Plugin\SoapPlugin',
        )
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
                    'salesoffices' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/salesoffices[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'salesoffices'
                            ),
                        ),
                    ),
                    'saleschannels' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/saleschannels[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'saleschannels'
                            ),
                        ),
                    ),
                    'customerinfo' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/customerinfo[/:society]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'customerinfo'
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
    'view_helper_config' => array(
        'flashmessenger' => array(
            'message_open_format'      => '<div%s><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><ul><li>',
            'message_close_string'     => '</li></ul></div>',
            'message_separator_string' => '</li><li>'
        )
    )
);