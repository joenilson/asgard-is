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

class hiraRiskLevel {
    
    protected $id_level;
    protected $min_risk;
    protected $max_risk;
    protected $min_fixtime;
    protected $max_fixtime;
    protected $format_fixtime;
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
    
    public function getId_level() {
        return $this->id_level;
    }

    public function setId_level($id_level) {
        $this->id_level = $id_level;
        return $this;
    }

    public function getMin_risk() {
        return $this->min_risk;
    }

    public function setMin_risk($min_risk) {
        $this->min_risk = $min_risk;
        return $this;
    }

    public function getMax_risk() {
        return $this->max_risk;
    }

    public function setMax_level($max_risk) {
        $this->max_risk = $max_risk;
        return $this;
    }

    public function getMin_fixtime() {
        return $this->min_fixtime;
    }

    public function setMin_fixtime($min_fixtime) {
        $this->min_fixtime = $min_fixtime;
        return $this;
    }

    public function getMax_fixtime() {
        return $this->max_fixtime;
    }

    public function setMax_fixtime($max_fixtime) {
        $this->max_fixtime = $max_fixtime;
        return $this;
    }

    public function getFormat_fixtime() {
        return $this->format_fixtime;
    }

    public function setFormat_fixtime($format_fixtime) {
        $this->format_fixtime = $format_fixtime;
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
