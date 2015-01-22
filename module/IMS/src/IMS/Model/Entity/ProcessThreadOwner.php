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

class ProcessThreadOwner {
    
    protected $type;
    protected $id;
    protected $date_creation;
    protected $user_id;
    protected $country;
    protected $company;
    protected $location;
    protected $id_owner;
   
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
    
    function getType() {
        return $this->type;
    }

    function getId() {
        return $this->id;
    }

    function getDate_creation() {
        return $this->date_creation;
    }

    function getUser_id() {
        return $this->user_id;
    }

    function getCountry() {
        return $this->country;
    }

    function getCompany() {
        return $this->company;
    }

    function getLocation() {
        return $this->location;
    }

    function getId_owner() {
        return $this->id_owner;
    }

    function setType($type) {
        $this->type = $type;
        return $this;
    }

    function setId($id) {
        $this->id = $id;
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

    function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    function setId_owner($id_owner) {
        $this->id_owner = $id_owner;
        return $this;
    }



}
