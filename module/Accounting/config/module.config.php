<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Accounting\Controller\Accounting' => 'Accounting\Controller\AccountingController',
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'accounting' => __DIR__ . '/../view',
        ),
    ),
);