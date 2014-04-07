<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/IMS for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace IMS;

use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\ModuleManager\ModuleManager;
use Zend\Mvc\ModuleRouteListener;
use IMS\Model\ContentTextTable;
use IMS\Model\DocsLibraryTable;
use IMS\Model\DocsHelpersTable;
use IMS\Model\DocsRequestTable;
use IMS\Model\hiraMatrixTable;
use IMS\Model\hiraFrequencyTable;
use IMS\Model\hiraSeverityTable;
use IMS\Model\hiraRiskLevelTable;
use IMS\Model\hiraRiskLevelI18nTable;
use IMS\Model\hiraDocumentsTable;
use IMS\Model\hiraIncidentTypeTable;
use IMS\Model\hiraNonConformityTypeTable;
use IMS\Model\hiraIncidentsTable;
use IMS\Model\ProcessMainTable;
use IMS\Model\ProcessMainView;
use IMS\Model\ProcessRelationsTable;
use IMS\Model\ProcessThreadTable;
use IMS\Model\ProcessOwnerTable;
use IMS\Model\CSBTable;
use IMS\Model\CSITable;
use IMS\Model\CSRTable;
use IMS\Model\CSSTable;
use IMS\Model\ManagementIndicatorsTable;
use IMS\Model\AuditorsTable;

class Module implements AutoloaderProviderInterface
{
    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php',
            ),
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
		    // if we're in a namespace deeper than one level we need to fix the \ in the path
                    __NAMESPACE__ => __DIR__ . '/src/' . str_replace('\\', '/' , __NAMESPACE__),
                ),
            ),
        );
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function init(ModuleManager $moduleManager)
    {
    	$sharedEvents = $moduleManager->getEventManager()->getSharedManager();
    	$sharedEvents->attach(__NAMESPACE__, 'dispatch', function($e) {
    		// This event will only be fired when an ActionController under the MyModule namespace is dispatched.
    		$controller = $e->getTarget();
    		$controller->layout('layout/contentlayout');
    	}, 100);
    }
    
    public function onBootstrap($e)
    {
        // You may not need to do this if you're doing it elsewhere in your
        // application
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }
    
    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'IMS\Model\AuditorsTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new AuditorsTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\CSBTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CSBTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\CSITable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CSITable($dbAdapter);
                    return $table;
                },
                'IMS\Model\CSRTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CSRTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\CSSTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CSSTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ManagementIndicatorsTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ManagementIndicatorsTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\DocsLibraryTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new DocsLibraryTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\DocsHelpersTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new DocsHelpersTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\DocsRequestTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new DocsRequestTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ProcessOwnerTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ProcessOwnerTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ProcessRelationsTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ProcessRelationsTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ProcessMainView'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ProcessMainView($dbAdapter);
                    return $table;
                },
                'IMS\Model\ProcessMainTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ProcessMainTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ProcessThreadTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ProcessThreadTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraDocumentsTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraDocumentsTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraIncidentsTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraIncidentsTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraIncidentTypeTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraIncidentTypeTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraNonConformityTypeTable'=> function($sm){
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraNonConformityTypeTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\ContentTextTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ContentTextTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraRiskLevelTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraRiskLevelTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraSeverityTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraSeverityTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraFrequencyTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraFrequencyTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraRiskLevelI18nTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraRiskLevelI18nTable($dbAdapter);
                    return $table;
                },
                'IMS\Model\hiraMatrixTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new hiraMatrixTable($dbAdapter);
                    return $table;
                },
            )
        );
    }
}
