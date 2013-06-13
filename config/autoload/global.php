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
		'driver'         => 'Pdo',
		'dsn'            => 'pgsql:dbname=psamment;host=localhost',
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
        'kolareal.com.do' => array(
            'host'                   => 'mail.kolareal.com.do',
            'username'               => 'CN=user1,DC=foo,DC=net',
            'password'               => 'pass1',
            'bindRequiresDn'         => true,
            'accountDomainName'      => 'kolareal.com.do',
            'baseDn'                 => 'DC=kolareal,DC=com,DC=do',
        ),
        'kr.com.pe' => array(
            'host'                   => 'smtp.kr.com.pe',
            'useSsl'                 => true,
            'accountDomainName'      => 'kr.com.pe',
            'accountCanonicalForm'   => 4, // ACCT_FORM_PRINCIPAL
            'baseDn'                 => 'DC=kr,DC=com,DC=pe',
        ),
        'group-ism.com' => array(
    		'host'                   => 'smtp.group-ism.com',
    		'useSsl'                 => true,
    		'accountDomainName'      => 'group-ism.com',
    		'accountCanonicalForm'   => 4, // ACCT_FORM_PRINCIPAL
    		'baseDn'                 => 'DC=group-ism,DC=com',
        ),
    ),

);