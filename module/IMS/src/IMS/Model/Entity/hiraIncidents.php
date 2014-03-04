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
    protected $date_create;
    protected $general_status;
    
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

    public function getDate_create() {
        return $this->date_create;
    }

    public function getGeneral_status() {
        return $this->general_status;
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

    public function setDate_create($date_create) {
        $this->date_create = $date_create;
        return $this;
    }

    public function setGeneral_status($general_status) {
        $this->general_status = $general_status;
        return $this;
    }



}
