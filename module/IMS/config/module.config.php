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
            
            'csi' => array(
                'type'    => 'Literal',
                'options' => array(
                    // Change this to something specific to your module
                    'route'    => '/csi',
                    'defaults' => array(
                        // Change this value to reflect the namespace in which
                        // the controllers for your module are found
                        '__NAMESPACE__' => 'IMS\Controller',
                        'controller'    => 'CSI',
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
                ),
            ),
            
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
                    'objectives' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/objectives[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'objectives'
                            ),
                        ),
                    ),
                    'getobjectives' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getobjectives[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getobjectives'
                            ),
                        ),
                    ),
                    'addobjectives' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addobjectives[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addobjectives'
                            ),
                        ),
                    ),
                    'securityhandbook' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/securityhandbook[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'securityhandbook'
                            ),
                        ),
                    ),
                    'getsecurityhandbook' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getsecurityhandbook[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getsecurityhandbook'
                            ),
                        ),
                    ),
                    'addsecurityhandbook' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addsecurityhandbook[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addsecurityhandbook'
                            ),
                        ),
                    ),
                    'inspectionprogram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/inspectionprogram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'inspectionprogram'
                            ),
                        ),
                    ),
                    'getinspectionprogram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getinspectionprogram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getinspectionprogram'
                            ),
                        ),
                    ),
                    'addinspectionprogram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addinspectionprogram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addinspectionprogram'
                            ),
                        ),
                    ),
                    'removeinspectionprogram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeinspectionprogram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeinspectionprogram'
                            ),
                        ),
                    ),
                    'forminspectionprogram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/forminspectionprogram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'forminspectionprogram'
                            ),
                        ),
                    ),
                    'hazardoussupplies' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hazardoussupplies[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hazardoussupplies'
                            ),
                        ),
                    ),
                    'gethazardoussupplies' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/gethazardoussupplies[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'gethazardoussupplies'
                            ),
                        ),
                    ),
                    'addhazardoussupplies' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addhazardoussupplies[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addhazardoussupplies'
                            ),
                        ),
                    ),
                    'removehazardoussupplies' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removehazardoussupplies[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removehazardoussupplies'
                            ),
                        ),
                    ),
                    'formhazardoussupplies' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formhazardoussupplies[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formhazardoussupplies'
                            ),
                        ),
                    ),
                    'listmsds' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/listmsds[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'listmsds'
                            ),
                        ),
                    ),
                    'getmsds' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getmsds[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getmsds'
                            ),
                        ),
                    ),
                    'addmsds' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addmsds[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addmsds'
                            ),
                        ),
                    ),
                    'removemsds' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removemsds[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removemsds'
                            ),
                        ),
                    ),
                    'formmsds' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formmsds[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formmsds'
                            ),
                        ),
                    ),
                    'communications' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/communications[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'communications'
                            ),
                        ),
                    ),
                    'getcommunications' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getcommunications[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getcommunications'
                            ),
                        ),
                    ),
                    'addcommunication' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addcommunication[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addcommunication'
                            ),
                        ),
                    ),
                    'removecommunication' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removecommunication[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removecommunication'
                            ),
                        ),
                    ),
                    'formcommunication' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formcommunication[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formcommunication'
                            ),
                        ),
                    ),
                    'emergencyplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/emergencyplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'emergencyplan'
                            ),
                        ),
                    ),
                    'getemergencyplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getemergencyplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getemergencyplan'
                            ),
                        ),
                    ),
                    'addemergencyplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addemergencyplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addemergencyplan'
                            ),
                        ),
                    ),
                    'removeemergencyplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeemergencyplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeemergencyplan'
                            ),
                        ),
                    ),
                    'formemergencyplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formemergencyplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formemergencyplan'
                            ),
                        ),
                    ),
                    
                    'drillsphotos' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/drillsphotos[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'drillsphotos'
                            ),
                        ),
                    ),
                    'getdrillsphotos' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getdrillsphotos[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getdrillsphotos'
                            ),
                        ),
                    ),
                    'adddrillsphotos' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/adddrillsphotos[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'adddrillsphotos'
                            ),
                        ),
                    ),
                    'removedrillsphotos' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removedrillsphotos[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removedrillsphotos'
                            ),
                        ),
                    ),
                    'formdrillsphotos' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formdrillsphotos[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formdrillsphotos'
                            ),
                        ),
                    ),
                    
                    'drillsminutes' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/drillsminutes[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'drillsminutes'
                            ),
                        ),
                    ),
                    'getdrillsminutes' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getdrillsminutes[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getdrillsminutes'
                            ),
                        ),
                    ),
                    'adddrillsminutes' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/adddrillsminutes[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'adddrillsminutes'
                            ),
                        ),
                    ),
                    'removedrillsminutes' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removedrillsminutes[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removedrillsminutes'
                            ),
                        ),
                    ),
                    'formdrillsminutes' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formdrillsminutes[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formdrillsminutes'
                            ),
                        ),
                    ),  
                    'trainingplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/trainingplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'trainingplan'
                            ),
                        ),
                    ),
                    'gettrainingplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/gettrainingplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'gettrainingplan'
                            ),
                        ),
                    ),
                    'removetrainingplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removetrainingplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removetrainingplan'
                            ),
                        ),
                    ),
                    'addtrainingplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addtrainingplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addtrainingplan'
                            ),
                        ),
                    ),
                    'formtrainingplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formtrainingplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formtrainingplan'
                            ),
                        ),
                    ),
                    'risksurvey' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/risksurvey[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'risksurvey'
                            ),
                        ),
                    ),
                    'getrisksurvey' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getrisksurvey[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getrisksurvey'
                            ),
                        ),
                    ),
                    'removerisksurvey' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removerisksurvey[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removerisksurvey'
                            ),
                        ),
                    ),
                    'addrisksurvey' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addrisksurvey[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addrisksurvey'
                            ),
                        ),
                    ),
                    'formrisksurvey' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formrisksurvey[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formrisksurvey'
                            ),
                        ),
                    ),

                    'organigram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/organigram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'organigram'
                            ),
                        ),
                    ),
                    'getorganigram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getorganigram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getorganigram'
                            ),
                        ),
                    ),
                    'addorganigram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addorganigram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addorganigram'
                            ),
                        ),
                    ),
                    'removeorganigram' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeorganigram[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeorganigram'
                            ),
                        ),
                    ),
                    'ownersprofile' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/ownersprofile[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'ownersprofile'
                            ),
                        ),
                    ),
                    'getownersprofile' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getownersprofile[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getownersprofile'
                            ),
                        ),
                    ),
                    'addownersprofile' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addownersprofile[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addownersprofile'
                            ),
                        ),
                    ),
                    'formownersprofile' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formownersprofile[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formownersprofile'
                            ),
                        ),
                    ),
                    'requirements' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/requirements[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'requirements'
                            ),
                        ),
                    ),
                    'addrequirements' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addrequirements[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addrequirements'
                            ),
                        ),
                    ),
                    'removerequirements' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removerequirements[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removerequirements'
                            ),
                        ),
                    ),
                    'getrequirements' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getrequirements[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getrequirements'
                            ),
                        ),
                    ),
                    'getrequirementshelper' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getrequirementshelper[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getrequirementshelper'
                            ),
                        ),
                    ),
                    'formrequirements' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formrequirements[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formrequirements'
                            ),
                        ),
                    ),
                    'massreqprocess' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/massreqprocess[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'massreqprocess'
                            ),
                        ),
                    ),
                    'processmassreqs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processmassreqs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processmassreqs'
                            ),
                        ),
                    ),
                    'ieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/ieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'ieea'
                            ),
                        ),
                    ),
                    'addieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addieea'
                            ),
                        ),
                    ),
                    'removeieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeieea'
                            ),
                        ),
                    ),
                    'getieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getieea'
                            ),
                        ),
                    ),
                    'getieeathread' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getieeathread[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getieeathread'
                            ),
                        ),
                    ),
                    'formieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formieea'
                            ),
                        ),
                    ),
                    'massieeaprocess' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/massieeaprocess[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'massieeaprocess'
                            ),
                        ),
                    ),
                    'processmassieea' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processmassieea[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processmassieea'
                            ),
                        ),
                    ),
                    'listauditors' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/listauditors[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'listauditors'
                            ),
                        ),
                    ),
                    'getauditors' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getauditors[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getauditors'
                            ),
                        ),
                    ),
                    'saveauditor' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/saveauditor[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'saveauditor'
                            ),
                        ),
                    ),
                    'formauditor' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formauditor[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formauditor'
                            ),
                        ),
                    ),
                    'deleteauditor' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/deleteauditor[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'deleteauditor'
                            ),
                        ),
                    ),
                    'getaudits' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getaudits[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getaudits'
                            ),
                        ),
                    ),
                    'saveaudit' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/saveaudit[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'saveaudit'
                            ),
                        ),
                    ),
                    'listaudits' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/listaudits[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'listaudits'
                            ),
                        ),
                    ),
                    'removeaudit' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeaudit[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeaudit'
                            ),
                        ),
                    ),
                    'formaudit' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formaudit[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formaudit'
                            ),
                        ),
                    ),
                    'getaudittype' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getaudittype[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getaudittype'
                            ),
                        ),
                    ),
                    'getauditplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getauditplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getauditplan'
                            ),
                        ),
                    ),
                    'saveauditplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/saveauditplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'saveauditplan'
                            ),
                        ),
                    ),
                    'auditplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/auditplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'auditplan'
                            ),
                        ),
                    ),
                    'removeauditplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeauditplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeauditplan'
                            ),
                        ),
                    ),
                    'formauditplan' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formauditplan[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formauditplan'
                            ),
                        ),
                    ),
                    'safetycommittee' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/safetycommittee[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'safetycommittee'
                            ),
                        ),
                    ),
                    'getcommitteepositions' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getcommitteepositions[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getcommitteepositions'
                            ),
                        ),
                    ),
                    'getsafetycommittee' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getsafetycommittee[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getsafetycommittee'
                            ),
                        ),
                    ),
                    'addsafetycommittee' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addsafetycommittee[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addsafetycommittee'
                            ),
                        ),
                    ),
                    'removesafetycommittee' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removesafetycommittee[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removesafetycommittee'
                            ),
                        ),
                    ),
                    'formsafetycommittee' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formsafetycommittee[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formsafetycommittee'
                            ),
                        ),
                    ),
                    'committeeproceedings' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/committeeproceedings[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'committeeproceedings'
                            ),
                        ),
                    ),
                    'getcommitteeproceedings' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/getcommitteeproceedings[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'getcommitteeproceedings'
                            ),
                        ),
                    ),
                    'addcommitteeproceedings' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addcommitteeproceedings[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addcommitteeproceedings'
                            ),
                        ),
                    ),
                    'removecommitteeproceedings' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removecommitteeproceedings[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removecommitteeproceedings'
                            ),
                        ),
                    ),
                    'formcommitteeproceedings' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formcommitteeproceedings[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formcommitteeproceedings'
                            ),
                        ),
                    ),
                    'massdocprocess' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/massdocprocess[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'massdocprocess'
                            ),
                        ),
                    ),
                    'processmassdocs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processmassdocs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processmassdocs'
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
                    'newincident'  => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/newincident',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'newincident'
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
                            'route'    => '/threaddetails[/:id_thread[/:country[/:company[/:location[/:process_id]]]]]',
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
                    'removedocument' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removedocument[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removedocument'
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
                    'removehiradocs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removehiradocs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removehiradocs'
                            ),
                        ),
                    ),
                    'addhiradocs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addhiradocs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addhiradocs'
                            ),
                        ),
                    ),
                    'formhiradocs' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formhiradocs[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formhiradocs'
                            ),
                        ),
                    ),
                    'masshiraprocess' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/masshiraprocess[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'masshiraprocess'
                            ),
                        ),
                    ),
                    'processmasshira' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/processmasshira[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'processmasshira'
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
                    'removeincidents' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/removeincidents[/:id[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'removeincidents'
                            ),
                        ),
                    ),
                    'addincidentcauses' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addincidentcauses[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addincidentcauses'
                            ),
                        ),
                    ),
                    'addincidentclose' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addincidentclose[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addincidentclose'
                            ),
                        ),
                    ),
                    'addincidentvalidity' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/addincidentvalidity[/:id]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'addincidentvalidity'
                            ),
                        ),
                    ),
                    'hiraincidents' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/hiraincidents[/:id[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'hiraincidents'
                            ),
                        ),
                    ),
                    'gethiraincidents' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/gethiraincidents[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'gethiraincidents'
                            ),
                        ),
                    ),
                    'formincidentcauses' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formincidentcauses[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formincidentcauses'
                            ),
                        ),
                    ),
                    'formincidentclose' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formincidentclose[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formincidentclose'
                            ),
                        ),
                    ),
                    'formincidentvalidity' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/formincidentvalidity[/:company[/:country[/:location[/:date_incident[/:process_id[/:thread_id]]]]]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                                //'id'         => '[0-9_-]*',
                            ),
                            'defaults' => array(
                                'action' => 'formincidentvalidity'
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
