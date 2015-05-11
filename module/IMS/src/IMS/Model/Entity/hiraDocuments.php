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
    
    protected $company;
    protected $country;
    protected $location;
    protected $id;
    protected $process_main_id;
    protected $process_thread_id;
    protected $activity;
    protected $danger_code;
    protected $danger_frequency;
    protected $danger_severity;
    protected $danger_fxs;
    protected $control_measures;
    protected $tracing;
    protected $measurement;
    protected $status;
    protected $date_creation;
    protected $user_creation;
    protected $date_modification;
    protected $user_modification;
    
    /*
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
    */
    
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
    
    function getCompany() {
        return $this->company;
    }

    function getCountry() {
        return $this->country;
    }

    function getLocation() {
        return $this->location;
    }

    function getId() {
        return $this->id;
    }

    function getProcess_main_id() {
        return $this->process_main_id;
    }

    function getProcess_thread_id() {
        return $this->process_thread_id;
    }

    function getActivity() {
        return $this->activity;
    }

    function getDanger_code() {
        return $this->danger_code;
    }

    function getDanger_frequency() {
        return $this->danger_frequency;
    }

    function getDanger_severity() {
        return $this->danger_severity;
    }

    function getDanger_fxs() {
        return $this->danger_fxs;
    }

    function getControl_measures() {
        return $this->control_measures;
    }

    function getTracing() {
        return $this->tracing;
    }

    function getMeasurement() {
        return $this->measurement;
    }

    function getStatus() {
        return $this->status;
    }

    function getDate_creation() {
        return $this->date_creation;
    }

    function getUser_creation() {
        return $this->user_creation;
    }

    function getDate_modification() {
        return $this->date_modification;
    }

    function getUser_modification() {
        return $this->user_modification;
    }

    function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    function setId($id) {
        $this->id = $id;
        return $this;
    }

    function setProcess_main_id($process_main_id) {
        $this->process_main_id = $process_main_id;
        return $this;
    }

    function setProcess_thread_id($process_thread_id) {
        $this->process_thread_id = $process_thread_id;
        return $this;
    }

    function setActivity($activity) {
        $this->activity = $activity;
        return $this;
    }

    function setDanger_code($danger_code) {
        $this->danger_code = $danger_code;
        return $this;
    }

    function setDanger_frequency($danger_frequency) {
        $this->danger_frequency = $danger_frequency;
        return $this;
    }

    function setDanger_severity($danger_severity) {
        $this->danger_severity = $danger_severity;
        return $this;
    }

    function setDanger_fxs($danger_fxs) {
        $this->danger_fxs = $danger_fxs;
        return $this;
    }

    function setControl_measures($control_measures) {
        $this->control_measures = $control_measures;
        return $this;
    }

    function setTracing($tracing) {
        $this->tracing = $tracing;
        return $this;
    }

    function setMeasurement($measurement) {
        $this->measurement = $measurement;
        return $this;
    }

    function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    function setUser_creation($user_creation) {
        $this->user_creation = $user_creation;
        return $this;
    }

    function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }


}
