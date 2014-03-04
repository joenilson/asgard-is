<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'IMS\Controller\Index' => 'IMS\Controller\IndexController',
            'IMS\Controller\CSI' => 'IMS\Controller\CSIController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'ims' => array(
                'type'    => 'Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route'    => '/ims',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        '__NAMESPACE__' => 'IMS\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
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
                    'csi' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/csi[/:year[/:month]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'csi'
                            ),
                        ),
                    ),
                    'index' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/index[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'index'
                            ),
                        ),
                    ),
                    'diagram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/diagram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'diagram'
                            ),
                        ),
                    ),
                    'process' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route' => '/process[/:company[/:country[/:location[/:process_id[/:parent_id[/:type]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'process'
                            ),
                        ),
                    ),
                    'processdiagram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processdiagram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processdiagram'
                            ),
                        ),
                    ),
                    'processlist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processlist[/:id_process]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processlist'
                            ),
                        ),
                    ),
                    'processmainlist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processmainlist[/:id_process]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processmainlist'
                            ),
                        ),
                    ),
                    'processthreadlist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processthreadlist[/:id_process]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processthreadlist'
                            ),
                        ),
                    ),
                    'processownerlist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processownerlist[/:id_process]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id_process' => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processownerlist'
                            ),
                        ),
                    ),
                    
                    'newdocument'  => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/newdocument',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'newdocument'
                            ),
                        ),
                    ),
                    'requestchange'  => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/requestchange',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'requestchange'
                            ),
                        ),
                    ),
                    'requesttreatment'  => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/requesttreatment',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'requesttreatment'
                            ),
                        ),
                    ),
                    'processdocslist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processdocslist',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processdocslist'
                            ),
                        ),
                    ),
                    'processrequestlist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processrequestlist',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processrequestlist'
                            ),
                        ),
                    ),
                    'threaddetails' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/threaddetails[/:id_thread[/:country[/:company[/:location]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'threaddetails'
                            ),
                        ),
                    ),
                    'docs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/docs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'docs'
                            ),
                        ),
                    ),
                    'processdocshelpers' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processdocshelpers',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processdocshelpers'
                            ),
                        ),
                    ),
                    'hiraspecs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiraspecs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiraspecs'
                            ),
                        ),
                    ),
                    'hira' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hira[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hira'
                            ),
                        ),
                    ),
                    'hiraDocs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiraDocs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiraDocs'
                            ),
                        ),
                    ),
                    'hiraDocsByThread' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiraDocsByThread[/:pid]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiraDocsByThread'
                            ),
                        ),
                    ),
                    'listhira' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/listhira[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'listhira'
                            ),
                        ),
                    ),
                    'hiralit' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiralit[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiralit'
                            ),
                        ),
                    ),
                    'hiranctype' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiranctype[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiranctype'
                            ),
                        ),
                    ),
                    'hiradetails' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiradetails[/:country[/:location[/:date_incident]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiradetails'
                            ),
                        ),
                    ),
                    'hirailist' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hirailist',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hirailist'
                            ),
                        ),
                    ),
                    'saveContent' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/saveContent[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'saveContent'
                            ),
                        ),
                    ),
                    
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'IMS' => __DIR__ . '/../view',
        ),
    ),
);
