<?php
/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */

return array(
    'db' => array(
        'driver'    => 'Pdo',
        'dsn'       => 'pgsql:dbname=psamment;host=localhost',
        'driver_options' => array(
            PDO::PGSQL_ATTR_DISABLE_NATIVE_PREPARED_STATEMENT => true,
            PDO::ATTR_EMULATE_PREPARES => true
        ),
    ),
    'mssql_db' => array(
        'driver'         => 'Pdo',
        //'dsn'            => 'dblib:host=SQLEXPRESS;dbname=bygweb_isov2kr3',
        //'dsn'            => 'odbc:Driver=FreeTDS;Server=192.168.3.100;Database=bygweb_isov2kr3',
        'dsn'       => 'odbc:Driver=FreeTDS;Server=SQL100;Database=bygweb_isov2kr3',
        'charset'        =>  'UTF-8',
        //'pdotype'       => 'dblib',
    ),
    'service_manager' => array(
		'factories' => array(
                        /*
                         * PostgreSQL Adapter Initiator
                         */
			'Zend\Db\Adapter\Adapter'
			=> 'Zend\Db\Adapter\AdapterServiceFactory',
                        /*
                         * MSSQL Adapter Initiator
                         */
                        'Application\Db\AdapterTwo' => function($sm) {
                        $config = $sm->get('Config');
                        return new \Zend\Db\Adapter\Adapter($config['mssql_db']);
                    },
		),
    ),
    'ldap_config' => array(
        'server1' => array(
            'bindRequiresDn' => true,
        ),
        'server2' => array(
            'useSsl' => true,
        ),
        'server3' => array(
    		'useSsl' => true,
        ),
    ),

);