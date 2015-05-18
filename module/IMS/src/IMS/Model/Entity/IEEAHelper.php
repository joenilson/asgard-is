<?php
/* 
 * Copyright (C) 2014 Joe Nilson <joenilson@grupoism.com.do>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace IMS\Model\Entity;

/**
 * Description of CSB
 *
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */
class IEEAHelper {

    protected $lang;
    protected $helper;
    protected $id;
    protected $description;
    protected $ordering;
    protected $aspect_code;
    protected $aspect_type;
    protected $description_impact;
    protected $legal_requirement;
    protected $status;
    protected $user_creation;
    protected $date_creation;
    protected $user_modification;
    protected $date_modification;
    
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

    public function getHelper() {
        return $this->helper;
    }

    public function getDescription() {
        return $this->description;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getUser_creation() {
        return $this->user_creation;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_modification() {
        return $this->user_modification;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setHelper($helper) {
        $this->helper = $helper;
        return $this;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setUser_creation($user_creation) {
        $this->user_creation = $user_creation;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    public function getOrdering() {
        return $this->ordering;
    }

    public function setOrdering($ordering) {
        $this->ordering = $ordering;
        return $this;
    }
    
    function getAspect_code() {
        return $this->aspect_code;
    }

    function getDescription_impact() {
        return $this->description_impact;
    }

    function getLegal_requirement() {
        return $this->legal_requirement;
    }

    function setAspect_code($aspect_code) {
        $this->aspect_code = $aspect_code;
        return $this;
    }

    function setDescription_impact($description_impact) {
        $this->description_impact = $description_impact;
        return $this;
    }

    function setLegal_requirement($legal_requirement) {
        $this->legal_requirement = $legal_requirement;
        return $this;
    }

    function getAspect_type() {
        return $this->aspect_type;
    }

    function setAspect_type($aspect_type) {
        $this->aspect_type = $aspect_type;
        return $this;
    }
    
    

}