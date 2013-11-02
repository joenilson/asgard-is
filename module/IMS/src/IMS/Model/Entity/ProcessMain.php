<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class ProcessMain {
    
    protected $lang;
    protected $id;
    protected $value;
    protected $description;
    protected $ordering;
    protected $status;
    protected $type;
    protected $parent_id;
    protected $assignment;
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
    
    public function getLang() {
        return $this->lang;
    }

    public function getId() {
        return $this->id;
    }

    public function getValue() {
        return $this->value;
    }

    public function getDescription() {
        return $this->description;
    }

    public function getOrdering() {
        return $this->ordering;
    }

    public function getStatus() {
        return $this->status;
    }

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setValue($value) {
        $this->value = $value;
        return $this;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function setOrdering($ordering) {
        $this->ordering = $ordering;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }
    
    public function getType() {
        return $this->type;
    }

    public function getParent_id() {
        return $this->parent_id;
    }

    public function getAssignment() {
        return $this->assignment;
    }

    public function setType($type) {
        $this->type = $type;
        return $this;
    }

    public function setParent_id($parent_id) {
        $this->parent_id = $parent_id;
        return $this;
    }

    public function setAssignment($assignment) {
        $this->assignment = $assignment;
        return $this;
    }

}
