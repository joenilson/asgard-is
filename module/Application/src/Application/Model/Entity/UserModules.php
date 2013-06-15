<?php
namespace Application\Model\Entity;

class UserModules {
    protected $_user_id;
    protected $_mid;
    protected $_lang;
    protected $_mshortdesc;
    protected $_icon;
    protected $_helpurl;
    protected $_ordering;
    protected $_typeof;
    protected $_status;
   
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
    
    public function setLang($lang)
    {
    	$this->_lang = (string) $lang;
    	return $this;
    }
    
    public function getLang()
    {
    	return $this->_lang;
    }
    
    public function setMshortdesc($mshortdesc)
    {
    	$this->_mshortdesc = (string) $mshortdesc;
    	return $this;
    }
    
    public function getMshortdesc()
    {
    	return $this->_mshortdesc;
    }
    
    public function setIcon($icon)
    {
    	$this->_icon = (string) $icon;
    	return $this;
    }
    
    public function getIcon()
    {
    	return $this->_icon;
    }

    public function setHelpurl($helpurl)
    {
    	$this->_helpurl = (string) $helpurl;
    	return $this;
    }
    
    public function getHelpurl()
    {
    	return $this->_helpurl;
    }

    public function setOrdering($ordering)
    {
    	$this->_ordering = (int) $ordering;
    	return $this;
    }
    
    public function getOrdering()
    {
    	return $this->_ordering;
    }
    
    public function setTypeof($typeof)
    {
    	$this->_typeof = (string) $typeof;
    	return $this;
    }
    
    public function getTypeof()
    {
    	return $this->_typeof;
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
}