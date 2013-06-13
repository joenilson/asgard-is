<?php
namespace Application\Model\Entity;

class UserSubmodules {
    protected $_user_id;
    protected $_mid;
    protected $_lang;
    protected $_mshortdesc;
    protected $_parent_smid;
    protected $_smid;
    protected $_smshortdesc;
    protected $_helpurl;
    protected $_mloadurl;
    protected $_smloadurl;
    protected $_micon;
    protected $_smicon;
    protected $_mtypeof;
    protected $_smtypeof;
    protected $_mordering;
    protected $_smordering;
    protected $_view;
    protected $_edit;
    protected $_add;
    protected $_admin;
    protected $_content_header;
    protected $_content_body;
    
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
    
    public function getUser_id($user_id)
    {
    	return $this->_user_id;
    }
    
    public function setMid($mid)
    {
    	$this->_mid = (int) $mid;
    	return $this;
    }
    
    public function getMid($mid)
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
    
    public function setParent_smid($parent_smid)
    {
    	$this->_parent_smid = (int) $parent_smid;
    	return $this;
    }
    
    public function getParent_smid($parent_smid)
    {
    	return $this->_parent_smid;
    }
    
    public function setSmid($smid)
    {
    	$this->_smid = (int) $smid;
    	return $this;
    }
    
    public function getSmid($smid)
    {
    	return $this->_smid;
    }
    
    public function setSmshortdesc($smshortdesc)
    {
    	$this->_smshortdesc = (string) $smshortdesc;
    	return $this;
    }
    
    public function getSmshortdesc()
    {
    	return $this->_smshortdesc;
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
    
    public function setMloadurl($mloadurl)
    {
    	$this->_mloadurl = (string) $mloadurl;
    	return $this;
    }
    
    public function getMloadurl()
    {
    	return $this->_mloadurl;
    }
    
    public function setSmloadurl($smloadurl)
    {
    	$this->_smloadurl = (string) $smloadurl;
    	return $this;
    }
    
    public function getSmloadurl()
    {
    	return $this->_smloadurl;
    }
    
    public function setMicon($micon)
    {
    	$this->_micon = (string) $micon;
    	return $this;
    }
    
    public function getMicon()
    {
    	return $this->_micon;
    }
    
    public function setSmicon($smicon)
    {
    	$this->_smicon = (string) $smicon;
    	return $this;
    }
    
    public function getSmicon()
    {
    	return $this->_smicon;
    }
    
    public function setMtypeof($mtypeof)
    {
    	$this->_mtypeof = (string) $mtypeof;
    	return $this;
    }
    
    public function getMtypeof()
    {
    	return $this->_mtypeof;
    }
    
    public function setSmtypeof($smtypeof)
    {
    	$this->_smtypeof = (string) $smtypeof;
    	return $this;
    }
    
    public function getSmtypeof()
    {
    	return $this->_smtypeof;
    }
    
    public function setMordering($mordering)
    {
    	$this->_mordering = (int) $mordering;
    	return $this;
    }
    
    public function getMordering()
    {
    	return $this->_mordering;
    }
    
    public function setSmordering($smordering)
    {
    	$this->_smordering = (int) $smordering;
    	return $this;
    }
    
    public function getSmordering()
    {
    	return $this->_smordering;
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
    
    public function getContent_header() {
    	return $this->_content_header;
    }
    
    public function setContent_header($content_header) {
    	$this->_content_header = $content_header;
    	return $this;
    }
    
    public function getContent_body() {
    	return $this->_content_body;
    }
    
    public function setContent_body($content_body) {
    	$this->_content_body = $content_body;
    	return $this;
    }
    
}