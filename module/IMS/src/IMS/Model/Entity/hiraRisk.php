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

class hiraRisk {
    
    protected $lang;
    protected $id_risk;
    protected $desc_risk;
    protected $date_creation;
    protected $user_creation;
    protected $date_modification;
    protected $user_modification;
    protected $status;
    
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

    public function getId_risk() {
        return $this->id_risk;
    }

    public function getDesc_risk() {
        return $this->desc_risk;
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

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function setId_risk($id_risk) {
        $this->id_risk = $id_risk;
        return $this;
    }

    public function setDesc_risk($desc_risk) {
        $this->desc_risk = $desc_risk;
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

    public function getStatus() {
        return $this->status;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

}

