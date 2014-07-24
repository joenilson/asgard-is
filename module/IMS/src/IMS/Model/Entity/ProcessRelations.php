<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class ProcessRelations {
    
    protected $type;
    protected $id;
    protected $parent_id;
    protected $date_creation;
    protected $user_id;
    protected $company;
    protected $country;
    protected $location;
   
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
    
    public function getType() {
        return $this->type;
    }

    public function getId() {
        return $this->id;
    }

    public function getParent_id() {
        return $this->parent_id;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_id() {
        return $this->user_id;
    }

    public function setType($type) {
        $this->type = $type;
        return $this;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setParent_id($parent_id) {
        $this->parent_id = $parent_id;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_id($user_id) {
        $this->user_id = $user_id;
        return $this;
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

}
