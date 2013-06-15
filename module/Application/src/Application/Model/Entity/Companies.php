<?php 
namespace Application\Model\Entity;

class Companies {
   
protected $_id;
protected $_legal_name;
protected $_comercial_name;
protected $_fiscal_id;
protected $_legal_address;
protected $_comercial_address;
protected $_phone_number;
protected $_country;
protected $_domain_name;
protected $_primary_lang;
protected $_status;
protected $_is_cluster;
protected $_is_header;
protected $_cluster_id;
    

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

    public function getId() {
        return $this->_id;
    }

    public function setId($id) {
        $this->_id = (string) $id;
        return $this;
    }

    public function getLegal_name() {
        return $this->_legal_name;
    }

    public function setLegal_name($legal_name) {
        $this->_legal_name = (string) $legal_name;
        return $this;
    }

    public function getComercial_name() {
        return $this->_comercial_name;
    }

    public function setComercial_name($comercial_name) {
        $this->_comercial_name = (string) $comercial_name;
        return $this;
    }
    
    public function getFiscal_id() {
    	return $this->_fiscal_id;
    }
    
    public function setFiscal_id($fiscal_id) {
    	$this->_fiscal_id = (string) $fiscal_id;
    	return $this;
    }
    
    public function getLegal_address() {
    	return $this->_legal_address;
    }
    
    public function setLegal_address($legal_address) {
    	$this->_legal_address = (string) $legal_address;
    	return $this;
    }

    public function getComercial_address() {
    	return $this->_comercial_address;
    }
    
    public function setComercial_address($comercial_address) {
    	$this->_comercial_address = $comercial_address;
    	return $this;
    }

    public function getPhone_number() {
    	return $this->_phone_number;
    }
    
    public function setPhone_number($phone_number) {
    	$this->_phone_number = $phone_number;
    	return $this;
    }

    public function getCountry() {
    	return $this->_country;
    }
    
    public function setCountry($country) {
    	$this->_country = $country;
    	return $this;
    }

    public function getDomain_name() {
    	return $this->_domain_name;
    }
    
    public function setDomain_name($domain_name) {
    	$this->_domain_name = $domain_name;
    	return $this;
    }

    public function getPrimary_lang() {
    	return $this->_primary_lang;
    }
    
    public function setPrimary_lang($primary_lang) {
    	$this->_primary_lang = $primary_lang;
    	return $this;
    }

    public function getStatus() {
    	return $this->_status;
    }
    
    public function setStatus($status) {
    	$this->_status = $status;
    	return $this;
    }
 
    public function getIs_cluster() {
    	return $this->_is_cluster;
    }
    
    public function setIs_cluster($is_cluster) {
    	$this->_is_cluster = $is_cluster;
    	return $this;
    }
    
    public function getIs_header() {
    	return $this->_is_header;
    }
    
    public function setIs_header($is_header) {
    	$this->_is_header = $is_header;
    	return $this;
    }

    public function getCluster_id() {
    	return $this->_cluster_id;
    }
    
    public function setCluster_id($cluster_id) {
    	$this->_cluster_id = $cluster_id;
    	return $this;
    }

}