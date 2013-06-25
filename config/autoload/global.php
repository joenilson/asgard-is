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
    // ...
    'db' => array(
		'driver'    => 'Pdo',
		'dsn'       => 'pgsql:dbname=psamment;host=localhost',
        'driver_options' => array(
            PDO::PGSQL_ATTR_DISABLE_NATIVE_PREPARED_STATEMENT => true,
            PDO::ATTR_EMULATE_PREPARES => true
        ),
    ),
    'service_manager' => array(
		'factories' => array(
			'Zend\Db\Adapter\Adapter'
			=> 'Zend\Db\Adapter\AdapterServiceFactory',
		),
    ),
    'ldap_config' => array(
        'server1' => array(
            'bindRequiresDn'         => true,
        ),
        'server2' => array(
            'useSsl'                 => true,
        ),
        'server3' => array(
    		'useSsl'                 => true,
        ),
    ),

);