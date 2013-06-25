<?php
/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));

// Setup autoloading
require 'init_autoloader.php';

Zend\Loader\AutoloaderFactory::factory(array(
    'Zend\Loader\StandardAutoloader' => array(
        'namespaces' => array(
            'AsgardLib' => __DIR__ . '/../vendor/AsgardLib',
        ),
    )
));

// Run the application!
Zend\Mvc\Application::init(require 'config/application.config.php')->run();
