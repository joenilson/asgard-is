<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Sales\Controller\Sales' => 'Sales\Controller\SalesController',
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            'sales' => __DIR__ . '/../view',
        ),
    ),
);