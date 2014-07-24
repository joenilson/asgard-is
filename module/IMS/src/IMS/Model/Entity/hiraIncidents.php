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

class hiraIncidents {
    
    protected $id_incident;
    protected $nonconformity_type;
    protected $status;
    protected $id_type;
    protected $company;
    protected $country;
    protected $location;
    protected $description;
    protected $owner_fullname;
    protected $owner_email;
    protected $user_create;
    protected $date_incident;
    protected $general_status;
    protected $date_creation;
    protected $user_modification;
    protected $date_modification;
    protected $nonconformity_registry;
    protected $incident_process;
    protected $incident_thread;
    protected $incident_owner;
    protected $user_id;
    protected $description_close;
    protected $date_close;
    protected $user_close;
    protected $description_validity;
    protected $date_validity;
    protected $user_validity;
    
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
    
    public function getId_incident() {
        return $this->id_incident;
    }

    public function getNonconformity_type() {
        return $this->nonconformity_type;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getId_type() {
        return $this->id_type;
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

    public function getDescription() {
        return $this->description;
    }

    public function getOwner_fullname() {
        return $this->owner_fullname;
    }

    public function getOwner_email() {
        return $this->owner_email;
    }

    public function getUser_create() {
        return $this->user_create;
    }

    public function getDate_incident() {
        return $this->date_incident;
    }

    public function getGeneral_status() {
        return $this->general_status;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_modification() {
        return $this->user_modification;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function getNonconformity_registry() {
        return $this->nonconformity_registry;
    }

    public function getIncident_process() {
        return $this->incident_process;
    }

    public function getIncident_thread() {
        return $this->incident_thread;
    }

    public function getIncident_owner() {
        return $this->incident_owner;
    }

    public function getUser_id() {
        return $this->user_id;
    }

    public function setId_incident($id_incident) {
        $this->id_incident = $id_incident;
        return $this;
    }

    public function setNonconformity_type($nonconformity_type) {
        $this->nonconformity_type = $nonconformity_type;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setId_type($id_type) {
        $this->id_type = $id_type;
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

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function setOwner_fullname($owner_fullname) {
        $this->owner_fullname = $owner_fullname;
        return $this;
    }

    public function setOwner_email($owner_email) {
        $this->owner_email = $owner_email;
        return $this;
    }

    public function setUser_create($user_create) {
        $this->user_create = $user_create;
        return $this;
    }

    public function setDate_incident($date_incident) {
        $this->date_incident = $date_incident;
        return $this;
    }

    public function setGeneral_status($general_status) {
        $this->general_status = $general_status;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    public function setNonconformity_registry($nonconformity_registry) {
        $this->nonconformity_registry = $nonconformity_registry;
        return $this;
    }

    public function setIncident_process($incident_process) {
        $this->incident_process = $incident_process;
        return $this;
    }

    public function setIncident_thread($incident_thread) {
        $this->incident_thread = $incident_thread;
        return $this;
    }

    public function setIncident_owner($incident_owner) {
        $this->incident_owner = $incident_owner;
        return $this;
    }

    public function setUser_id($user_id) {
        $this->user_id = $user_id;
        return $this;
    }

    public function getDescription_close() {
        return $this->description_close;
    }

    public function getDate_close() {
        return $this->date_close;
    }

    public function getUser_close() {
        return $this->user_close;
    }

    public function setDescription_close($description_close) {
        $this->description_close = $description_close;
        return $this;
    }

    public function setDate_close($date_close) {
        $this->date_close = $date_close;
        return $this;
    }

    public function setUser_close($user_close) {
        $this->user_close = $user_close;
        return $this;
    }

    public function getDescription_validity() {
        return $this->description_validity;
    }

    public function getDate_validity() {
        return $this->date_validity;
    }

    public function getUser_validity() {
        return $this->user_validity;
    }

    public function setDescription_validity($description_validity) {
        $this->description_validity = $description_validity;
        return $this;
    }

    public function setDate_validity($date_validity) {
        $this->date_validity = $date_validity;
        return $this;
    }

    public function setUser_validity($user_validity) {
        $this->user_validity = $user_validity;
        return $this;
    }
}
