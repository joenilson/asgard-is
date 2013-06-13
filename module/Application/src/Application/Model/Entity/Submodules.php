<?php 
namespace Application\Model\Entity;

class Submodules {
   
	protected $_mid;
	protected $_smid;
	protected $_parent_smid;
	protected $_smshortdesc;
	protected $_smlongdesc;
	protected $_loadurl;
	protected $_icon;
	protected $_status;
	protected $_typeof;
	protected $_ordering;
	protected $_datecreation;
	protected $_dateactivation;
	protected $_content_header;
	protected $_content_body;
    
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

    public function getSmid() {
        return $this->_smid;
    }

    public function setSmid($smid) {
        $this->_smid = $smid;
        return $this;
    }

    public function getParent_smid() {
    	return $this->_parent_smid;
    }
    
    public function setParent_smid($parent_smid) {
    	$this->_parent_smid = $parent_smid;
    	return $this;
    }
    
    public function getSmshortdesc() {
        return $this->_smshortdesc;
    }

    public function setSmshortdesc($smshortdesc) {
        $this->_smshortdesc = $smshortdesc;
        return $this;
    }

    public function getMlongdesc() {
        return $this->_mlongdesc;
    }

    public function setSmlongdesc($smlongdesc) {
        $this->_smlongdesc = $smlongdesc;
        return $this;
    }
    
    public function getLoadurl() {
    	return $this->_loadurl;
    }
    
    public function setLoadurl($loadurl) {
    	$this->_loadurl = $loadurl;
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