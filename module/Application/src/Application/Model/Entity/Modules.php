<?php 
namespace Application\Model\Entity;

class Modules {
   
	protected $_mid;
	protected $_mshortdesc;
	protected $_mlongdesc;
	protected $_loadurl;
	protected $_helpurl;
	protected $_icon;
	protected $_status;
	protected $_typeof;
	protected $_ordering;
	protected $_datecreation;
	protected $_dateactivation;
    

    public function __construct(array $options = null) {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value) {
        $method = 'set' . $name;
        if (!method_exists($this, $method)) {
            throw new \Exception('Invalid Method');
        }
        $this->$method($value);
    }

    public function __get($name) {
        $method = 'get' . $name;
        if (!method_exists($this, $method)) {
            throw new \Exception('Invalid Method');
        }
        return $this->$method();
    }

    public function setOptions(array $options) {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }

    public function getMid() {
        return $this->_mid;
    }

    public function setMid($mid) {
        $this->_mid = $mid;
        return $this;
    }

    public function getMshortdesc() {
        return $this->_mshortdesc;
    }

    public function setMshortdesc($mshortdesc) {
        $this->_mshortdesc = $mshortdesc;
        return $this;
    }

    public function getMlongdesc() {
        return $this->_mlongdesc;
    }

    public function setMlongdesc($mlongdesc) {
        $this->_mlongdesc = $mlongdesc;
        return $this;
    }
    
    public function getLoadurl() {
    	return $this->_loadurl;
    }
    
    public function setLoadurl($loadurl) {
    	$this->_loadurl = $loadurl;
    	return $this;
    }
    
    public function getHelpurl() {
    	return $this->_helpurl;
    }
    
    public function setHelpurl($helpurl) {
    	$this->_helpurl = $helpurl;
    	return $this;
    }

    public function getIcon() {
    	return $this->_icon;
    }
    
    public function setIcon($icon) {
    	$this->_icon = $icon;
    	return $this;
    }

    public function getStatus() {
    	return $this->_status;
    }
    
    public function setStatus($status) {
    	$this->_status = $status;
    	return $this;
    }

    public function getTypeof() {
    	return $this->_typeof;
    }
    
    public function setTypeof($typeof) {
    	$this->_typeof = $typeof;
    	return $this;
    }

    public function getOrdering() {
    	return $this->_ordering;
    }
    
    public function setOrdering($ordering) {
    	$this->_ordering = $ordering;
    	return $this;
    }

    public function getDatecreation() {
    	return $this->_datecreation;
    }
    
    public function setDatecreation($datecreation) {
    	$this->_datecreation = $datecreation;
    	return $this;
    }

    public function getDateactivation() {
    	return $this->_dateactivation;
    }
    
    public function setDateactivation($dateactivation) {
    	$this->_dateactivation = $dateactivation;
    	return $this;
    }
    
}