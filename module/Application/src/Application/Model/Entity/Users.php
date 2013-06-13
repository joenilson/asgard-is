<?php
namespace Application\Model\Entity;

class Users {
    protected $_id;
    protected $_username;
    protected $_password;
    protected $_salt;
    protected $_realname;
    protected $_role;
    protected $_date_created;
    protected $_date_lastlogin;
    protected $_country;
    protected $_company;
    protected $_location;
    protected $_admin;
    protected $_status;
    protected $_type;
    protected $_account_type;
   
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
    
    public function setId($id)
    {
    	$this->_id = (int) $id;
    	return $this;
    }
    
    public function getId()
    {
    	return $this->_id;
    }
    
    public function setUsername($username)
    {
    	$this->_username = (string) $username;
    	return $this;
    }
    
    public function getUsername()
    {
    	return $this->_username;
    }
    
    public function setPassword($password)
    {
    	$this->_password = (string) $password;
    	return $this;
    }
    
    public function getPassword()
    {
    	return $this->_password;
    }

    public function setSalt($salt)
    {
    	$this->_salt = $salt;
    	return $this;
    }
    
    public function getSalt()
    {
    	return $this->_salt;
    }
    
    public function setRealname($realname)
    {
    	$this->_realname = $realname;
    	return $this;
    }
    
    public function getRealname()
    {
    	return $this->_realname;
    }

    public function setRole($role)
    {
    	$this->_role = (int) $role;
    	return $this;
    }
    
    public function getRole()
    {
    	return $this->_role;
    }

    public function setDate_created($date_created)
    {
    	$this->_date_created =  $date_created;
    	return $this;
    }
    
    public function getDate_created()
    {
    	return $this->_date_created;
    }
    
    public function setDate_lastlogin($date_lastlogin)
    {
    	$this->_date_lastlogin = $date_lastlogin;
    	return $this;
    }
    
    public function getDate_lastlogin()
    {
    	return $this->_date_lastlogin;
    }

    public function setCountry($country)
    {
    	$this->_country = (string) $country;
    	return $this;
    }
    
    public function getCountry()
    {
    	return $this->_country;
    }
    
   
    public function setCompany($company)
    {
    	$this->_company = (string) $company;
    	return $this;
    }
    
    public function getCompany()
    {
    	return $this->_company;
    }

    public function setLocation($location)
    {
    	$this->_location = (string) $location;
    	return $this;
    }
    
    public function getLocation()
    {
    	return $this->_location;
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

    public function setStatus($status)
    {
    	$this->_status = $status;
    	return $this;
    }
    
    public function getStatus()
    {
    	return $this->_status;
    }

    public function setType($type)
    {
    	$this->_type = $type;
    	return $this;
    }
    
    public function getType()
    {
    	return $this->_type;
    }

    public function setAccount_type($account_type)
    {
    	$this->_account_type = $account_type;
    	return $this;
    }
    
    public function getAccount_type()
    {
    	return $this->_account_type;
    }
    
}