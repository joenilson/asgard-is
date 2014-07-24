<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class hiraDocuments {
    
    protected $id_danger_risk;
    protected $id_danger;
    protected $id_risk;
    protected $id_process_main;
    protected $eval_iper_h;
    protected $eval_iper_m;
    protected $eval_iper_l;
    protected $control_measures;
    protected $eval_risk_h;
    protected $eval_risk_m;
    protected $eval_risk_l;
    protected $date_creation;
    protected $user_creation;
    protected $date_modification;
    protected $user_modification;
    protected $status;
    protected $company;
    protected $country;
    protected $location;
    protected $id_machine;
    protected $id_activity;
   
    public function __construct(array $options = null)
    {
    	if (is_array($options)) {
    		$this->setOptions($options);
    	}
    }
    
    public function __set($name, $value)
    {
    	$method = 'set' . $name;
    	if (('mapper' == $name) || !method_exists($this, $method)) {
    		throw new \Exception('Invalid module property');
    	}
    	$this->$method($value);
    }
    
    public function __get($name)
    {
    	$method = 'get' . $name;
    	if (('mapper' == $name) || !method_exists($this, $method)) {
    		throw new \Exception('Invalid module property');
    	}
    	return $this->$method();
    }
    
    public function setOptions(array $options)
    {
    	$methods = get_class_methods($this);
    	foreach ($options as $key => $value) {
    		$method = 'set' . ucfirst($key);
    		if (in_array($method, $methods)) {
    			$this->$method($value);
    		}
    	}
    	return $this;
    }
    
    public function getId_danger_risk() {
        return $this->id_danger_risk;
    }

    public function getId_danger() {
        return $this->id_danger;
    }

    public function getId_risk() {
        return $this->id_risk;
    }

    public function getId_process_main() {
        return $this->id_process_main;
    }

    public function getEval_iper_h() {
        return $this->eval_iper_h;
    }

    public function getEval_iper_m() {
        return $this->eval_iper_m;
    }

    public function getEval_iper_l() {
        return $this->eval_iper_l;
    }

    public function getControl_measures() {
        return $this->control_measures;
    }

    public function getEval_risk_h() {
        return $this->eval_risk_h;
    }

    public function getEval_risk_m() {
        return $this->eval_risk_m;
    }

    public function getEval_risk_l() {
        return $this->eval_risk_l;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_creation() {
        return $this->user_creation;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function getUser_modification() {
        return $this->user_modification;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getCompany() {
        return $this->company;
    }

    public function getCountry() {
        return $this->country;
    }

    public function getLocation() {
        return $this->location;
    }

    public function getId_machine() {
        return $this->id_machine;
    }

    public function setId_danger_risk($id_danger_risk) {
        $this->id_danger_risk = $id_danger_risk;
        return $this;
    }

    public function setId_danger($id_danger) {
        $this->id_danger = $id_danger;
        return $this;
    }

    public function setId_risk($id_risk) {
        $this->id_risk = $id_risk;
        return $this;
    }

    public function setId_process_main($id_process_main) {
        $this->id_process_main = $id_process_main;
        return $this;
    }

    public function setEval_iper_h($eval_iper_h) {
        $this->eval_iper_h = $eval_iper_h;
        return $this;
    }

    public function setEval_iper_m($eval_iper_m) {
        $this->eval_iper_m = $eval_iper_m;
        return $this;
    }

    public function setEval_iper_l($eval_iper_l) {
        $this->eval_iper_l = $eval_iper_l;
        return $this;
    }

    public function setControl_measures($control_measures) {
        $this->control_measures = $control_measures;
        return $this;
    }

    public function setEval_risk_h($eval_risk_h) {
        $this->eval_risk_h = $eval_risk_h;
        return $this;
    }

    public function setEval_risk_m($eval_risk_m) {
        $this->eval_risk_m = $eval_risk_m;
        return $this;
    }

    public function setEval_risk_l($eval_risk_l) {
        $this->eval_risk_l = $eval_risk_l;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_creation($user_creation) {
        $this->user_creation = $user_creation;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    public function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    public function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    public function setId_machine($id_machine) {
        $this->id_machine = $id_machine;
        return $this;
    }

    public function getId_activity() {
        return $this->id_activity;
    }

    public function setId_activity($id_activity) {
        $this->id_activity = $id_activity;
        return $this;
    }

}
