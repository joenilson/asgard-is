<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace Application\Model\Entity;

class Countries {
    
    protected $id;
    protected $abrev;
    protected $name;
    protected $locale;
    protected $currency_symbol;
    protected $currency_description;
    protected $timezone;
   
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
    
    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function getAbrev() {
        return $this->abrev;
    }

    public function setAbrev($abrev) {
        $this->abrev = $abrev;
        return $this;
    }

    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        $this->name = $name;
        return $this;
    }

    public function getLocale() {
        return $this->locale;
    }

    public function setLocale($locale) {
        $this->locale = $locale;
        return $this;
    }

    public function getCurrency_symbol() {
        return $this->currency_symbol;
    }

    public function setCurrency_symbol($currency_symbol) {
        $this->currency_symbol = $currency_symbol;
        return $this;
    }

    public function getCurrency_description() {
        return $this->currency_description;
    }

    public function setCurrency_description($currency_description) {
        $this->currency_description = $currency_description;
        return $this;
    }

    public function getTimezone() {
        return $this->timezone;
    }

    public function setTimezone($timezone) {
        $this->timezone = $timezone;
        return $this;
    }

}
