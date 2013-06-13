<?php
namespace Application\Model\Entity;

class UserPreferences {
    protected $_user_id;
    protected $_lang;
    protected $_email;
    protected $_alias;
    protected $_avatar;
    protected $_regional;
    protected $_vacation_from;
    protected $_vacation_to;
    protected $_vacation_status;
    protected $_office_phone;
    protected $_cell_phone;
    protected $_home_phone;
    protected $_other_phone;
    protected $_fax_phone;
    protected $_office_ext;
   
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
    
    public function setLang($lang)
    {
    	$this->_lang = (string) $lang;
    	return $this;
    }
    
    public function getLang()
    {
    	return $this->_lang;
    }
    
    public function setEmail($email)
    {
    	$this->_email = (string) $email;
    	return $this;
    }
    
    public function getEmail()
    {
    	return $this->_email;
    }

    public function setAlias($alias)
    {
    	$this->_alias = $alias;
    	return $this;
    }
    
    public function getAlias()
    {
    	return $this->_alias;
    }
    
    public function setAvatar($avatar)
    {
    	$this->_avatar = $avatar;
    	return $this;
    }
    
    public function getAvatar()
    {
    	return $this->_avatar;
    }

    public function setRegional($regional)
    {
    	$this->_regional = (string) $regional;
    	return $this;
    }
    
    public function getRegional()
    {
    	return $this->_regional;
    }

    public function setVacation_from($vacation_from)
    {
    	$this->_vacation_from =  $vacation_from;
    	return $this;
    }
    
    public function getVacation_from()
    {
    	return $this->_vacation_from;
    }
    
    public function setVacation_to($vacation_to)
    {
    	$this->_vacation_to = $vacation_to;
    	return $this;
    }
    
    public function getVacation_to()
    {
    	return $this->_vacation_to;
    }

    public function setVacation_status($vacation_status)
    {
    	$this->_vacation_status = $vacation_status;
    	return $this;
    }
    
    public function getVacation_status()
    {
    	return $this->_vacation_status;
    }
    
    public function setOffice_phone($office_phone)
    {
    	$this->_office_phone = $office_phone;
    	return $this;
    }
    
    public function getOffice_phone()
    {
    	return $this->_office_phone;
    }

    public function setCell_phone($cell_phone)
    {
    	$this->_cell_phone = $cell_phone;
    	return $this;
    }
    
    public function getCell_phone()
    {
    	return $this->_cell_phone;
    }

    public function setHome_phone($home_phone)
    {
    	$this->_home_phone = $home_phone;
    	return $this;
    }
    
    public function getHome_phone()
    {
    	return $this->_home_phone;
    }

    public function setOther_phone($other_phone)
    {
    	$this->_other_phone = $other_phone;
    	return $this;
    }
    
    public function getOther_phone()
    {
    	return $this->_other_phone;
    }

    public function setFax_phone($fax_phone)
    {
    	$this->_fax_phone = $fax_phone;
    	return $this;
    }
    
    public function getFax_phone()
    {
    	return $this->_fax_phone;
    }

    public function setOffice_ext($office_ext)
    {
    	$this->_office_ext = $office_ext;
    	return $this;
    }
    
    public function getOffice_ext()
    {
    	return $this->_office_ext;
    }
    
}