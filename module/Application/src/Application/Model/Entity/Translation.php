<?php
namespace Application\Model\Entity;

class Translation {
    
	public $_lang;
	public $_module;
	public $_key;
	public $_value;
	public $_status;
	public $_date_create;
	public $_date_modify;
   
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
    
    public function setLang($lang)
    {
    	$this->_lang = (string) $lang;
    	return $this;
    }
    
    public function getLang()
    {
    	return $this->_lang;
    }
    
    public function setModule($module)
    {
    	$this->_module = (string) $module;
    	return $this;
    }
    
    public function getModule()
    {
    	return $this->_module;
    }
    
    public function setKey($key)
    {
    	$this->_key = (string) $key;
    	return $this;
    }
    
    public function getKey()
    {
    	return $this->_key;
    }
    
    public function setValue($value)
    {
    	$this->_value = (string) $value;
    	return $this;
    }
    
    public function getValue()
    {
    	return $this->_value;
    }

    public function setStatus($status)
    {
    	$this->_status = (string) $status;
    	return $this;
    }
    
    public function getStatus()
    {
    	return $this->_status;
    }

    public function setDate_create($date_create)
    {
    	$this->_date_create = (int) $date_create;
    	return $this;
    }
    
    public function getDate_create()
    {
    	return $this->_date_create;
    }
    
    public function setDate_modify($date_modify)
    {
    	$this->_date_modify = (string) $date_modify;
    	return $this;
    }
    
    public function getDate_modify()
    {
    	return $this->_date_modify;
    }

}