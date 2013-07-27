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
use Zend\Escaper\Escaper;

use IMS\Model\Entity\ContentText;

use AsgardLib\Versioning\Documents;
use AsgardLib\Versioning\Scope;

class IndexController extends AbstractActionController
{
    protected $adminusersubmodulesTable;
    protected $contentTextTable;
    protected $hiraMatrixTable;
    protected $hiraSeverityTable;
    protected $hiraFrequencyTable;
    protected $hiraRLTable;
    protected $hiraRLI18nTable;
    protected $messagesTable;
    protected $translationTable;
    
    public function indexAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        
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
        
        $contentModule = $this->getContentTextTable()->getContentByCCL(
            $idModule,
            $idSubmodule,
            $userPrefs[0]['lang'],
            $userData->country,
            $userData->company,
            $userData->location
        );
        
        $versioning = new Documents();
        $scopeDocument = new Scope();
        if(!empty($contentModule)){
            $contentVersioning = $versioning->getVersioning(
                                $contentModule->majorversion, 
                                $contentModule->minorversion, 
                                $contentModule->correction);
            $escaper = new Escaper('UTF-8');
            $panelContent = $escaper->escapeJs($contentModule->content);
            $versioningDate = date_format(new \DateTime($contentModule->date_creation), "d-m-Y");
            $documentScope = $scopeDocument->getScopeParams($contentModule->country, $contentModule->company, $contentModule->location)->type_scope;
            $messageContent = "";
        }else{
            $msgBox = $this->getMessagesTable()->getMessage($userPrefs[0]['lang'],'NoContent');
            $contentVersioning = $versioning->getVersioning(
                                        null, null, null);
            $panelContent = "";
            $versioningDate = "";
            $documentScope = "";
            $messageContent = $msgBox->value;
        }
        $panelHeader="<div class=\"versioning\"> ".
            "<div class=\"versioning_title\">Version: </div>  ".
            "<div class=\"versioning_type\">$contentVersioning</div> ".
            "<div class=\"versioning_date\">Valid from: </div> ".
            "<div class=\"versioning_datecreation\">$versioningDate</div> ".
            "<div class=\"versioning_scope\">Valid from: </div> ".
            "<div class=\"versioning_documentscope\">$versioningDate</div> ".
            "<div class=\"versioning_history\"></div> ".
            "<div class=\"versioning_historylist\"></div> ".
            "</div>";
        
        return array('role'=>$role,
            'panelVersioning'=>$panelHeader,
            'versioningDate'=>$versioningDate,
            'documentScope'=>$documentScope,
            'panelContent'=>$panelContent,
            'versioningContent'=>$contentVersioning,
            'message'=>$messageContent,
            'contentId'=>$this->params()->fromRoute('id', 0),
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)));
    }
    
    public function hiraAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        
        $moduleParams = explode('-',$this->params()->fromRoute('id', 0));
        $idUser = $userPrefs[0]['user_id'];
        $idModule = $moduleParams[0];
        $idSubmodule = $moduleParams[1];
        
        $HiraMatrix = $this->getHiraMatrixTable()->getMatrix( 
            $userData->country,
            $userData->company,
            $userData->location);
        $HiraSeverityLabels = $this->getHiraSeverityTable()->getSeverityList($userPrefs[0]['lang']);
        $HiraFrequencyLabels = $this->getHiraFrequencyTable()->getFrequencyList($userPrefs[0]['lang']);
        $hiraRiskLevel = $this->getHiraRLTable()->fetchAll();
        $hiraRiskLevelI18n = $this->getHiraRLI18nTable()->getTextList($userPrefs[0]['lang']);
        
        $translator = $this->getTranslationTable();
        $titleRiskLevel=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleRiskLevel_'.$idSubmodule);
        $titleDescription=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleDescription_'.$idSubmodule);
        $titleCorrectionTime=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleCorrectionTime_'.$idSubmodule);
        $titleSeverity=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleSeverity_'.$idSubmodule);
        $titleFrequency=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleFrequency_'.$idSubmodule);
        $titleMatrixRiskEval=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleMatrixRiskEval_'.$idSubmodule);
        $timeLabels=$translator->getTranslationList($userPrefs[0]['lang'],'time');
        
        return array('hiraMatrix'=>$HiraMatrix,
            'severityLabels'=>$HiraSeverityLabels,
            'frequencyLabels'=>$HiraFrequencyLabels,
            'hiraRiskLevel'=>$hiraRiskLevel,
            'hiraRiskLabels'=>$hiraRiskLevelI18n,
            'titleRiskLevel'=>$titleRiskLevel['value'],
            'titleDescription'=>$titleDescription['value'],
            'titleCorrectionTime'=>$titleCorrectionTime['value'],
            'titleSeverity'=>$titleSeverity['value'],
            'titleFrequency'=>$titleFrequency['value'],
            'titleMatrixRiskEval'=>$titleMatrixRiskEval['value'],
            'timeLabels'=>$timeLabels);
            /*
            'contentId'=>$this->params()->fromRoute('id', 0),
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)));
             * 
             */
        
    }
            
    public function saveContentAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        
        $request = $this->getRequest();
        $moduleParams = explode('-',$this->params()->fromRoute('id', 0));
        $contentTextData = $request->getPost('rtfeditor');
        $versioning = explode('.',$request->getPost('content_versioning'));
        $type_versioning = $request->getPost('type_versioning');
        $type_scope = $request->getPost('type_versioning');
        
        $lang = $userPrefs[0]['lang'];
      
        $scopeDocument = new Scope();
        $scope = $scopeDocument->setScopeParams($userData->country, $userData->company, $userData->location, $type_scope);
        
        if(isset($scope->errorMessage)){
            $data['success']=false;
            $msgBox = $this->getMessagesTable()->getMessage($userPrefs[0]['lang'],$scope->errorMessage);
            $data['msg']=$msgBox;
        }
        
        $versioningDocument = new Documents();
        $mmc = $versioningDocument->setVersioning($versioning[0],$versioning[1],$versioning[2],$type_versioning);
        
        $date_now=date('Y-m-d H:i:s.').str_pad(substr((float)microtime(), 2), 6, '0', STR_PAD_LEFT);
        
        $contentData = $this->getContentTextTable();
        $contentTextBody = new ContentText();
        $contentTextBody->setId_module($moduleParams[0])
                ->setId_submodule($moduleParams[1])
                ->setLang($lang)
                ->setContent($contentTextData)
                ->setMajorversion($mmc['majorversion'])
                ->setMinorversion($mmc['minorversion'])
                ->setCorrection($mmc['correction'])
                ->setDate_creation($date_now)
                ->setDate_lastmodif($date_now)
                ->setUser_id($userPrefs[0]['user_id'])
                ->setCountry($scope->country_scope)
                ->setCompany($scope->company_scope)
                ->setLocation($scope->location_scope);
        
        if($contentData->save($contentTextBody)){
            $data['success']=true; 
        }else{
            $data['success']=false;
            $data['msg']="Error trying to save the information...";
        }
        
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
    
    public function getHiraMatrixTable()
    {
    	if (!$this->hiraMatrixTable) {
            $sm = $this->getServiceLocator();
            $this->hiraMatrixTable = $sm->get('IMS\Model\hiraMatrixTable');
    	}
    	return $this->hiraMatrixTable;
    }
    
    public function getHiraSeverityTable()
    {
    	if (!$this->hiraSeverityTable) {
            $sm = $this->getServiceLocator();
            $this->hiraSeverityTable = $sm->get('IMS\Model\hiraSeverityTable');
    	}
    	return $this->hiraSeverityTable;
    }
    
    public function getHiraFrequencyTable()
    {
    	if (!$this->hiraFrequencyTable) {
            $sm = $this->getServiceLocator();
            $this->hiraFrequencyTable = $sm->get('IMS\Model\hiraFrequencyTable');
    	}
    	return $this->hiraFrequencyTable;
    }
    
    public function getHiraRLTable()
    {
    	if (!$this->hiraRLTable) {
            $sm = $this->getServiceLocator();
            $this->hiraRLTable = $sm->get('IMS\Model\hiraRiskLevelTable');
    	}
    	return $this->hiraRLTable;
    }
    
    public function getHiraRLI18nTable()
    {
    	if (!$this->hiraRLI18nTable) {
            $sm = $this->getServiceLocator();
            $this->hiraRLI18nTable = $sm->get('IMS\Model\hiraRiskLevelI18nTable');
    	}
    	return $this->hiraRLI18nTable;
    }
    
    public function getMessagesTable()
    {
    	if (!$this->messagesTable) {
            $sm = $this->getServiceLocator();
            $this->messagesTable = $sm->get('Application\Model\MessagesTable');
    	}
    	return $this->messagesTable;
    }
    
    public function getTranslationTable()
    {
    	if (!$this->translationTable) {
    		$sm = $this->getServiceLocator();
    		$this->translationTable = $sm->get('Application\Model\TranslationTable');
    	}
    	return $this->translationTable;
    }
}
