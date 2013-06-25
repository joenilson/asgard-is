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
use Zend\View\Model\JsonModel;
use IMS\Model\Entity\ContentText;
use AsgardLib\Versioning\Documents;

class IndexController extends AbstractActionController
{
    protected $adminusersubmodulesTable;
    protected $contentTextTable;
    
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
        
        $contentModule = $this->getContentTextTable()->getContent($idModule,$idSubmodule,$userPrefs[0]['lang']);
        $versioning = new Documents();
        if(!empty($contentModule)){
            $contentVersioning = $versioning->getVersioning(
                                $contentModule->majorversion, 
                                $contentModule->minorversion, 
                                $contentModule->correction);
            $panelContent = $contentModule->content; 
        }else{
            $contentVersioning = $versioning->getVersioning(
                                        null, null, null);
            $panelContent = "";
        }
        $panelHeader="<div class='versioning'>$contentVersioning</div>";
        
        return array('role'=>$role,'panelVersioning'=>$panelHeader,'panelContent'=>$contentModule,'contentId'=>$this->params()->fromRoute('id', 0));
    }
    
    
    public function saveContentAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $request = $this->getRequest();
        $moduleParams = explode('-',$this->params()->fromRoute('id', 0));
        $contentTextData = $request->getPost('content_text');
        $lang = $userPrefs[0]['lang'];
        
        $contentText = $this->getContentTextTable();
        $contentTextBody = new ContentText;
        $contentTextBody->setId_module($moduleParams[0])
                ->setId_submodule($moduleParams[1])
                ->setLang($lang)
                ->setContent($contentTextData);
        /*
                ->setMajorversion($majorversion)
                ->setMinorversion($minorversion)
                ->setCorrection($correction)
                ->setDate_creation($date_creation)
                ->setDate_lastmodif($date_lastmodif);
        */
        $contentText->saveContent($contentTextBody);
        
        $data['success']=true;
        $result = new JsonModel($data);
    	return $result;
    }
    
    public function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
    		$sm = $this->getServiceLocator();
    		$this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
    
     public function getContentTextTable()
    {
    	if (!$this->contentTextTable) {
    		$sm = $this->getServiceLocator();
    		$this->contentTextTable = $sm->get('IMS\Model\ContentTextTable');
    	}
    	return $this->contentTextTable;
    }
}
