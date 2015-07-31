<?php
/*
 * Copyright (C) 2014 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace HCM\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;

use HCM\Model\Entity\EmployeesDependants;

/**
 * Description of indexController
 *
 * @author Joe Nilson <joenilson@gmail.com>
 */
class IndexController extends AbstractActionController {
    
    protected $employeesDependantsTable;
    
    public function indexAction(){
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
    
    public function reportdependantsAction(){
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
    
    public function employeesAction(){
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
    
    public function employeesrAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $userData = $this->getServiceLocator()->get('userSessionData');
        $routeVlas = explode("-",$this->params()->fromRoute('id', 0));
        $lang=$userPrefs[0]['lang'];
        $role = $this->getUserRole($userData->id,$routeVlas[0],$routeVlas[1]);
        return array(
            'companyId'=>$userData->company,
            'locationId'=>$userData->location,
            'countryId'=>$userData->country,
            'lang'=>$lang,
            'isAdmin'=>($role=='Admin')?"true":"false",
            'panelId'=>str_replace("-","",$this->params()->fromRoute('id', 0))
        );
    }
    
    public function getemployeeofficesAction(){
        $soap = $this->SoapHcmPlugin();
        $listDocuments = $soap->getemployeeoffices(1000);
        $result['success']=true;
        $result['results']=$listDocuments;
        return new JsonModel($result);
    }
    
    public function getemployeesAction(){
        $request = $this->getRequest();
        $office_list = $request->getQuery('offices');
        $list = explode(',',$office_list);
        $soap = $this->SoapHcmPlugin();
        $listEmployees = $soap->getemployeesList($list);
        $result['success']=true;
        $result['results']=$listEmployees;
        $result['count']=count($list);
        return new JsonModel($result);
    }
    
    public function getemployeesrAction(){
        $request = $this->getRequest();
        $office_list = $request->getQuery('offices');
        $dependant_type = $request->getQuery('dependant_type');
        $age_begin = $request->getQuery('age_begin');
        $age_end = $request->getQuery('age_end');
        $list = explode(',',$office_list);
        $soap = $this->SoapHcmPlugin();
        $listEmployees = $soap->getemployeesReport($list,$dependant_type,$age_begin,$age_end);
        $result['success']=true;
        $result['results']=$listEmployees;
        $result['count']=count($list);
        return new JsonModel($result);
    }
    
    public function getremployeesgroupedAction(){
        $userPrefs = $this->getServiceLocator()->get('userPreferences');
        $lang=$userPrefs[0]['lang'];
        $request = $this->getRequest();
        $office_list = $request->getQuery('offices');
        $query_type = $request->getQuery('type');
        $list = explode(',',$office_list);
        $soap = $this->SoapHcmPlugin();
        $listEmployees = $soap->getemployeesChart($query_type,$list,$lang);
        $result['success']=true;
        $result['results']=$listEmployees;
        $result['count']=count($list);
        return new JsonModel($result);
    }
    
    public function getemployeesdependantsAction(){
        $request = $this->getRequest();
        $employee_id = $request->getQuery('uid');
        $conn = $this->getEmployeesDependantsTable();
        $listDependants = $conn->getDependantsById((int) $employee_id);
        $result['success']=true;
        $result['results']=$listDependants;
        return new JsonModel($result);
    }
    
    public function addemployeesdependantsAction(){
        $userData = $this->getServiceLocator()->get('userSessionData');
        $request = $this->getRequest();
        $action = (string) $request->getPost('action');
        $employee_id = (int) $request->getPost('id');
        $dependant_id = (int) $request->getPost('id_dependant');
        $surname_d = (string) $request->getPost('surname');
        $lastname_d = (string) $request->getPost('lastname');
        $firstname_d = (string) $request->getPost('firstname');
        $birthday_d = $request->getPost('birthday');
        $type_d = (string) $request->getPost('type');
        $gender_d = (string) $request->getPost('gender');
        $userid_d = (string) $request->getPost('user_id');
        $datecreation_d = (string) $request->getPost('date_creation');
        
        $status = ($action=='add' OR $action=='upd')?"A":"I";
        $user_id = ($action=='add')?$userData->id:$userid_d;
        $date_creation = ($action=='add')?\date('Y-m-d H:i:s'):$datecreation_d;
        $user_mod = ($action=='add')?"":$userData->id;
        $date_mod = ($action=='add')?"":\date('Y-m-d H:i:s');
        
        $field = $request->getPost('field');
        $value = $request->getPost('value');
        
        
        if($action !== 'upd'){
            $person = new EmployeesDependants();
            $person->setId($employee_id)
                    ->setId_dependant($dependant_id)
                    ->setSurname($surname_d)
                    ->setLastname($lastname_d)
                    ->setFirstname($firstname_d)
                    ->setBirthday($birthday_d)
                    ->setType($type_d)
                    ->setGender($gender_d)
                    ->setStatus($status)
                    ->setUser_id($user_id)
                    ->setDate_creation($date_creation);

            if($action == 'del'){
                $person->setUser_modification($user_mod)
                    ->setDate_modification($date_mod);
            }
        } else {
            $personData[$field] = $value;
            $personData['user_modification'] = $user_mod;
            $personData['date_modification'] = $date_mod;
        }
        
        $conn = $this->getEmployeesDependantsTable();
        
        try {
            if($action == 'add' or $action == 'del'){
                $result['results'] = $conn->save($person);
            }else{
                $result['results'] = $conn->updateData($personData,$employee_id,$dependant_id);
            }
            $result['success'] = true;
        } catch (Exception $exc) {
            $result['results'] = $exc->getTraceAsString();
            $result['success'] = false;
        }
        return new JsonModel($result);
    }
    
    public function getConfig()
    {
    	if (!$this->systemConfig) {
    		$sm = $this->getServiceLocator();
    		$this->systemConfig = $sm->get('Config');
    	}
    	return $this->systemConfig;
    }
    
    public function getEmployeesDependantsTable()
    {
    	if (!$this->employeesDependantsTable) {
            $sm = $this->getServiceLocator();
            $this->employeesDependantsTable = $sm->get('HCM\Model\EmployeesDependantsTable');
    	}
    	return $this->employeesDependantsTable;
    }
    
    private function getUserRole($idUser, $idModule, $idSubmodule){
        $userGrantedAccess = $this->getAdminUserSubmodulesTable()->getUserSubmodulesAccess($idUser, $idModule, $idSubmodule);
        $role='Viewer';
        if(!empty($userGrantedAccess)){
            $role=($userGrantedAccess[0]['admin']==1)?'Admin':$role;
            $role=($userGrantedAccess[0]['add']==1)?'Key User':$role;
            $role=($userGrantedAccess[0]['edit']==1)?'Editor':$role;
        }
        return $role;
    }
    
    private function getAdminUserSubmodulesTable()
    {
    	if (!$this->adminusersubmodulesTable) {
            $sm = $this->getServiceLocator();
            $this->adminusersubmodulesTable = $sm->get('Application\Model\AdminUserSubmodulesTable');
    	}
    	return $this->adminusersubmodulesTable;
    }
    
    protected function getViewHelper($helperName)
    {
    	return $this->getServiceLocator()->get('viewhelpermanager')->get($helperName);
    }
}
