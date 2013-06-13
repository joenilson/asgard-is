<?php
namespace Application\Model\Entity;

class AdminUserModules {
    protected $_user_id;
    protected $_mid;
   
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
    
    public function setUser_id($user_id)
    {
    	$this->_user_id = (int) $user_id;
    	return $this;
    }
    
    public function getUser_id()
    {
    	return $this->_user_id;
    }
    
    public function setMid($mid)
    {
    	$this->_mid = (int) $mid;
    	return $this;
    }
    
    public function getMid()
    {
    	return $this->_mid;
    }
}