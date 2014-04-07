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
use Zend\View\Model\ViewModel;
use Zend\Escaper\Escaper;
use Zend\Validator\File;

use IMS\Model\Entity\ContentText;
use IMS\Model\Entity\ProcessRelations;
use IMS\Model\Entity\DocsRequest;
use IMS\Model\Entity\DocsLibrary;

use AsgardLib\Versioning\Documents;
use AsgardLib\Versioning\Scope;

class IndexController extends AbstractActionController
{
    protected $auditorsTable;
    protected $adminusersubmodulesTable;
    protected $contentTextTable;
    protected $hiraMatrixTable;
    protected $hiraSeverityTable;
    protected $hiraFrequencyTable;
    protected $hiraRLTable;
    protected $hiraRLI18nTable;
    protected $hiraDocumentsTable;
    protected $messagesTable;
    protected $translationTable;
    protected $hiraIncidentTypeTable;
    protected $hiraIncidentsListTable;
    protected $hiraNonConformityTypeTable;
    protected $processmainView;
    protected $processmainTable;
    protected $processownerTable;
    protected $processRelationsTable;
    protected $processThreadTable;
    protected $docsLibraryTable;
    protected $docsHelpersTable;
    protected $docsRequestTable;
    protected $companiesTable;
    protected $countriesTable;
    protected $locationsTable;
    protected $systemConfig;
    
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
            $role=($userGrantedAccess[0]['admin']==1)?'Admin':$role;
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
    
    public function diagramAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        //$userData = $this->getServiceLocator()->get('userSessionData');
        
        $lang=$userPrefs[0]['lang'];
        
        $translator = $this->getTranslationTable();
        $imsMainProcess = $translator->getTranslationItem($lang,'diagram','ims-main-process');
        $imsStrategicProcess = $translator->getTranslationItem($lang,'diagram','ims-strategic-process');
        $imsSupportProcess = $translator->getTranslationItem($lang,'diagram','ims-support-process');
        
        return array(
            'ims_main_process'=>$imsMainProcess->value,
            'ims_strategic_process'=>$imsStrategicProcess->value,
            'ims_support_process'=>$imsSupportProcess->value,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function listauditorsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function getauditorsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $year = $request->getQuery('year');

        $sql = $this->getAuditorsTable();
        $dataAuditors = $sql->getAuditorsByCCLY($company,$country,$location,$year);
        if($dataAuditors){
            $dataResult['success']=true;
            $dataResult['results']=$dataAuditors;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function saveauditorAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $year = $request->getPost('yearsCombo');
        $auditorName = $request->getPost('auditorname');
        $auditorDip = $request->getPost('auditordip');
        $id = $request->getPost('auditor_id');
        $date_creation = \date('Y-m-d h:i:s');
        
        $dataResult = array();
        
        $sql = $this->getAuditorsTable();
        
        $auditor = new \IMS\Model\Entity\Auditors();
        $auditor->setAuditor_name($auditorName)
                ->setAuditor_dip($auditorDip)
                ->setYear($year)
                ->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setUser_id($userData->id)
                ->setDate_creation($date_creation);
        if($id){
            $auditor->setId($id);
        }
        
        $dataResult['success'] = true; 
        try {
            $sql->save($auditor);
            
        } catch (\Exception $ex) {
            //$error = $ex;
            
            $dataResult['success'] = false; 
            $dataResult['message'] = $ex; 
        }
        return new JsonModel($dataResult);
    }
    
    public function formauditorAction(){
        $request = $this->getRequest();
        $auditor_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $year = $request->getPost('year');
        
        $sql = $this->getAuditorsTable();
        $AuditorData = $sql->getAuditorsByCCLYId($company,$country,$location,$year,$auditor_id);
        $dataResult = array();
        foreach($AuditorData as $key=>$values){
            $dataResult['companiesCombo']=$values['company'];
            $dataResult['countriesCombo']=$values['country'];
            $dataResult['locationsCombo']=$values['location'];
            $dataResult['yearsCombo']=$values['year'];
            $dataResult['auditorname']=$values['auditor_name'];
            $dataResult['auditordip']=$values['auditor_dip'];
        }
        $data = array();
        if(count($dataResult>0)){
            $data['success']=true;
            $data['data']=$dataResult;
        }else{
            $data['success']=false;
            $data['data']="";
        }
        
        return new JsonModel($data);
    }
    
    public function deleteauditorAction(){
        $request = $this->getRequest();
        $auditor_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $year = $request->getPost('year');
        $sql = $this->getAuditorsTable();
        $AuditorData = $sql->getAuditorsByCCLYId($company,$country,$location,$year,$auditor_id);
        $dataRemove = array();
        if(count($AuditorData)>0){
            $dataRemove['company']=$company;
            $dataRemove['country']=$country;
            $dataRemove['location']=$location;
            $dataRemove['year']=$year;
            $dataRemove['id']=$auditor_id;
            $sql->delete($dataRemove);
        }
        
        
        return new JsonModel(array('success'=>true));
    }
    
    public function hiraspecsAction()
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
        
        return array(
            'hiraMatrix'=>$HiraMatrix,
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
            'timeLabels'=>$timeLabels,
            'subpanelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
        );
        
    }
    
    public function hiraAction()
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
            $role=($userGrantedAccess[0]['admin']==1)?'Admin':$role;
            $role=($userGrantedAccess[0]['add']==1)?'Key User':$role;
            $role=($userGrantedAccess[0]['edit']==1)?'Editor':$role;
        }
        
        $translator = $this->getTranslationTable();
        
        $titleHiraSpecs=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'titleHiraSpecs_'.$idSubmodule);
        $HiraGridTitle_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridTitle_'.$idSubmodule);
        $HiraGridHeaderTypeProcess_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderTypeProcess_'.$idSubmodule);
        $HiraGridHeaderProcess_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderProcess_'.$idSubmodule);
        $HiraGridHeaderSubProcess_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderSubProcess_'.$idSubmodule);
        $HiraGridHeaderDangerDesc_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderDangerDesc_'.$idSubmodule);
        $HiraGridHeaderRiskDesc_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderRiskDesc_'.$idSubmodule);
        $HiraGridHeaderHiraEval_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderHiraEval_'.$idSubmodule);
        $HiraGridHeaderMeasures_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderMeasures_'.$idSubmodule);
        $HiraGridHeaderScaleHigh_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderScaleHigh_'.$idSubmodule);
        $HiraGridHeaderScaleMedium_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderScaleMedium_'.$idSubmodule);
        $HiraGridHeaderScaleLow_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderScaleLow_'.$idSubmodule);
        $HiraGridHeaderResidualRiskEval_38=$translator->getTranslationItem($userPrefs[0]['lang'],$idModule,'HiraGridHeaderResidualRiskEval_'.$idSubmodule);
        
        return array(
            'userRole'=>$role,
            'titleHiraSpecs'=>$titleHiraSpecs['value'],
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
            'moduleId'=>$this->params()->fromRoute('id', 0),
            'HiraGridTitle'=>$HiraGridTitle_38['value'],
            'HiraGridHeaderTypeProcess'=>$HiraGridHeaderTypeProcess_38['value'],
            'HiraGridHeaderProcess'=>$HiraGridHeaderProcess_38['value'],
            'HiraGridHeaderSubProcess'=>$HiraGridHeaderSubProcess_38['value'],
            'HiraGridHeaderDangerDesc'=>$HiraGridHeaderDangerDesc_38['value'],
            'HiraGridHeaderRiskDesc'=>$HiraGridHeaderRiskDesc_38['value'],
            'HiraGridHeaderHiraEval'=>$HiraGridHeaderHiraEval_38['value'],
            'HiraGridHeaderMeasures'=>$HiraGridHeaderMeasures_38['value'],
            'HiraGridHeaderScaleHigh'=>$HiraGridHeaderScaleHigh_38['value'],
            'HiraGridHeaderScaleMedium'=>$HiraGridHeaderScaleMedium_38['value'],
            'HiraGridHeaderScaleLow'=>$HiraGridHeaderScaleLow_38['value'],
            'HiraGridHeaderResidualRiskEval'=>$HiraGridHeaderResidualRiskEval_38['value'],

        );
        
    }
   
    public function processAction()
    {
        $id = $this->params()->fromRoute('process_id', 0);
        $company  = $this->params()->fromRoute('company', 0);
        $country  = $this->params()->fromRoute('country', 0);
        $location  = $this->params()->fromRoute('location', 0);
        $parent_id  = $this->params()->fromRoute('parent_id', 0);
        $type_process = $this->params()->fromRoute('type', 0);
        
        $companyRequest = $this->getCompaniesTable()->getCompanyById($company);
        $countryRequest = $this->getCountriesTable()->getCountryById($country);
        $locationRequest = $this->getLocationsTable()->getLocationById($country,$location);
        //print_r($companyRequest);
        return new ViewModel (
                array(
                    'panelId'=>$id.'_'.$parent_id.'_'.$type_process,
                    'process_id'=>$id,
                    'process_type'=>$type_process,
                    'company'=>$company,
                    'companyDesc'=>$companyRequest[0]['legal_name'],
                    'country'=>$country,
                    'countryDesc'=>$countryRequest[0]['name'],
                    'location'=>$location,
                    'locationDesc'=>$locationRequest[0]['location_name']
                )
            );
    }
    
    public function processdiagramAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $module = $request->getPost('module');
        $process = $request->getPost('process');
        $company= $request->getPost('company');
        $country= $request->getPost('country');
        $location = $request->getPost('location');
        $parent_id = $request->getPost('pid');
        $type = $request->getPost('type');
        $type_process = $request->getPost('type_process');
        $ids = json_decode($request->getPost('values'));
        
        if($module != "diagram") 
            die();
        
        switch ($process){
            case 'ims-main-process':
                $process_type = 2;
                break;
            case 'ims-strategic-process':
                $process_type = 1;
                break;
            case 'ims-support-process':
                $process_type = 3;
                break;
            case 'ims-thread-list':
                $process_type = $parent_id;
        }
        $date_now=date("Y-m-d H:i:s");
        $processCounter=0;
        $proc_rel = $this->getProcessRelationsTable();
            
        foreach($ids as $value)
        {
            $processRelation = new ProcessRelations();
            $processRelation->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setId($value)
                ->setParent_id($process_type)
                ->setType($type_process)
                ->setUser_id($userData->id)
                ->setDate_creation($date_now);
            if($type==='plus'){
                $proc_rel->save($processRelation);
            }elseif($type==='minus'){
                $proc_rel->removeProcessRelations($processRelation);
            }
            $processCounter++;
        }

        $action = ($type==='plus')?"added":"removed";
        
        if(!empty($processCounter)){
            $data['success']=true;
            $data['results']=$processCounter." documents $action.";
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;  
    }
    
    public function processmainlistAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $moduleParams = explode('-',$this->params()->fromRoute('id_process', 0));
        
        $parent_type = $request->getQuery('type');
        $assigned = $request->getQuery('assigned');
        $company= $request->getQuery('company');
        $country= $request->getQuery('country');
        $location= $request->getQuery('location');
        $process= $request->getQuery('process');
        
        switch ($process){
            case 'ims-main-process':
                $process_type = 2;
                break;
            case 'ims-strategic-process':
                $process_type = 1;
                break;
            case 'ims-support-process':
                $process_type = 3;
                break;
        }
        
        $parent_id = (!empty($parent_type))?$parent_type:$process_type;
        
        $queryPM = $this->getProcessMainTable();
        $listDocuments = $queryPM->getMainProcess($lang,$parent_id,$assigned,$company,$country,$location);
        
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['results']='';
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;  
    }
    
    public function processthreadlistAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        
        $moduleParams = explode('-',$this->params()->fromRoute('id_process', 0));
        
        $assignment = $request->getQuery('type');
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $process_id = $request->getQuery('pid');
        
        $queryPM = $this->getProcessThreadTable();
        $listDocuments = $queryPM->getThreads($lang,$assignment,$company,$country,$location,$process_id);
        
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;  
    }
    
    public function processlistAction() 
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        $data['success']=false;
        $queryPL = $this->getProcessMainView();
        $listDocuments = $queryPL->getProcessList($lang);
        if($listDocuments){
            $data['success']=true;
            $data['results']=$listDocuments;
        }else{
            $data['msg']="Error trying to get the information...";;
        }
        return new JsonModel($data);
    }
    
    public function threaddetailsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $thread_id = $this->params()->fromRoute('id_thread',0);
        $company  = $this->params()->fromRoute('company', 0);
        $country  = $this->params()->fromRoute('country', 0);
        $location  = $this->params()->fromRoute('location', 0);

        $queryPM = $this->getProcessThreadTable();
        $listDocuments = $queryPM->getThreadInfo($lang,$thread_id);
        //print_r($listDocuments);
        return array(
            'threadId'=>$thread_id,
            'company'=>$company,
            'country'=>$country,
            'location'=>$location,
            'threadData'=>$listDocuments
        );
    }
    
    public function processdocslistAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        
        $module = $request->getQuery('module');
        $company= $request->getQuery('company');
        $country= $request->getQuery('country');
        $location= $request->getQuery('location');
        if($module){
            $sql = $this->getDocsLibraryTable();
            $listDocuments = $sql->getLibrary($lang,$company,$country,$location);
            //print_r($listDocuments);
            if(!empty($listDocuments)){
                $data['success']=true;
                $data['country']=$country;
                $data['company']=$company;
                $data['location']=$location;
                $data['results']=$listDocuments;
                $data['msg']="";
            }else{
                $data['success']=false;
                $data['msg']="Error trying to get the information...";
            }
            $result = new JsonModel($data);
            return $result;
        }
    }
    
    public function processrequestlistAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        
        $module = $request->getQuery('module');
        $company= $request->getQuery('company');
        $country= $request->getQuery('country');
        $location= $request->getQuery('location');
        if($module){
            $sql = $this->getDocsRequestTable();
            $listDocuments = $sql->getRequestByCCL($company,$country,$location);
            //print_r($listDocuments);
            if(!empty($listDocuments)){
                $data['success']=true;
                $data['results']=$listDocuments;
                $data['msg']="";
            }else{
                $data['success']=false;
                $data['msg']="Error trying to get the information...";
            }
            $result = new JsonModel($data);
            return $result;
        }
    }
    
    public function processownerlistAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $sql = $this->getProcessOwnerTable();
        $listDocuments = $sql->getOwners($lang);
        //print_r($listDocuments);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
        return $result;
    }
    
    public function processdocshelpersAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        
        $module = $request->getQuery('module');
        $helper = $request->getQuery('helper');
        
        //if($module){
            $sql = $this->getDocsHelpersTable();
            $listDocuments = $sql->getHelpersByType($lang,$helper);
            //print_r($listDocuments);
            if(!empty($listDocuments)){
                $data['success']=true;
                $data['results']=$listDocuments;
                $data['msg']="";
            }else{
                $data['success']=false;
                $data['msg']="Error trying to get the information...";
            }
            $result = new JsonModel($data);
            return $result;
        //}
        
        
    }
    
    public function docsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');

        return array('data'=>'LLegamos!','userData'=>$userPrefs);
    }
    
    public function newdocumentAction() 
    {
         $userPrefs = $this->getServiceLocator()->get('userPreferences');
        
        $data['success']=false;
        $data['message']="Request Error";

        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $module = $request->getPost('module');
        $company= $request->getPost('company');
        $country= $request->getPost('country');
        $location= $request->getPost('location');
        $files =  $request->getFiles()->toArray();
        if($module==='imsnd'){
            
            $doc_class = (int) $request->getPost('doc_class');
            $doc_type = (int) $request->getPost('doc_type');
            $doc_review = (int) $request->getPost('doc_review');
            $doc_protection = (int) $request->getPost('doc_protection');
            $id_process = (int) $request->getPost('doc_process');
            $doc_owner = (int) $request->getPost('doc_owner');
            $doc_location = (int) $request->getPost('doc_location');
            $doc_origin = (int) $request->getPost('doc_origin');
            $doc_retention = (int) $request->getPost('doc_retention');
            $description = (string) $request->getPost('description');
            $record_0 = (string) $request->getPost('record_0');
            $record_1 = (string) $request->getPost('record_1');
            $date_version = $request->getPost('date_version');
            $date_revision = $request->getPost('date_revision');
            
            $doc_record = (empty($record_0))?"":$record_0.'_'.$record_1;
            
            $tmpFile = $data['fileName']=$files['new_doc']['tmp_name'];
            $typeFile = $data['fileName']=$files['new_doc']['type'];
            $sizeFile = $data['fileName']=$files['new_doc']['size'];
            $nameFile = $data['fileName']=$files['new_doc']['name'];
            
            $version = (empty($record_0))?$record_1:1;
            
            
            
            $valid = new File\Extension(array('pdf', 'PDF'), true);
            if($valid->isValid($files['new_doc'])){
                
                $sqlLib = $this->getDocsLibraryTable();
                $doc_id = $sqlLib->getNextDocId();
                
                $doc_file = 'library/docs/'.$doc_id.'_'.$version.date('Ymdhis').'.pdf';
                
                $object = new DocsLibrary();
                $object->setDoc_id($doc_id)
                        ->setLang($lang)
                        ->setDoc_classification($doc_class)
                        ->setDoc_desc($description)
                        ->setDoc_file($doc_file)
                        ->setDoc_type($doc_type)
                        ->setDoc_review($doc_review)
                        ->setDoc_protection($doc_protection)
                        ->setDoc_owner($doc_owner)
                        ->setDoc_location($doc_location)
                        ->setDoc_origin($doc_origin)
                        ->setDoc_retention($doc_retention)
                        ->setDoc_record($doc_record)
                        ->setDoc_version_number($version)
                        ->setDoc_version_label('')
                        ->setDoc_date_creation($date_version)
                        ->setDoc_user_creation($userPrefs[0]['user_id'])
                        ->setDoc_date_revision_next($date_revision)
                        ->setDoc_status_general('A')
                        ->setCountry($country)
                        ->setCompany($company)
                        ->setLocation($location)
                        ->setId_process($id_process);
                
                if($sqlLib->save($object)){
                    $docsPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.$this->getConfig()['library']['docs_path'];
                    if (!is_dir($docsPath)){
                        mkdir($docsPath,0777,true);
                    }
                    move_uploaded_file($tmpFile, $docsPath.DIRECTORY_SEPARATOR.$doc_file);
                }
                
                $data["success"]=true;
                $data["result"]="Archivo Almacenado";
                $data['fileName']=$files['new_doc']['name'];
                $data['doc_owner']=$doc_owner;
                $data['fileSize']=$files['new_doc']['size'];
            }
            return new JSonModel($data);
        } else { 
            return new JSonModel(array('success'=>false));
        }
    }
    
    public function requestchangeAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        
        $data['success']=false;
        $data['message']="Request Error";
        $request = $this->getRequest();
        //echo $file['change_doc'];
        $lang = $userPrefs[0]['lang'];
        $request_info = htmlspecialchars($request->getPost('request_info'));
        $docid = htmlspecialchars($request->getPost('doc_id'));
        $module = $request->getPost('module');
        $company= $request->getPost('company');
        $country= $request->getPost('country');
        $location= $request->getPost('location');

        $files =  $request->getFiles()->toArray();
        
        $tmpFile = $data['fileName']=$files['change_doc']['tmp_name'];
        $typeFile = $data['fileName']=$files['change_doc']['type'];
        $sizeFile = $data['fileName']=$files['change_doc']['size'];
        $nameFile = $data['fileName']=$files['change_doc']['name'];
        
        $fileNewName = $docid."_".$userPrefs[0]['user_id']."_request.pdf";
        $petitioner = $request->getPost('petitioner');
        $email = $request->getPost('email');
        
        $valid = new File\Extension(array('pdf', 'PDF'), true);
        if($valid->isValid($files['change_doc'])){
        
            $data['petitioner'] = $petitioner;
            $data['email'] = $email;
            $data['request_info'] = $request_info;
            $data['tmp_file'] = $tmpFile;
            $data['type_file'] = $typeFile;

            $docSql = $this->getDocsLibraryTable();
            $docInfo = $docSql->getDocInfo($docid);
            
            $reqSql = $this->getDocsRequestTable();
            $doc_newid = $reqSql->getNextId();
            $requestPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.$this->getConfig()['library']['request_path'];

            if (is_dir($requestPath)){
                move_uploaded_file($tmpFile, $requestPath.DIRECTORY_SEPARATOR.$fileNewName);
            }else{
                mkdir($requestPath,0777,true);
            }
            
            $object = new DocsRequest();
            $object->setDoc_id($docid)
                    ->setLang($lang)
                    ->setDoc_classification($docInfo[0]['doc_classification'])
                    ->setDoc_file('library/request/'.$fileNewName)
                    ->setDesc_request($request_info)
                    ->setUser_request($userPrefs[0]['user_id'])
                    ->setName_request($petitioner)
                    ->setEmail_request($email)
                    ->setDate_request(date('Y-m-d H:i:s'))
                    ->setStatus('P')
                    ->setDoc_newid($doc_newid)
                    ->setCountry($country)
                    ->setCompany($company)
                    ->setLocation($location);
                    
            $sql = $this->getDocsRequestTable();
            if($sql->saveRequest($object)){
                $data["message"]=false;
                $data["success"]=true;
                $data["result"]="Solicitud enviada";
                $data['fileName']=$nameFile;
                $data['fileSize']=$sizeFile;
                $data['doc_mod']=$docid;
            }
        }else{
            $data['message']="File Extension is not Valid..";
        }
        
        return new JSonModel($data);
    }
    
    public function requesttreatmentAction()
    {
        $request = $this->getRequest();
        $acceptanceParams = (int) $request->getPost('ack');
        $reasonParams = htmlentities($request->getPost('reason'));
        $country = (string) $request->getPost('country');
        $company = (string) $request->getPost('company');
        $location = (string) $request->getPost('location');
        $doc_id = (int) $request->getPost('doc_id');
        $doc_newid = (int) $request->getPost('doc_newid');
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $dateNow = date('Y-m-d H:i:s');
        $dateFile = date('Ymdhis');
        
        $sql1 = $this->getDocsRequestTable();
        $sql2 = $this->getDocsLibraryTable();
        
        $filesPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR;
        
        
        $data['status']=($acceptanceParams===0)?"R":"A";
        $data['user_auth']=$userPrefs[0]['user_id'];
        $data['date_attention']=$dateNow;
        $data['desc_attention']=$reasonParams;

        $sql1->updateRequest($data,$doc_newid);
        
        if($data['status']==='A'){
            $actualDoc = $sql2->getDocInfo($doc_id);
            $reqDoc = $sql1->getRequestById($doc_newid);
            $version = $actualDoc[0]['doc_version_number'];
            $version++;
            
            $fileName = $doc_file = 'library/docs/'.$doc_id.'_'.$version.'_'.$dateFile.'.pdf';

            
            $upd['doc_version_number']=$version;
            $upd['doc_date_modification']=$dateNow;
            $upd['doc_file']=$fileName;
            $upd['doc_reference']=$doc_newid;
            $upd['doc_user_modification']=$userPrefs[0]['user_id'];
            $upd['doc_user_revision_req']=$reqDoc[0]['user_request'];
            
            if(!$sql2->updateDoc($upd,$doc_id)){
                $result['msg']="Hubo un error con el SQL";
                $result['success']=false;
            }
            //copy($filesPath, $dest);
            if(!rename($filesPath.$reqDoc[0]['doc_file'],$filesPath.$fileName)) {
                $result['msg']="Hubo un error con el archivo";
                $result['success']=false;
            } else {
                $result['success']=true;
                $result['msg']="Request Procesado correctamente modificando.";
            }
        } else {
            $result['success']=true;
            $result['msg']="Request Procesado correctamente sin modificar.";
        }
        return new JsonModel($result);
        
    }
    
    public function listhiraAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        $incidentTypeList = $this->getHiraIncidentTypeTable();
        $listIT = $incidentTypeList->getIncidentTypeList($lang);
        
        return array(
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
            'listIT'=>$listIT
        );
        
    }
    
    public function hiralitAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        $hiraIncidentType = $this->getHiraIncidentTypeTable();
        $listDocuments = $hiraIncidentType->getIncidentTypeList($lang);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;   
    }
    
    public function hiranctypeAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        $hiraNCType = $this->getHiraNonConformityTypeTable();
        $listDocuments = $hiraNCType->getNCTypeList($lang);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;   
    }
    
    public function hiradetailsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $companyParams = $request->getQuery('company');
        $countryParams = $request->getQuery('country');
        $locationParams = $request->getQuery('location');
        $dateParams = $request->getQuery('date_incident');
        
        $hiraIncidentDetail = $this->getHiraIncidentsListTable();
        $listDocuments = $hiraIncidentDetail->getIncidentsDetails($companyParams,$countryParams,$locationParams,$dateParams, $lang);
        
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        
        $result = new JsonModel($data);
    	return $result;   
    }
    
    public function hirailistAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        $request = $this->getRequest();
        $hiraIncidentsList = $this->getHiraIncidentsListTable();
        $resultList = $hiraIncidentsList->getIncidentsListResume($request->getQuery('companies'),$request->getQuery('countries'),$request->getQuery('locations'),$request->getQuery('monthfield'));
        //$resultList = $hiraIncidentsList->getIncidentsListFiltered($request->getQuery('companies'),$request->getQuery('countries'),$request->getQuery('locations'),$request->getQuery('monthfield'));
        $data['results']=(!empty($resultList))?$resultList:"";
        $data['success']=(!empty($resultList))?true:false;
        $data['msg']=(!empty($resultList))?"":"Error trying to get the information...";
        $result = new JsonModel($data);
        return $result;
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
    
    public function hiraDocsAction() {
        
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $hiraDocuments = $this->getHiraDocumentsTable();
        //$listDocuments = $hiraDocuments->fetchAll();
        $listDocuments = $hiraDocuments->fetchAllView($lang,$userData->country);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    public function hiraDocsByThreadAction() {
        
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $request = $this->getRequest();
        //$moduleParams = explode('-',$this->params()->fromRoute('id', 0));
        $tid = $request->getQuery('tid');
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $hiraDocuments = $this->getHiraDocumentsTable();
        //$listDocuments = $hiraDocuments->fetchAll();
        $listDocuments = $hiraDocuments->fetchThreadDocuments($lang,$country,$company,$location,$tid);
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=false;
            $data['msg']="Error trying to get the information...";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    private function getAuditorsTable()
    {
    	if (!$this->auditorsTable) {
            $sm = $this->getServiceLocator();
            $this->auditorsTable = $sm->get('IMS\Model\AuditorsTable');
    	}
    	return $this->auditorsTable;
    }
    
    private function getDocsHelpersTable()
    {
    	if (!$this->docsHelpersTable) {
            $sm = $this->getServiceLocator();
            $this->docsHelpersTable = $sm->get('IMS\Model\DocsHelpersTable');
    	}
    	return $this->docsHelpersTable;
    }
    
    private function getDocsLibraryTable()
    {
    	if (!$this->docsLibraryTable) {
            $sm = $this->getServiceLocator();
            $this->docsLibraryTable = $sm->get('IMS\Model\DocsLibraryTable');
    	}
    	return $this->docsLibraryTable;
    }
    
    private function getDocsRequestTable()
    {
    	if (!$this->docsRequestTable) {
            $sm = $this->getServiceLocator();
            $this->docsRequestTable = $sm->get('IMS\Model\DocsRequestTable');
    	}
    	return $this->docsRequestTable;
    }
    
    public function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
            $sm = $this->getServiceLocator();
            $this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
    
    public function getHiraNonConformityTypeTable()
    {
    	if (!$this->hiraNonConformityTypeTable) {
            $sm = $this->getServiceLocator();
            $this->hiraNonConformityTypeTable = $sm->get('IMS\Model\hiraNonConformityTypeTable');
    	}
    	return $this->hiraNonConformityTypeTable;
    }

    public function getHiraIncidentTypeTable()
    {
    	if (!$this->hiraIncidentTypeTable) {
            $sm = $this->getServiceLocator();
            $this->hiraIncidentTypeTable = $sm->get('IMS\Model\hiraIncidentTypeTable');
    	}
    	return $this->hiraIncidentTypeTable;
    }

    public function getHiraIncidentsListTable()
    {
    	if (!$this->hiraIncidentsListTable) {
            $sm = $this->getServiceLocator();
            $this->hiraIncidentsListTable = $sm->get('IMS\Model\hiraIncidentsTable');
    	}
    	return $this->hiraIncidentsListTable;
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
    
    public function getHiraDocumentsTable() {
        if (!$this->hiraDocumentsTable) {
            $sm = $this->getServiceLocator();
            $this->hiraDocumentsTable = $sm->get('IMS\Model\hiraDocumentsTable');
        }
        return $this->hiraDocumentsTable;
    }
    
    public function getProcessMainTable() {
        if(!$this->processmainTable) {
            $sm = $this->getServiceLocator();
            $this->processmainTable = $sm->get('IMS\Model\ProcessMainTable');
        }
        return $this->processmainTable;
    }
    
    public function getProcessMainView() {
        if(!$this->processmainView) {
            $sm = $this->getServiceLocator();
            $this->processmainView = $sm->get('IMS\Model\ProcessMainView');
        }
        return $this->processmainView;
    }

    public function getProcessRelationsTable() {
        if(!$this->processRelationsTable) {
            $sm = $this->getServiceLocator();
            $this->processRelationsTable = $sm->get('IMS\Model\ProcessRelationsTable');
        }
        return $this->processRelationsTable;
    }
    
    private function getProcessOwnerTable() {
        if(!$this->processownerTable) {
            $sm = $this->getServiceLocator();
            $this->processownerTable = $sm->get('IMS\Model\ProcessOwnerTable');
        }
        return $this->processownerTable;
    }
    
    
    public function getProcessThreadTable() {
        if(!$this->processThreadTable) {
            $sm = $this->getServiceLocator();
            $this->processThreadTable = $sm->get('IMS\Model\ProcessThreadTable');
        }
        return $this->processThreadTable;
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
    
        public function getCompaniesTable()
    {
        if (!$this->companiesTable){
            $sm = $this->getServiceLocator();
            $this->companiesTable = $sm->get('Application\Model\CompaniesTable');
        }
        return $this->companiesTable;
    }

    
    public function getCountriesTable()
    {
        if (!$this->countriesTable){
            $sm = $this->getServiceLocator();
            $this->countriesTable = $sm->get('Application\Model\CountriesTable');
        }
        return $this->countriesTable;
    }
    
    public function getLocationsTable()
    {
        if (!$this->locationsTable){
            $sm = $this->getServiceLocator();
            $this->locationsTable = $sm->get('Application\Model\LocationsTable');
        }
        return $this->locationsTable;
    }
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }
    
    protected function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
}