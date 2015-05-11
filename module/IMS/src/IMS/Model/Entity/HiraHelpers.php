<?php
/* 
 * Copyright (C) 2013 Joe Nilson <joenilson@gmail.com>
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
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class HiraHelpers {
    
    protected $helper;
    protected $id;
    protected $id_type;
    protected $lang;
    protected $description;
    protected $description_danger;
    protected $description_risk;
    protected $description_consequence;
    protected $status;
    protected $date_creation;
    protected $user_id;
   
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
    
    function getHelper() {
        return $this->helper;
    }

    function getId() {
        return $this->id;
    }

    function getId_type() {
        return $this->id_type;
    }

    function getLang() {
        return $this->lang;
    }

    function getDescription_danger() {
        return $this->description_danger;
    }

    function getDescription_risk() {
        return $this->description_risk;
    }

    function getDescription_consequence() {
        return $this->description_consequence;
    }

    function getStatus() {
        return $this->status;
    }

    function getDate_creation() {
        return $this->date_creation;
    }

    function getUser_id() {
        return $this->user_id;
    }

    function setHelper($helper) {
        $this->helper = $helper;
        return $this;
    }

    function setId($id) {
        $this->id = $id;
        return $this;
    }

    function setId_type($id_type) {
        $this->id_type = $id_type;
        return $this;
    }

    function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    function setDescription_danger($description_danger) {
        $this->description_danger = $description_danger;
        return $this;
    }

    function setDescription_risk($description_risk) {
        $this->description_risk = $description_risk;
        return $this;
    }

    function setDescription_consequence($description_consequence) {
        $this->description_consequence = $description_consequence;
        return $this;
    }

    function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    function setUser_id($user_id) {
        $this->user_id = $user_id;
        return $this;
    }

    function getDescription() {
        return $this->description;
    }

    function setDescription($description) {
        $this->description = $description;
        return $this;
    }


}
