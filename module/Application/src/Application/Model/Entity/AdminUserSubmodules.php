<?php
namespace Application\Model\Entity;

class AdminUserSubmodules {
    protected $_user_id;
    protected $_mid;
    protected $_smid;
    protected $_view;
    protected $_edit;
    protected $_add;
    protected $_admin;
    
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
    
    public function setSmid($smid)
    {
    	$this->_smid = (int) $smid;
    	return $this;
    }
    
    public function getSmid()
    {
    	return $this->_smid;
    }
    
    public function setView($view)
    {
    	$this->_view = $view;
    	return $this;
    }
    
    public function getView()
    {
    	return $this->_view;
    }
    
    public function setEdit($edit)
    {
    	$this->_edit = $edit;
    	return $this;
    }
    
    public function getEdit()
    {
    	return $this->_edit;
    }
    
    public function setAdd($add)
    {
    	$this->_add = $add;
    	return $this;
    }
    
    public function getAdd()
    {
    	return $this->_add;
    }
    
    public function setAdmin($admin)
    {
    	$this->_admin = $admin;
    	return $this;
    }
    
    public function getAdmin()
    {
    	return $this->_admin;
    }
}