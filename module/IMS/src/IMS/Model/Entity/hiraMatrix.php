<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class hiraMatrix {
    
    protected $country;
    protected $company;
    protected $location;
    protected $id_severity;
    protected $id_frequency;
    protected $risk;
    
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
    
    public function getCountry() {
        return $this->country;
    }

    public function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    public function getCompany() {
        return $this->company;
    }

    public function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    public function getLocation() {
        return $this->location;
    }

    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    public function getId_severity() {
        return $this->id_severity;
    }

    public function setId_severity($id_severity) {
        $this->id_severity = $id_severity;
        return $this;
    }

    public function getId_frequency() {
        return $this->id_frequency;
    }

    public function setId_frequency($id_frequency) {
        $this->id_frequency = $id_frequency;
        return $this;
    }

    public function getRisk() {
        return $this->risk;
    }

    public function setRisk($risk) {
        $this->risk = $risk;
        return $this;
    }

}
