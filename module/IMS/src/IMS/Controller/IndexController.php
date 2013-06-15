<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/IMS for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace IMS\Controller;

use Zend\Mvc\Controller\AbstractActionController;

class IndexController extends AbstractActionController
{
    protected $adminusersubmodulesTable;
    
    public function indexAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        
        $request = $this->getRequest();
        $moduleParams = explode('-',$this->params()->fromRoute('id', 0));
        $idUser = $userPrefs[0]['user_id'];
        $idModule = $moduleParams[0];
        $idSubmodule = $moduleParams[1];
        
        $userGrantedAccess = $this->getAdminUserSubmodulesTable()->getUserSubmodulesAccess($idUser, $idModule, $idSubmodule);
        if(!empty($userGrantedAccess)){
            $role='Viewer';
            $role=($userGrantedAccess[0]['admin']==1)?'Administrator':$role;
            $role=($userGrantedAccess[0]['add']==1)?'Key User':$role;
            $role=($userGrantedAccess[0]['edit']==1)?'Editor':$role;
        }
        
        return array('role'=>$role,'panelContent'=>'Hello World!');
    }
    
    
    public function fooAction()
    {
        // This shows the :controller and :action parameters in default route
        // are working when you browse to /index/index/foo
        return array();
    }
    
    public function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
}
