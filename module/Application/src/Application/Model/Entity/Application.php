<?php
namespace Application\Model\Entity;

class Application {
    protected $_app_id;
    protected $_app_name;
    protected $_app_codename;
    protected $_app_majorversion;
    protected $_app_minorversion;
    protected $_app_patch;
    protected $_app_build;
    protected $_app_date_begin;
    protected $_app_timezone;
    protected $_app_status;
    protected $_app_module_default;
    
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
    
    public function setApp_id($app_id)
    {
    	$this->_app_id = (int) $app_id;
    	return $this;
    }
    
    public function getApp_id()
    {
    	return $this->_app_id;
    }
    
    public function setApp_name($app_name)
    {
    	$this->_app_name = (string) $app_name;
    	return $this;
    }
    
    public function getApp_name()
    {
    	return $this->_app_name;
    }
    
        public function setApp_codename($app_codename)
    {
    	$this->_app_codename = (string) $app_codename;
    	return $this;
    }
    
    public function getApp_codename()
    {
    	return $this->_app_codename;
    }
    
    public function setApp_majorversion($app_majorversion)
    {
    	$this->_app_majorversion = (int) $app_majorversion;
    	return $this;
    }
    
    public function getApp_majorversion()
    {
    	return $this->_app_majorversion;
    }
    
    public function setApp_minorversion($app_minorversion)
    {
    	$this->_app_minorversion = (int) $app_minorversion;
    	return $this;
    }
    
    public function getApp_minorversion()
    {
    	return $this->_app_minorversion;
    }

    public function setApp_patch($app_patch)
    {
    	$this->_app_patch = (int) $app_patch;
    	return $this;
    }
    
    public function getApp_patch()
    {
    	return $this->_app_patch;
    }
    
    public function setApp_build($app_build)
    {
    	$this->_app_build = (int) $app_build;
    	return $this;
    }
    
    public function getApp_build()
    {
    	return $this->_app_build;
    }
    
    public function setApp_date_begin($app_date_begin)
    {
    	$this->_app_date_begin = $app_date_begin;
    	return $this;
    }
    
    public function getApp_date_begin()
    {
    	return $this->_app_date_begin;
    }    
    
    public function setApp_timezone($app_timezone)
    {
    	$this->_app_timezone = (string) $app_timezone;
    	return $this;
    }
    
    public function getApp_timezone()
    {
    	return $this->_app_timezone;
    }    

    public function setApp_status($app_status)
    {
    	$this->_app_status = $app_status;
    	return $this;
    }
    
    public function getApp_status()
    {
    	return $this->_app_status;
    }    

    public function setApp_module_default($app_module_default)
    {
    	$this->_app_module_default = (int) $app_module_default;
    	return $this;
    }
    
    public function getApp_module_default()
    {
    	return $this->_app_module_default;
    }    

}