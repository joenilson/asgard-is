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

class hiraIncidentType {
    
    protected $lang;
    protected $id_incident;
    protected $val_incident;
    protected $status;
    protected $date_creation;
    protected $date_modification;
    
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
    
    public function getLang() {
        return $this->lang;
    }

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function getId_incident() {
        return $this->id_incident;
    }

    public function setId_incident($id_incident) {
        $this->id_incident = $id_incident;
        return $this;
    }

    public function getVal_incident() {
        return $this->val_incident;
    }

    public function setVal_incident($val_incident) {
        $this->val_incident = $val_incident;
        return $this;
    }

    public function getStatus() {
        return $this->status;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

}
