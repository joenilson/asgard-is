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
use IMS\Model\Entity\hiraIncidentDetails;
use IMS\Model\Entity\hiraIncidents;

use AsgardLib\Versioning\Documents;
use AsgardLib\Versioning\Scope;

//use PHPExcel;
use PHPExcel\Reader\Excel5; 

class IndexController extends AbstractActionController
{
    protected $auditorsTable;
    protected $auditsTable;
    protected $audittypeTable;
    protected $auditplanTable;
    protected $committeepositionsTable;
    protected $safetycommitteeTable;
    protected $committeeproceedingsTable;
    protected $adminusersubmodulesTable;
    protected $contentTextTable;
    protected $hiraRiskTable;
    protected $hiraDangerTable;
    protected $hiraMatrixTable;
    protected $hiraSeverityTable;
    protected $hiraFrequencyTable;
    protected $hiraRLTable;
    protected $hiraRLI18nTable;
    protected $hiraDocumentsTable;
    protected $messagesTable;
    protected $translationTable;
    protected $hiraIncidentTypeTable;
    protected $hiraIncidentDetailsTable;
    protected $hiraIncidentsCTTable;
    protected $hiraIncidentsListTable;
    protected $hiraNonConformityTypeTable;
    protected $processmainView;
    protected $processmainTable;
    protected $processownerTable;
    protected $processRelationsTable;
    protected $processThreadTable;
    protected $processActivityTable;
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
        $userData = $this->getServiceLocator()->get('userSessionData');
        
        $lang=$userPrefs[0]['lang'];
        
        $translator = $this->getTranslationTable();
        $imsMainProcess = $translator->getTranslationItem($lang,'diagram','ims-main-process');
        $imsStrategicProcess = $translator->getTranslationItem($lang,'diagram','ims-strategic-process');
        $imsSupportProcess = $translator->getTranslationItem($lang,'diagram','ims-support-process');
        
        return array(
            'ims_main_process'=>$imsMainProcess->value,
            'ims_strategic_process'=>$imsStrategicProcess->value,
            'ims_support_process'=>$imsSupportProcess->value,
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
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
            $dataResult['message'] = $ex->getMessage();
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
    
    public function listauditsAction(){
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
    
    public function getauditsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');

        $sql = $this->getAuditsTable();
        $dataAudits = $sql->getAuditsByCCL($company,$country,$location,$lang);
        if($dataAudits){
            $dataResult['success']=true;
            $dataResult['results']=$dataAudits;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function saveauditAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $auditDesc = $request->getPost('auditdesc');
        $auditType = $request->getPost('audittypeCombo');
        $auditDate = $request->getPost('auditdate');
        $files =  $request->getFiles()->toArray();
        $id = $request->getPost('audit_id');
        $date_creation = \date('Y-m-d h:i:s');

        $dataResult = array();
        
        $sql = $this->getAuditsTable();
        
        $audit = new \IMS\Model\Entity\Audits();
        $audit->setAudit_desc($auditDesc)
                ->setAudit_type($auditType)
                ->setAudit_date($auditDate)
                ->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setUser_id($userData->id)
                ->setStatus('A')
                ->setDate_creation($date_creation);
        if($id){
            $audit->setId($id);
        }
        $dataResult['success'] = true; 
        try {
            $newId = $sql->save($audit);
            
        } catch (\Exception $ex) {
            //$error = $ex;
            
            $dataResult['success'] = false; 
            $dataResult['message'] = $ex->getMessage(); 
        }

        $valid = new \Zend\Validator\File\UploadFile();
        
        if(isset($newId) AND $valid->isValid($files['audit_file'])){
            $fileName = "audit_{$company}_{$country}_{$location}_".$newId.".pdf";
            $this->savefile('library/audits', $files['audit_file'], $fileName, false, null);
            $sql->update(array('audit_file'=>'library/audits/'.$fileName),array('id'=>$newId));
        }
        return new JsonModel($dataResult);        
    }
    
    public function removeauditAction(){
        $request = $this->getRequest();
        $audit_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $sql = $this->getAuditsTable();
        $AuditData = $sql->getAuditByCCLI($company,$country,$location,$audit_id);
        $dataRemove = array();
        $dataResult = array();
        $dataResult['success'] = false;
        if(count($AuditData)>0){
            $dataRemove['company']=$company;
            $dataRemove['country']=$country;
            $dataRemove['location']=$location;
            $dataRemove['id']=$audit_id;
            $sql->delete($dataRemove);
            $this->removefile($AuditData[0]['audit_file']);
            $dataResult['success'] = true;
        }
        return new JsonModel($dataResult);
    }
    
    public function formauditAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $audit_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        
        $sql = $this->getAuditsTable();
        $AuditData = $sql->getAuditByCCLId($company,$country,$location,$audit_id,$lang);
        $dataResult = array();
        foreach($AuditData as $key=>$values){
            $dataResult['companiesCombo']=$values['company'];
            $dataResult['countriesCombo']=$values['country'];
            $dataResult['locationsCombo']=$values['location'];
            $dataResult['audittypeCombo']=$values['audit_type'];
            $dataResult['auditdesc']=$values['audit_desc'];
            $dataResult['auditdate']=$values['audit_date'];
            //$dataResult['auditfile']=$values['audit_file'];
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
    
    public function getaudittypeAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang=$userPrefs[0]['lang'];
        

        $sql = $this->getAuditTypeTable();
        $dataAuditTypes = $sql->getAuditTypeByLang($lang);
        if($dataAuditTypes){
            $dataResult['success']=true;
            $dataResult['results']=$dataAuditTypes;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function auditplanAction(){
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
    
    public function getauditplanAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $audit_date = $request->getQuery('monthfield');
        
        $time=strtotime($audit_date);
        $month=date("m",$time);
        $year=date("Y",$time);
        
        $date = "{$year}-{$month}";
        
        $sql = $this->getAuditPlanTable();
        $dataAuditPlan = $sql->getAuditPlanByCCL($company,$country,$location,$date);
        if($dataAuditPlan){
            $dataResult['success']=true;
            $dataResult['results']=$dataAuditPlan;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function saveauditplanAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $auditDesc = $request->getPost('auditdesc');
        $auditDateBegin = $request->getPost('auditdatebegin');
        $auditDateEnd = $request->getPost('auditdateend');
        $files =  $request->getFiles()->toArray();
        $id = $request->getPost('auditplan_id');
        $date_creation = \date('Y-m-d h:i:s');

        $dataResult = array();
        
        $sql = $this->getAuditPlanTable();
        
        $audit = new \IMS\Model\Entity\AuditPlan();
        $audit->setDescription($auditDesc)
                ->setAudit_begin($auditDateBegin)
                ->setAudit_end($auditDateEnd)
                ->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setUser_id($userData->id)
                ->setStatus('A')
                ->setDate_creation($date_creation);
        if($id){
            $audit->setId($id);
        }
        $dataResult['success'] = true; 
        try {
            $newId = $sql->save($audit);
            
        } catch (\Exception $ex) {
            //$error = $ex;
            
            $dataResult['success'] = false; 
            $dataResult['message'] = $ex->getMessage(); 
        }

        $valid = new \Zend\Validator\File\UploadFile();
        
        if(isset($newId) AND $valid->isValid($files['auditplan_file'])){
            $fileName = "auditplan_{$company}_{$country}_{$location}_".$newId.".pdf";
            $this->savefile('library/audits', $files['auditplan_file'], $fileName, false, null);
            $sql->update(array('audit_file'=>'library/audits/'.$fileName),array('id'=>$newId));
        }
        return new JsonModel($dataResult);        
        
    }
    
    public function removeauditplanAction(){
        $request = $this->getRequest();
        $auditplan_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $sql = $this->getAuditPlanTable();
        $AuditData = $sql->getAuditPlanByCCLId($company,$country,$location,$auditplan_id);
        $dataRemove = array();
        $dataResult = array();
        $dataResult['success'] = false;
        if(count($AuditData)>0){
            $dataRemove['company']=$company;
            $dataRemove['country']=$country;
            $dataRemove['location']=$location;
            $dataRemove['id']=$auditplan_id;
            $sql->delete($dataRemove);
            $this->removefile($AuditData[0]['audit_file']);
            $dataResult['success'] = true;
        }
        return new JsonModel($dataResult);
    }
    
    public function formauditplanAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $auditplan_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        
        $sql = $this->getAuditPlanTable();
        $AuditData = $sql->getAuditPlanByCCLId($company,$country,$location,$auditplan_id);
        $dataResult = array();
        foreach($AuditData as $key=>$values){
            $dataResult['companiesCombo']=$values['company'];
            $dataResult['countriesCombo']=$values['country'];
            $dataResult['locationsCombo']=$values['location'];
            $dataResult['auditdesc']=$values['description'];
            $dataResult['auditdatebegin']=$values['audit_begin'];
            $dataResult['auditdateend']=$values['audit_end'];
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
    
    public function safetycommitteeAction(){
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
    
    public function getsafetycommitteeAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');

        $sql = $this->getSafetyCommitteeTable();
        $dataPositions = $sql->getCommitteeByCCL($company,$country,$location,$lang);
        if($dataPositions){
            $dataResult['success']=true;
            $dataResult['images']=$dataPositions;
        }else{
            $dataResult['success']=false;
            $dataResult['images']="";
        }
        return new JsonModel($dataResult);        
    }
    
    public function getcommitteepositionsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang=$userPrefs[0]['lang'];
        

        $sql = $this->getCommitteePositionsTable();
        $dataPositions = $sql->getPositionsByLang($lang);
        if($dataPositions){
            $dataResult['success']=true;
            $dataResult['results']=$dataPositions;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function addsafetycommitteeAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = (string) $request->getPost('companiesCombo');
        $country = (string) $request->getPost('countriesCombo');
        $location = (string) $request->getPost('locationsCombo');
        $id_position = (int) $request->getPost('committeepositionsCombo');
        $fullname = (string) $this->PersonName($request->getPost('fullname'));
        $email = (string) $request->getPost('email');
        $phone = (int) trim($request->getPost('phone'));
        $files =  $request->getFiles()->toArray();
        $id = (int) $request->getPost('id');
        $date_creation = \date('Y-m-d h:i:s');

        $dataResult = array();
        
        $sql = $this->getSafetyCommitteeTable();
        
        $object = new \IMS\Model\Entity\SafetyCommittee();
        $object->setFullname($fullname)
                ->setId_position($id_position)
                ->setEmail($email)
                ->setPhone($phone)
                ->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setUser_id($userData->id)
                ->setStatus('A')
                ->setDate_creation($date_creation);
        if($id){
            $object->setId($id);
        }
        $dataResult['success'] = true; 
        try {
            $newId = $sql->save($object);
        } catch (\Exception $ex) {
            $dataResult['success'] = false; 
            $dataResult['message'] = $ex->getMessage(); 
        }

        $valid1 = new \Zend\Validator\File\UploadFile();
        $valid2 = new \Zend\Validator\File\IsImage();
        if(isset($newId) AND $valid1->isValid($files['photo']) and $valid2->isValid($files['photo'])){
            $fileName = "safetycommittee_{$company}_{$country}_{$location}_".$newId.".jpg";
            $this->savefile('library/safetycommittee', $files['photo'], $fileName, true, 'thumb_'.$fileName);
            $sql->update(array('photo'=>'library/safetycommittee/'.$fileName,
                'thumbnail'=>'library/safetycommittee/thumb_'.$fileName),array('id'=>$newId));
        }
        return new JsonModel($dataResult);        
        
    }
    
    public function removesafetycommitteeAction(){
        $request = $this->getRequest();
        $committee_ids = json_decode($this->cleanTags($request->getPost('ids')));
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $sql = $this->getSafetyCommitteeTable();
        
        if(is_array($committee_ids) and count($committee_ids)>0){
            $dataResult = array();
            foreach ($committee_ids as $committee_id){
                $CommitteeData = $sql->getCommitteeByCCLI($company,$country,$location,$committee_id);
                $dataRemove = array();
                $dataVars = array();
                $dataResult['success'] = false;
                if(count($CommitteeData)>0){
                    $dataVars['company']=$company;
                    $dataVars['country']=$country;
                    $dataVars['location']=$location;
                    $dataVars['id']=$committee_id;
                    $dataRemove['status']="I";
                    $sql->update($dataRemove,$dataVars);
                    $dataResult['success'] = true;
                }
            }
        }elseif($committee_ids>0){
            $CommitteeData = $sql->getCommitteeByCCLI($company,$country,$location,$committee_ids);
            $dataRemove = array();
            $dataVars = array();
            $dataResult['success'] = false;
            if(count($CommitteeData)>0){
                $dataVars['company']=$company;
                $dataVars['country']=$country;
                $dataVars['location']=$location;
                $dataVars['id']=$committee_id;
                $dataRemove['status']="I";
                $sql->update($dataRemove,$dataVars);
                $dataResult['success'] = true;
            }
        }
        
        return new JsonModel($dataResult);
    }
    
    public function formsafetycommitteeAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $committee_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        
        $sql = $this->getSafetyCommitteeTable();
        $CommitteeData = $sql->getCommitteeByCCLId($company,$country,$location,$committee_id);
        $dataResult = array();
        foreach($CommitteeData as $key=>$values){
            $dataResult['companiesCombo']=$values['company'];
            $dataResult['countriesCombo']=$values['country'];
            $dataResult['locationsCombo']=$values['location'];
            $dataResult['committeepositionsCombo']=$values['id_position'];
            $dataResult['fullname']=$values['fullname'];
            $dataResult['phone']=$values['phone'];
            $dataResult['email']=$values['email'];
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
    
    public function committeeproceedingsAction(){
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
    
    public function getcommitteeproceedingsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $year = $request->getQuery('year');
        $sql = $this->getCommitteeProceedingsTable();
        $dataProceedings = $sql->getProceedingsByCCLY($company,$country,$location,$year);
        if($dataProceedings){
            $dataResult['success']=true;
            $dataResult['results']=$dataProceedings;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        return new JsonModel($dataResult);
    }
    
    public function addcommitteeproceedingsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $description = $this->cleanTags($request->getPost('description'));
        $date_proceeding = $request->getPost('auditdatebegin');
        $files =  $request->getFiles()->toArray();
        $id = $request->getPost('proceeding_id');
        $date_creation = \date('Y-m-d h:i:s');

        $dataResult = array();
        
        $sql = $this->getCommitteeProceedingsTable();
        
        $insert = new \IMS\Model\Entity\SafetyCommitteeProceedings();
        $insert->setDescription($description)
                ->setDate_proceeding($date_proceeding)
                ->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setUser_id($userData->id)
                ->setStatus('A')
                ->setDate_creation($date_creation);
        if($id){
            $insert->setId($id);
        }
        $dataResult['success'] = true; 
        try {
            $newId = $sql->save($insert);
            
        } catch (\Exception $ex) {
            //$error = $ex;
            
            $dataResult['success'] = false; 
            $dataResult['message'] = $ex->getMessage(); 
        }

        $valid = new \Zend\Validator\File\UploadFile();
        
        if(isset($newId) AND $valid->isValid($files['proceeding_file'])){
            $fileName = "proceeding_{$company}_{$country}_{$location}_".$newId.".pdf";
            $this->savefile('library/proceedings', $files['proceeding_file'], $fileName, false, null);
            $sql->update(array('proceeding'=>'library/proceedings/'.$fileName),array('id'=>$newId));
        }
        return new JsonModel($dataResult);        
        
    }
    
    public function removecommitteeproceedingsAction(){
        $request = $this->getRequest();
        $proceeding_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        $sql = $this->getCommitteeProceedingsTable();
        $proceedingData = $sql->getProceedingsByCCLId($company,$country,$location,$proceeding_id);
        $dataRemove = array();
        $dataResult = array();
        $dataResult['success'] = false;
        if(count($proceedingData)>0){
            $dataRemove['company']=$company;
            $dataRemove['country']=$country;
            $dataRemove['location']=$location;
            $dataRemove['id']=$proceeding_id;
            $sql->update(array('status'=>'X'),$dataRemove);
            $this->removefile($proceedingData[0]['proceeding']);
            $dataResult['success'] = true;
        }
        return new JsonModel($dataResult);   
    }
    
    public function formcommitteeproceedingsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];

        $request = $this->getRequest();
        $proceeding_id = $request->getPost('id');
        $company = $request->getPost('company');
        $country = $request->getPost('country');
        $location = $request->getPost('location');
        
        $sql = $this->getCommitteeProceedingsTable();
        $proceedingData = $sql->getProceedingsByCCLId($company,$country,$location,$proceeding_id);
        $dataResult = array();
        foreach($proceedingData as $key=>$values){
            $dataResult['companiesCombo']=$values['company'];
            $dataResult['countriesCombo']=$values['country'];
            $dataResult['locationsCombo']=$values['location'];
            $dataResult['description']=$values['description'];
            $dataResult['date_proceeding']=$values['date_proceeding'];
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
    
    public function massdocprocessAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $lang_docs = $request->getPost('languageCombo');
        $files =  $request->getFiles()->toArray();
        $date_creation = \date('Y-m-d h:i:s');
        $zipfolder = '/tmp/temp_'.\date('Ymdhis').'/';
        
        $dataResult = array();

        //$sqlMessage = $this->getMessagesTable();
        $sqlProcess = $this->getProcessMainTable();
        $arrayProcess = $sqlProcess->getAllMainProcess($lang_docs,'A',$company,$country,$location);
        $process = array();
        foreach($arrayProcess as $key=>$process_values){
            $process[$process_values['value']]=array('id'=>$process_values['id'],'desc'=>$process_values['value']);
        }
        
        $sqlThreads = $this->getProcessThreadTable();
        $arrayThreads = $sqlThreads->getAllThreads($lang_docs,'A',$company,$country,$location);
        
        $threads = array();
        foreach($arrayThreads as $key=>$thread_values){
            $threads[$this->PersonName(trim($thread_values['value']))]=array('id'=>$thread_values['id'],'desc'=>$thread_values['value']);
        }    
        
        $sqlHelpers = $this->getDocsHelpersTable();
        $arrayHelpers = $sqlHelpers->getHelpers($lang_docs);
        $helpers = array();
        foreach($arrayHelpers as $key=>$values){
            $helpers[$values['helper']][$values['description']]=array('id'=>$values['id'],'desc'=>$values['description']);
        }
        //$reader = new \PHPExcel();
        $reader = new \PHPExcel_Reader_Excel5();
        $worksheetData = $reader->listWorksheetInfo($files['excel_file']['tmp_name']);
        $objPHPExcel = $reader->load($files['excel_file']['tmp_name']);
        $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
        
        if(!is_dir($zipfolder)){
            mkdir($zipfolder, 0777);
        }
        move_uploaded_file($files['zip_file']['tmp_name'], '/tmp/'.$files['zip_file']['name']);
        $zip = new \ZipArchive;
        if ($zip->open('/tmp/'.$files['zip_file']['name']) === TRUE) {
            $dataResult['numfiles']=$zip->numFiles;
            $zipList = array();
            $zipdir = "";
            for($i = 0; $i < $zip->numFiles; $i++)
            {  
                if(strpos(".",$zip->getNameIndex($i))){
                    $zipList[]=$zip->getNameIndex($i);
                    
                }
            }
            $zipdir = $zip->getNameIndex(0);
            $dataResult['unziped']=$zipdir;
            $zip->extractTo($zipfolder);
            $zip->close();
        } else {
            $dataResult['unziped']="ERROR";
        }
        
        $arrayMasterData = array();
        $counter = 1;
        foreach($sheetData as $key=>$content){
            if($counter != 1 and !empty($content['A'])){
            $id = (int) trim($content['A']);
            $classification = (string) trim($content['B']);
            $description = (string) trim($content['C']);
            $filename = (string) $zipdir.trim($content['D']).'.pdf';
            $type = (string) trim($content['E']);
            $review = (string) trim($content['F']);
            $protection = (string) trim($content['G']);
            $owner = (string) trim($content['H']);
            $doclocation = (string) trim($content['I']);
            $origin = (string) trim($content['J']);
            $retention = (string) trim($content['K']);
            $register = (string) trim($content['L']);
            $version_number = (int) trim($content['M']);
            
            $version_date_dump = explode("/",$content['N']);
            $revision_date_dump = explode("/",$content['O']);
            $doc_process = (string) $this->PersonName(trim($content['P']));
            $doc_thread = (string) $this->PersonName(trim($content['Q']));
            
            $date['VERSION'] = $content['N'];
            $date['REVISION'] = $content['O'];
            //$version_date = date("Y-m-d", strtotime(str_replace("'","",$content['N'])));
            //$revision_date = date("Y-m-d", strtotime(str_replace("'","",$content['O'])));
            //$version_date = \date("Y-m-d", strtotime($version_date_dump));
            //$revision_date = \date("Y-m-d", strtotime($revision_date_dump));
            
            $version_date = \date("Y-m-d", strtotime($version_date_dump[2]."-".$version_date_dump[1]."-".$version_date_dump[0]));
            $revision_date = \date("Y-m-d", strtotime($revision_date_dump[2]."-".$revision_date_dump[1]."-".$revision_date_dump[0]));
           
            $arrayMasterData[]=array(
                'doc_id'=>(int) $id,
                'classification'=>(!$helpers['classification'][$classification])?"":$helpers['classification'][$classification]['id'],
                'classification_desc'=>(!$helpers['classification'][$classification])?"":$helpers['classification'][$classification]['desc'],
                'type'=>(!$helpers['type'][$type])?"":$helpers['type'][$type]['id'],
                'type_desc'=>(!$helpers['type'][$type])?"":$helpers['type'][$type]['desc'],
                'review'=>(!$helpers['review'][$review])?"":$helpers['review'][$review]['id'],
                'review_desc'=>(!$helpers['review'][$review])?"":$helpers['review'][$review]['desc'],
                'protection'=>(!$helpers['protection'][$protection])?"":$helpers['protection'][$protection]['id'],
                'protection_desc'=>(!$helpers['protection'][$protection])?"":$helpers['protection'][$protection]['desc'],
                'location_doc'=>(!$helpers['location'][$doclocation])?"":$helpers['location'][$doclocation]['id'],
                'location_desc'=>(!$helpers['location'][$doclocation])?"":$helpers['location'][$doclocation]['desc'],
                'origin'=>(!$helpers['origin'][$origin])?"":$helpers['origin'][$origin]['id'],
                'origin_desc'=>(!$helpers['origin'][$origin])?"":$helpers['origin'][$origin]['desc'],
                'retention'=>(!$helpers['retention'][$retention])?"":$helpers['retention'][$retention]['id'],
                'retention_desc'=>(!$helpers['retention'][$retention])?"":$helpers['retention'][$retention]['desc'],
                'description'=>$description,
                'filename'=>(is_file($zipfolder.$filename))?$zipfolder.$filename:$filename,
                'owner'=>(!$process[$owner])?"":$process[$owner]['id'],
                'owner_desc'=>(!$process[$owner])?"":$process[$owner]['desc'],
                'process'=>(!$process[$doc_process])?"":$process[$doc_process]['id'],
                'process_desc'=>(!$process[$doc_process])?"":$process[$doc_process]['desc'],
                'thread'=>(!$threads[$doc_thread])?"":$threads[$doc_thread]['id'],
                'thread_desc'=>(!$threads[$doc_thread])?"":$threads[$doc_thread]['desc'],
                'doc_record'=>$register,
                'version_number'=>$version_number,
                'version_date'=>$version_date,
                'revision_date'=>$revision_date,
                'doc_status_general'=>'U',
                'lang'=>$lang_docs,
                'company'=>$company,
                'country'=>$country,
                'location'=>$location,
                'date_creation'=>$date_creation,
                'user_creation'=>$userData->id
            );
            
            }
            $counter++;
            
        }
        foreach($worksheetData as $worksheet){
            $dataResult['worksheetName']=$worksheet['worksheetName'];
            $dataResult['totalRows']=$worksheet['totalRows'];
            $dataResult['totalColumns']=$worksheet['totalColumns'];
            $dataResult['lastColumnLetter']=$worksheet['lastColumnLetter'];
            $dataResult['process']=$date;
            
        }
        $dataResult['file_results']=$arrayMasterData;
        $dataResult['success']=true;
        return new JsonModel($dataResult);    
    }
    
    public function processmassdocsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $dataBulk = $request->getPost('data');
        $data = \json_decode($dataBulk);
        $dataCount = count($data);
        /*
        *classification 5
	*classification_desc "Registros"
	*company "0001"
	*country "0001"
	*date_creation 	Date {Sun Apr 20 2014 12:24:20 GMT-0400 (AST)}
	*description "MOVIMIENTO DE AZUCAR, PREPARACION DE JARABE SIMPLE"
	*doc_id 32
	*doc_record "SGI/REG/17/02J-RD"
	doc_status_general "U"
	*filename "/tmp/temp_2014042012242...ON DE JARABE SIMPLE.pdf"
	*lang "es"
	*location "0008"
	*location_desc "Base de datos"
	*origin 	3
	*origin_desc "Corporativo"
	*owner 0
	*owner_desc ""
	*protection 2
	*protection_desc "Backup Sistema"
	*retention 1
	*retention_desc "1 Año"
	*review 2
	*review_desc "Anual"
	*revision_date Date {Mon Mar 31 2014 00:00:00 GMT-0400 (AST)}
	*type 3
	*type_desc "Electronico"
	*user_creation 0
	*version_date Date {Wed Feb 01 2012 00:00:00 GMT-0400 (AST)}
	*version_label ""
	*version_number 1
        */
        if(is_array($data)){
            $sqlDocs = $this->getDocsLibraryTable();
            
            foreach ($data as $dataContent){
                $doc_new_id = $sqlDocs->getNextDocId();
                $doc_company = (!empty($dataContent->company))?$dataContent->company:$userData->company;
                $doc_country = (!empty($dataContent->country))?$dataContent->country:$userData->country;
                $doc_location = (!empty($dataContent->location))?$dataContent->location:$userData->location;
                $doc_classification = (is_numeric($dataContent->classification_desc))?$dataContent->classification_desc:$dataContent->classification;
                $doc_protection = (is_numeric($dataContent->protection_desc))?$dataContent->protection_desc:$dataContent->protection;
                $doc_review = (is_numeric($dataContent->review_desc))?$dataContent->review_desc:$dataContent->review;
                $doc_retention = (is_numeric($dataContent->retention_desc))?$dataContent->retention_desc:$dataContent->retention;
                $doc_origin = (is_numeric($dataContent->origin_desc))?$dataContent->origin_desc:$dataContent->origin;
                $doc_type = (is_numeric($dataContent->type_desc))?$dataContent->type_desc:$dataContent->type;
                $doc_owner = (is_numeric($dataContent->owner_desc))?$dataContent->owner_desc:$dataContent->owner;
                $doc_process = (is_numeric($dataContent->process_desc))?$dataContent->process_desc:$dataContent->process;
                $doc_thread = (is_numeric($dataContent->thread_desc))?$dataContent->thread_desc:$dataContent->thread;
                $doc_location_doc = (is_numeric($dataContent->location_desc))?$dataContent->location_desc:$dataContent->location_doc;
                $doc_version_number = (is_numeric($dataContent->version_number))?$dataContent->version_number:0;
                $doc_version_label = (!empty($dataContent->version_label))?$dataContent->version_label:"";
                $doc_lang = (!empty($dataContent->lang))?$dataContent->lang:$lang;
                $doc_user_creation = (!empty($dataContent->user_creation))?$dataContent->user_creation:$userData->id;
                $doc_date_creation = (!empty($dataContent->date_creation))?\date("Y-m-d H:i:s", strtotime($dataContent->date_creation)):\date('Y-m-d H:i:s');
                $doc_date_version = (!empty($dataContent->version_date))?\date("Y-m-d H:i:s", strtotime($dataContent->version_date)):\date('Y-m-d H:i:s');
                $doc_date_revision = (!empty($dataContent->revision_date))?\date("Y-m-d H:i:s", strtotime($dataContent->revision_date)):\date('Y-m-d H:i:s');
                $doc_desc = (!empty($dataContent->description))?trim($dataContent->description):"No description - please fix it";
                $doc_record = (!empty($dataContent->doc_record))?trim($dataContent->doc_record):"";
                $doc_file = (!empty($dataContent->filename))?'library/docs/'.$doc_new_id.'_'.$doc_version_number.'_'.date('Ymdhis').'.pdf':"";
                if(!empty($doc_file)){
                    $this->movefile('library/docs/', $dataContent->filename, $doc_new_id.'_'.$doc_version_number.'_'.date('Ymdhis').'.pdf');
                }
                $doc = new DocsLibrary();
                $doc->setCompany($doc_company)
                    ->setCountry($doc_country)
                    ->setLocation($doc_location)
                    ->setDoc_id($doc_new_id)
                    ->setDoc_classification($doc_classification)
                    ->setDoc_protection($doc_protection)
                    ->setDoc_review($doc_review)
                    ->setDoc_retention($doc_retention)
                    ->setDoc_origin($doc_origin)
                    ->setDoc_type($doc_type)
                    ->setDoc_location($doc_location_doc)
                    ->setDoc_version_number($doc_version_number)
                    ->setDoc_version_label($doc_version_label)
                    ->setLang($doc_lang)
                    ->setDoc_user_creation($doc_user_creation)
                    ->setDoc_date_creation($doc_date_creation)
                    ->setDoc_date_revision_actual($doc_date_version)
                    ->setDoc_date_revision_next($doc_date_revision)
                    ->setDoc_desc($doc_desc)
                    ->setDoc_file($doc_file)
                    ->setDoc_owner($doc_owner)
                    ->setDoc_record($doc_record)
                    ->setDoc_status_general('A')
                    ->setId_process($doc_process)
                    ->setId_thread($doc_thread);
                $sqlDocs->save($doc);
            }
            $dataResult['success']=true;
            $dataResult['message']="$dataCount documents proccessed";
            //$dataResult['test']=$date;
            $dataResult['docs_processed']=$dataCount;
        }else{
            $dataResult['success']=false;
            $dataResult['message']="No data was sent";
        }
        return new JsonModel($dataResult);
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
        $lang=$userPrefs[0]['lang'];
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
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
            'lang'=>$lang
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
            $data['msg']="Error trying to get the information...";
        }
        return new JsonModel($data);
    }
    
    public function threaddetailsAction()
    {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $thread_id = (int) $this->params()->fromRoute('id_thread',0);
        $company  = (string) $this->params()->fromRoute('company', 0);
        $country  = (string) $this->params()->fromRoute('country', 0);
        $location  = (string) $this->params()->fromRoute('location', 0);
        $process_id  = (int) $this->params()->fromRoute('process_id', 0);
        $queryPM = $this->getProcessThreadTable();
        $listDocuments = $queryPM->getThreadInfo($lang,$thread_id);
        //print_r($listDocuments);
        return array(
            'threadId'=>$thread_id,
            'processId'=>$process_id,
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
        $process= $request->getQuery('process');
        $thread= $request->getQuery('thread');
        
        
        if($module){
            $sql = $this->getDocsLibraryTable();
            if(!empty($process) and !empty($thread)){
                $listDocuments = $sql->getLibraryByPT($lang,$company,$country,$location,$process,$thread);
            }else{
                $listDocuments = $sql->getLibrary($lang,$company,$country,$location);
            }
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
        
        $request = $this->getRequest();
        $pid = $request->getQuery('pid');
        
        $sql = $this->getProcessOwnerTable();
        
        $listDocuments = (isset($pid) and !empty($pid))?$sql->getOwnersByProcess($pid,$lang):$sql->getOwners($lang);
        //var_dump($listDocuments);
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
        $lang = $userPrefs[0]['lang'];
        return array('userData'=>$userPrefs, 
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
            'lang'=>$lang,
        );
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
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $incidentTypeList = $this->getHiraIncidentTypeTable();
        $listIT = $incidentTypeList->getIncidentTypeList($lang);
        
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
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
    
    public function hiraincidentsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0)),
        );
        
    }
    
    public function gethiraincidentsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $companyParams = $request->getQuery('company');
        $countryParams = $request->getQuery('country');
        $locationParams = $request->getQuery('location');
        $dateValues = $request->getQuery('date_incident');
        $valsDate = explode('-',$dateValues);
        $dateParams = $valsDate[0].'-'.$valsDate[1];
        $hiraIncidentDetail = $this->getHiraIncidentsListTable();
        $listDocuments = $hiraIncidentDetail->getIncidentsDetails($companyParams,$countryParams,$locationParams,$dateParams, $lang);
        $dataResult = array();
        if($listDocuments){
            $dataResult['success']=true;
            $dataResult['results']=$listDocuments;
        }else{
            $dataResult['success']=false;
            $dataResult['results']="";
        }
        
       return new JsonModel($dataResult);
    }
    
    public function removeincidentsAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $dataBulk = $request->getPost('data_ids');
        $data = \json_decode($dataBulk);
        $dataCount = count($data);
        
        $dataResult = array();
        if(is_array($data)){
            $sqlIncidents = $this->getHiraIncidentsListTable();
            foreach($data as $id_incident){
                $data = array();
                $data['user_modification'] = $userData->id;
                $data['date_modification'] = \date('Y-m-d H:i:s');
                $data['general_status'] = 0;
                $sqlIncidents->update($data,array('id_incident'=>$id_incident));
            }
            $dataResult['success']=true;
            $dataResult['docs_processed']=$dataCount;
        }else{
            $dataResult['success']=false;
            $dataResult['message']="No data was send";
        }
        return new JsonModel($dataResult);
    }
    
    public function addincidentcausesAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $arrayCauses = array('me'=>1,'ma'=>2,'hf'=>3,'in'=>4,'mt'=>5,'ot'=>6);
        
        $request = $this->getRequest();
        $companyParams = $request->getPost('company');
        $countryParams = $request->getPost('country');
        $locationParams = $request->getPost('location');
        $id_incident = (int) $request->getPost('incident_id');
        $sqlCauses = $this->getHiraIncidentDetailsTable();
        $insertCount = 0;
        foreach ($arrayCauses as $key=>$code){
            $IncidentType = $this->cleanTags($request->getPost($key.'_IncidentType'));
            $IncidentIA = $this->cleanTags($request->getPost($key.'_IncidentIA'));
            $IncidentCA = $this->cleanTags($request->getPost($key.'_IncidentCA'));
            $registerName = $this->cleanTags($request->getPost($key.'_registerName'));
            $registerSurname = $this->cleanTags($request->getPost($key.'_registerSurname'));
            $registerLastname = $this->cleanTags($request->getPost($key.'_registerLastname'));
            
            if(!empty($IncidentType)){
                $fullName = $this->PersonName($registerSurname." ".$registerLastname.", ".$registerName);
                $object = new hiraIncidentDetails();
                $object->setCompany($companyParams)
                        ->setCountry($countryParams)
                        ->setLocation($locationParams)
                        ->setId($id_incident)
                        ->setId_cause($code)
                        ->setDescription_cause($IncidentType)
                        ->setDescription_ia($IncidentIA)
                        ->setDescription_ca($IncidentCA)
                        ->setFullname_employee($fullName)
                        ->setStatus('A')
                        ->setDate_creation(\date('Y-m-d H:i:s'))
                        ->setUser_id($userData->id);
                $sqlCauses->save($object);
                $insertCount++;
            }
        }
        
        //$hiraIncidentDetail = $this->getHiraIncidentsListTable();
        //$listDocuments = $hiraIncidentDetail->getIncidentsDetails($companyParams,$countryParams,$locationParams,$dateParams, $lang);
        $dataResult = array();
        if($insertCount>0){
            $dataResult['success']=true;
            $dataResult['results']=$insertCount;
        }else{
            $dataResult['success']=false;
            $dataResult['results']=$insertCount;
        }
        
       return new JsonModel($dataResult);
    }
    
    public function addincidentcloseAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $arrayCauses = array('me'=>1,'ma'=>2,'hf'=>3,'in'=>4,'mt'=>5,'ot'=>6);
        
        $request = $this->getRequest();
        $closeDesc = $this->cleanTags($request->getPost('close_description'));
        $idIncident = (int) $request->getPost('incident_id');
        $sqlIncident = $this->getHiraIncidentsListTable();
        $dataResult = array();
        
        if(!empty($closeDesc) and $idIncident!=0){
            $data['description_close']=$closeDesc;
            $data['date_close']=\date('Y-m-d H:i:s');
            $data['user_close']=$userData->id;
            $data['status']=2;
            $sqlIncident->update($data,array('id_incident'=>$idIncident));
            $dataResult['success']=true;
        }else{
            $dataResult['success']=false;
        }
        
       return new JsonModel($dataResult);
    }
    
    public function addincidentvalidityAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $arrayCauses = array('me'=>1,'ma'=>2,'hf'=>3,'in'=>4,'mt'=>5,'ot'=>6);
        
        $request = $this->getRequest();
        $validityDesc = $this->cleanTags($request->getPost('validity_description'));
        $idIncident = (int) $request->getPost('incident_id');
        $sqlIncident = $this->getHiraIncidentsListTable();
        $dataResult = array();
        
        if(!empty($validityDesc) and $idIncident!=0){
            $data['description_validity']=$validityDesc;
            $data['date_validity']=\date('Y-m-d H:i:s');
            $data['user_validity']=$userData->id;
            $data['status']=4;
            $sqlIncident->update($data,array('id_incident'=>$idIncident));
            $dataResult['success']=true;
        }else{
            $dataResult['success']=false;
        }
        
       return new JsonModel($dataResult);
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

    public function newincidentAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        
        $request = $this->getRequest();
        $date_create = $request->getPost('IncidentDate');//	2014-02-12
        $description = htmlspecialchars($request->getPost('IncidentDesc'));//	Se paso de pistolas el inge<br>
        $company = $request->getPost('companiesCombo');//	0001
        $country = $request->getPost('countriesCombo');//	0001
        $incident_owner = $request->getPost('doc_owner');//	47
        $incident_process = $request->getPost('doc_process');//	11
        $id_type = $request->getPost('incidenttypeCombo');//-1127-in...	7
        $location = $request->getPost('locationsCombo');//	0008
        $callModule = $request->getPost('module');//	imsincidents
        $nonconformity_type = $request->getPost('nonconformityCombo');//	3
        $nonconformity_registry = $request->getPost('registerCode');//	SGI/REG/18/01AA
        $owner_email = htmlspecialchars(trim($request->getPost('registerEmail')));//	spozo@kolareal.com.do
        $lastname = $this->PersonName($request->getPost('registerLastname'));//	Pozo
        $firstname = $this->PersonName($request->getPost('registerName'));// Samuel
        $surname = $this->PersonName($request->getPost('registerSurname'));//	Del
        $incident_thread = $request->getPost('threadsCombo');//	34
        $owner_fullname = "$surname $lastname, $firstname";
        $dataResult = array();
        $date_creation = \date('Y-m-d H:i:s');
        
        $sql = $this->getHiraIncidentsListTable();
        
        $incident = new \IMS\Model\Entity\hiraIncidents();
        $incident->setCompany($company)
                ->setCountry($country)
                ->setLocation($location)
                ->setDate_incident($date_create)
                ->setDate_creation($date_creation)
                ->setDescription($description)
                ->setNonconformity_type($nonconformity_type)
                ->setId_type($id_type)
                ->setOwner_fullname($owner_fullname)
                ->setOwner_email($owner_email)
                ->setUser_create($userData->id)
                ->setUser_id($userData->id)
                ->setStatus(1)
                ->setGeneral_status(1)
                ->setNonconformity_registry($nonconformity_registry)
                ->setIncident_process($incident_process)
                ->setIncident_thread($incident_thread)
                ->setIncident_owner($incident_owner);
        try {
            $savedId = $sql->save($incident);
            $dataResult['success'] = true;
            $dataResult['id_created'] = $savedId;
        } catch (Exception $ex) {
            $dataResult['success'] = false;
            $dataResult['message'] = $ex->getMessage();
        }
        return new JsonModel($dataResult);
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
        $request = $this->getRequest();
        $company = (string) $request->getQuery('company');
        $country = (string) $request->getQuery('country');
        $location = (string) $request->getQuery('location');
        $hiraDocuments = $this->getHiraDocumentsTable();
        //$listDocuments = $hiraDocuments->fetchAll();
        $listDocuments = $hiraDocuments->fetchAllView($lang,$country,$company,$location);
        $data = array();
        if(!empty($listDocuments)){
            $data['success']=true;
            $data['results']=$listDocuments;
            $data['msg']="";
        }else{
            $data['success']=true;
            $data['msg']="No data found.";
            $data['results']="";
        }
        $result = new JsonModel($data);
    	return $result;
    }
    
    public function removehiradocsAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $dataBulk = $request->getPost('data_ids');
        $data = \json_decode($dataBulk);
        $dataCount = count($data);
        
        $dataResult = array();
        if(is_array($data)){
            $sqlHIRADocs = $this->getHiraDocumentsTable();
            foreach($data as $id_danger_risk){
                $data = array();
                $data['user_modification'] = $userData->id;
                $data['date_modification'] = \date('Y-m-d H:i:s');
                $data['status'] = 0;
                $sqlHIRADocs->update($data,array('id_danger_risk'=>$id_danger_risk));
            }
            $dataResult['success']=true;
            $dataResult['docs_processed']=$dataCount;
        }else{
            $dataResult['success']=false;
            $dataResult['message']="No data was send";
        }
        return new JsonModel($dataResult);
    }
    
    public function addhiradocsAction() {
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $dataBulk = $request->getPost('data_ids');
        $data = \json_decode($dataBulk);
        $dataCount = count($data);
        
        $dataResult = array();
        if(is_array($data)){
            $sqlHIRADocs = $this->getHiraDocumentsTable();
            foreach($data as $id_danger_risk){
                $data = array();
                $data['user_modification'] = $userData->id;
                $data['date_modification'] = \date('Y-m-d H:i:s');
                $data['status'] = 0;
                $sqlHIRADocs->update($data,array('id_danger_risk'=>$id_danger_risk));
            }
            $dataResult['success']=true;
            $dataResult['docs_processed']=$dataCount;
        }else{
            $dataResult['success']=false;
            $dataResult['message']="No data was send";
        }
        return new JsonModel($dataResult);
    }
    
    public function masshiraprocessAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $company = $request->getPost('companiesCombo');
        $country = $request->getPost('countriesCombo');
        $location = $request->getPost('locationsCombo');
        $lang_docs = $request->getPost('languageCombo');
        $files =  $request->getFiles()->toArray();
        $date_creation = \date('Y-m-d h:i:s');
        
        $dataResult = array();

        //$sqlMessage = $this->getMessagesTable();
        $sqlProcess = $this->getProcessMainTable();
        $arrayProcess = $sqlProcess->getAllMainProcess($lang_docs,'A',$company,$country,$location);
        $process = array();
        foreach($arrayProcess as $key=>$process_values){
            $process[trim($process_values['value'])]=array('id'=>$process_values['id'],'desc'=>$process_values['value']);
        }
        
        $sqlThreads = $this->getProcessThreadTable();
        $arrayThreads = $sqlThreads->getAllThreads($lang_docs,'A',$company,$country,$location);
        $threads = array();
        foreach($arrayThreads as $key=>$thread_values){
            $threads[trim($thread_values['value'])]=array('id'=>$thread_values['id'],'desc'=>$thread_values['value']);
        }    
        
        $sqlActivity = $this->getProcessActivityTable();
        $arrayActivity = $sqlActivity->getAllActivities($lang_docs,'A',$company,$country,$location);
        $activities = array();
        foreach($arrayActivity as $key=>$activity_values){
            $activities[$activity_values['value']]=array('id'=>$activity_values['id'],'desc'=>$activity_values['value']);
        }
        
        $sqlDanger = $this->getHiraDangerTable();
        $arrayDanger = $sqlDanger->getDangerList($lang_docs);
        
        $dangers = array();
        foreach($arrayDanger as $key=>$obj_values){
            $dangers[$obj_values['desc_danger']]=array('id'=>$obj_values['id_danger'],'desc'=>$obj_values['desc_danger']);
        }
        
        $sqlRisk = $this->getHiraRiskTable();
        $arrayRisk = $sqlRisk->getRiskList($lang_docs);
        
        $risks = array();
        foreach($arrayRisk as $key=>$obj_values){
            $risks[$obj_values['desc_risk']]=array('id'=>$obj_values['id_risk'],'desc'=>$obj_values['desc_risk']);
        }
        //
        //$reader = new \PHPExcel();
        //$reader = new \PHPExcel_Reader_Excel2007();
        
        /** Identify the type of $inputFileName **/ 
        //$inputFileType = \PHPExcel_IOFactory::identify($files['excel_file']['tmp_name']); 
        /** Create a new Reader of the type that has been identified **/ 
        //$objReader = \PHPExcel_IOFactory::createReader($inputFileType); 
        /** Load $inputFileName to a PHPExcel Object **/ 
        //$objPHPExcel = $objReader->load($files['excel_file']['tmp_name']);
        
        $reader = new \PHPExcel_Reader_Excel5();
        $worksheetData = $reader->listWorksheetInfo($files['excel_file']['tmp_name']);
        $objPHPExcel = $reader->load($files['excel_file']['tmp_name']);
        $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
        
        $arrayMasterData = array();
        $counter = 1;
        $filesProcessed = 0;
        
        foreach($sheetData as $key=>$content){
            if($counter>2){
                $filesProcessed++;
                $id = $filesProcessed;
                //$processType = (int) trim($content['A']);
                $processMain = (string) trim($content['B']);
                $processThread = (string) trim($content['C']);
                $processActivity = (string) trim($content['D']);
                $documentDanger = (string) trim($content['E']);
                $documentRisk = (string) trim($content['F']);
                $iperHigh = (int) trim($content['G']);
                $iperMedium = (int) trim($content['H']);
                $iperLow = (int) trim($content['I']);
                $controlMeasures = (string) trim($content['J']);
                $rraHigh = (int) trim($content['K']);
                $rraMedium = (int) trim($content['L']);
                $rraLow = (int) trim($content['M']);

                $arrayMasterData[]=array(
                    'id_danger_risk'=>(int) $id,
                    'id_danger'=>(!$dangers[$documentDanger])?"":$dangers[$documentDanger]['id'],
                    'desc_danger'=>(!$dangers[$documentDanger])?"":$dangers[$documentDanger]['desc'],
                    'id_risk'=>(!$risks[$documentRisk])?"":$risks[$documentRisk]['id'],
                    'desc_risk'=>(!$risks[$documentRisk])?"":$risks[$documentRisk]['desc'],
                    'id_activity'=>(!$activities[$processActivity])?"":$activities[$processActivity]['id'],
                    'eval_iper_h'=>(!$iperHigh)?0:$iperHigh,
                    'eval_iper_m'=>(!$iperMedium)?0:$iperMedium,
                    'eval_iper_l'=>(!$iperLow)?0:$iperLow,
                    'control_measures'=>(!$controlMeasures)?"":$controlMeasures,
                    'eval_risk_h'=>(!$rraHigh)?0:$rraHigh,
                    'eval_risk_m'=>(!$rraMedium)?0:$rraMedium,
                    'eval_risk_l'=>(!$rraLow)?0:$rraLow,
                    'id_process_main'=>(!$threads[$processThread])?"":$threads[$processThread]['id'],
                    'process_main_desc'=>(!$threads[$processThread])?"":$threads[$processThread]['desc'],
                    'process_sup_desc'=>(!$process[$processMain])?"":$process[$processMain]['desc'],
                    'activity_desc'=>(!$activities[$processActivity])?"":$activities[$processActivity]['desc'],
                    'status'=>1,
                    'company'=>$company,
                    'country'=>$country,
                    'location'=>$location,
                    'date_creation'=>$date_creation,
                    'user_creation'=>$userData->id
                );
            }
            $counter++;
        }  
        
        foreach($worksheetData as $worksheet){
            $dataResult['worksheetName']=$worksheet['worksheetName'];
            $dataResult['totalRows']=$worksheet['totalRows'];
            $dataResult['totalColumns']=$worksheet['totalColumns'];
            $dataResult['lastColumnLetter']=$worksheet['lastColumnLetter'];
            //$dataResult['process']=$threads;
            
        }
        $dataResult['file_results']=$arrayMasterData;
        $dataResult['success']=true;
        return new JsonModel($dataResult);    
    }
    
    public function processmasshiraAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang=$userPrefs[0]['lang'];
        
        $request = $this->getRequest();
        $dataBulk = $request->getPost('data');
        $data = \json_decode($dataBulk);
        $dataCount = count($data);
        
//        "id_danger_risk":1,
//        "id_danger":137,
//        "desc_danger":"Superf\u00edcie escorregadia, Irregular, Obst\u00e1culos no andar",
//        "id_risk":41,
//        "desc_risk":"Queda ao mesmo n\u00edvel",
//        "id_process_main":0,
//        "process_main_desc":"Tratamento de \u00e1gua",
//        "process_sup_desc":"Produ\u00e7\u00e3o",
//        "type":0,
//        "type_desc":"",
//        "eval_iper_h":0,
//        "eval_iper_m":0,
//        "eval_iper_l":23,
//        "control_measures":"Tr\u00e2nsito de pedrestes somente por zonas sinalizadas e/ou seguras",
//        "eval_risk_h":0,
//        "eval_risk_m":0,
//        "eval_risk_l":23,
//        "date_creation":"2014-04-27T09:57:57",
//        "user_creation":"2",
//        "date_modification":null,
//        "user_modification":"",
//        "status":1,
//        "company":"0003",
//        "country":"0003",
//        "location":"0001",
//        "id_machine":0,
//        "id_activity":105,
//        "activity_desc":"Revis\u00e3o inicial e rotineira de \u00e1gua em tanques"
        
        if(is_array($data)){
            $sqlDocs = $this->getHiraDocumentsTable(); 
            
            foreach ($data as $dataContent){
                //$doc_new_id = $sqlDocs->getNextDocId();
                $doc_company = (!empty($dataContent->company))?$dataContent->company:$userData->company;
                $doc_country = (!empty($dataContent->country))?$dataContent->country:$userData->country;
                $doc_location = (!empty($dataContent->location))?$dataContent->location:$userData->location;
                $doc_thread = (is_numeric($dataContent->process_main_desc))?$dataContent->process_main_desc:$dataContent->id_process_main;
                $doc_activity = (is_numeric($dataContent->activity_desc))?$dataContent->activity_desc:$dataContent->id_activity;
                $doc_id_risk = (!empty($dataContent->id_risk))?$dataContent->id_risk:0;
                $doc_id_danger = (!empty($dataContent->id_danger))?$dataContent->id_danger:0;
                $eval_iper_h = (!empty($dataContent->eval_iper_h))?$dataContent->eval_iper_h:0;
                $eval_iper_m = (!empty($dataContent->eval_iper_m))?$dataContent->eval_iper_m:0;
                $eval_iper_l = (!empty($dataContent->eval_iper_l))?$dataContent->eval_iper_l:0;
                $eval_risk_h = (!empty($dataContent->eval_risk_h))?$dataContent->eval_risk_h:0;
                $eval_risk_m = (!empty($dataContent->eval_risk_m))?$dataContent->eval_risk_m:0;
                $eval_risk_l = (!empty($dataContent->eval_risk_l))?$dataContent->eval_risk_l:0;
                $control_measures = (!empty($dataContent->control_measures))?$this->cleanTags(trim($dataContent->control_measures)):"";
                $doc_user_creation = (!empty($dataContent->user_creation))?$dataContent->user_creation:$userData->id;
                $doc_date_creation = (!empty($dataContent->date_creation))?\date("Y-m-d H:i:s", strtotime($dataContent->date_creation)):\date('Y-m-d H:i:s');
                
                
                $doc = new \IMS\Model\Entity\hiraDocuments();
                //$doc = new hiraDocuments();
                $doc->setCompany($doc_company)
                    ->setCountry($doc_country)
                    ->setLocation($doc_location)
                    ->setId_danger_risk(0)
                    ->setId_danger($doc_id_danger)
                    ->setId_risk($doc_id_risk)
                    ->setId_process_main($doc_thread)
                    ->setControl_measures($control_measures)
                    ->setEval_iper_h($eval_iper_h)
                    ->setEval_iper_m($eval_iper_m)
                    ->setEval_iper_l($eval_iper_l)
                    ->setEval_risk_h($eval_risk_h)
                    ->setEval_risk_m($eval_risk_m)
                    ->setEval_risk_l($eval_risk_l)
                    ->setId_activity($doc_activity)
                    ->setUser_creation($doc_user_creation)
                    ->setDate_creation($doc_date_creation)
                    ->setStatus(1);
                
                $sqlDocs->save($doc);
            }
            $dataResult['success']=true;
            $dataResult['message']="$dataCount documents proccessed";
            //$dataResult['test']=$doc_date_creation;
            $dataResult['docs_processed']=$dataCount;
        }else{
            $dataResult['success']=false;
            $dataResult['message']="No data was sent";
        }
        return new JsonModel($dataResult);
    }
    
    public function hiraDocsByThreadAction() {
        
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $lang = $userPrefs[0]['lang'];
        $request = $this->getRequest();
        $tid = $request->getQuery('tid');
        $company = $request->getQuery('company');
        $country = $request->getQuery('country');
        $location = $request->getQuery('location');
        $hiraDocuments = $this->getHiraDocumentsTable();
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
    
    private function cleanTags($value){
        return strip_tags($value);
    }
    
    private function cleanSlashes($value){
        //return stripslashes($value);
        return htmlspecialchars($value);
    }

    
    private function PersonName($name){
        return ucwords(strtolower(htmlspecialchars(trim($name))));
    }
    
    private function movefile($path,$file,$filename){
        $filesPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.$path.DIRECTORY_SEPARATOR;
        
        if (!is_dir($filesPath)){
            mkdir($filesPath,0777,true);
        }
        try {
            rename($file, $filesPath.$filename);
            return true;
        } catch (Exception $ex) {
            return false;
        }
    }
    private function savefile($path,$file,$filename,$thumb,$thumbname){
        $filesPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.$path.DIRECTORY_SEPARATOR;
        
        if (!is_dir($filesPath)){
            mkdir($filesPath,0777,true);
        }
        
        if(!move_uploaded_file($file['tmp_name'],$filesPath.$filename)) {
            return false;
        } else {
            if($thumb){
                $this->imageResize($filesPath.$filename,$filesPath.$thumbname);
            }
            return true;
        }
    }
    
    private function removefile($filename){
        $filesPath = getcwd().DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR;
        
        if(is_file($filesPath.$filename)){
            unlink($filesPath.$filename);
            return true;
        }else{
            return false;
        }
    }
    
    
    private function imageResize($file,$dst)
    {
        $imagine = new \Imagine\Gd\Imagine();
        $mode = \Imagine\Image\ImageInterface::THUMBNAIL_OUTBOUND;
        $imagine->open($file)
        ->thumbnail(new \Imagine\Image\Box(171,180), $mode)
        ->save($dst);
    }

    private function imageProcess($file,$dst)
    {
        $maxHeight = 480;
        $imagine = new \Imagine\Gd\Imagine();
        list($width, $height, $type, $attribs) = getimagesize($file);

        if($height>$maxHeight){
            $newWidth = ceil(($maxHeight*$height)/$width);

            $imagine->open($file)
                    ->thumbnail(new \Imagine\Image\Box($newWidth,$maxHeight))
                    ->save($file);
        }

        $mode = \Imagine\Image\ImageInterface::THUMBNAIL_OUTBOUND;
        $imagine->open($file)
                ->thumbnail(new \Imagine\Image\Box(171,180),$mode)
                ->save($dst);
    }

    private function getSafetyCommitteeTable()
    {
    	if (!$this->safetycommitteeTable) {
            $sm = $this->getServiceLocator();
            $this->safetycommitteeTable = $sm->get('IMS\Model\SafetyCommitteeTable');
    	}
    	return $this->safetycommitteeTable;
    }
    
    private function getCommitteePositionsTable()
    {
    	if (!$this->committeepositionsTable) {
            $sm = $this->getServiceLocator();
            $this->committeepositionsTable = $sm->get('IMS\Model\CommitteePositionsTable');
    	}
    	return $this->committeepositionsTable;
    }
    
    private function getCommitteeProceedingsTable()
    {
    	if (!$this->committeeproceedingsTable) {
            $sm = $this->getServiceLocator();
            $this->committeeproceedingsTable = $sm->get('IMS\Model\CommitteeProceedingsTable');
    	}
    	return $this->committeeproceedingsTable;
    }
    
    private function getAuditorsTable()
    {
    	if (!$this->auditorsTable) {
            $sm = $this->getServiceLocator();
            $this->auditorsTable = $sm->get('IMS\Model\AuditorsTable');
    	}
    	return $this->auditorsTable;
    }
    
    private function getAuditsTable()
    {
    	if (!$this->auditsTable) {
            $sm = $this->getServiceLocator();
            $this->auditsTable = $sm->get('IMS\Model\AuditsTable');
    	}
    	return $this->auditsTable;
    }
    
    private function getAuditTypeTable()
    {
    	if (!$this->audittypeTable) {
            $sm = $this->getServiceLocator();
            $this->audittypeTable = $sm->get('IMS\Model\AuditTypeTable');
    	}
    	return $this->audittypeTable;
    }
    
    private function getAuditPlanTable()
    {
    	if (!$this->auditplanTable) {
            $sm = $this->getServiceLocator();
            $this->auditplanTable = $sm->get('IMS\Model\AuditPlanTable');
    	}
    	return $this->auditplanTable;
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

    private function getHiraIncidentDetailsTable()
    {
    	if (!$this->hiraIncidentDetailsTable) {
            $sm = $this->getServiceLocator();
            $this->hiraIncidentDetailsTable = $sm->get('IMS\Model\hiraIncidentDetailsTable');
    	}
    	return $this->hiraIncidentDetailsTable;
    }
    
    private function getHiraIncidentsCTTable()
    {
    	if (!$this->hiraIncidentsCTTable) {
            $sm = $this->getServiceLocator();
            $this->hiraIncidentsCTTable = $sm->get('IMS\Model\hiraIncidentsCTTable');
    	}
    	return $this->hiraIncidentsCTTable;
    }
    
    private function getHiraIncidentTypeTable()
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
    
    public function getHiraDangerTable() {
        if (!$this->hiraDangerTable) {
            $sm = $this->getServiceLocator();
            $this->hiraDangerTable = $sm->get('IMS\Model\hiraDangerTable');
        }
        return $this->hiraDangerTable;
    }
    
    public function getHiraRiskTable() {
        if (!$this->hiraRiskTable) {
            $sm = $this->getServiceLocator();
            $this->hiraRiskTable = $sm->get('IMS\Model\hiraRiskTable');
        }
        return $this->hiraRiskTable;
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
    
    
    private function getProcessThreadTable() {
        if(!$this->processThreadTable) {
            $sm = $this->getServiceLocator();
            $this->processThreadTable = $sm->get('IMS\Model\ProcessThreadTable');
        }
        return $this->processThreadTable;
    }
    
    private function getProcessActivityTable() {
        if(!$this->processActivityTable) {
            $sm = $this->getServiceLocator();
            $this->processActivityTable = $sm->get('IMS\Model\ProcessActivityTable');
        }
        return $this->processActivityTable;
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