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
class Audits {

    protected $company; 
    protected $country; 
    protected $location;
    protected $id;
    protected $audit_type;
    protected $audit_desc;
    protected $audit_date;
    protected $audit_file;
    protected $status;
    protected $user_id;
    protected $date_creation;
    protected $user_mod;
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
    
    public function getCompany() {
        return $this->company;
    }

    public function getCountry() {
        return $this->country;
    }

    public function getLocation() {
        return $this->location;
    }

    public function getId() {
        return $this->id;
    }

    public function getAudit_type() {
        return $this->audit_type;
    }

    public function getAudit_desc() {
        return $this->audit_desc;
    }

    public function getAudit_date() {
        return $this->audit_date;
    }

    public function getAudit_file() {
        return $this->audit_file;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getUser_id() {
        return $this->user_id;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_mod() {
        return $this->user_mod;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    public function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setAudit_type($audit_type) {
        $this->audit_type = $audit_type;
        return $this;
    }

    public function setAudit_desc($audit_desc) {
        $this->audit_desc = $audit_desc;
        return $this;
    }

    public function setAudit_date($audit_date) {
        $this->audit_date = $audit_date;
        return $this;
    }

    public function setAudit_file($audit_file) {
        $this->audit_file = $audit_file;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setUser_id($user_id) {
        $this->user_id = $user_id;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_mod($user_mod) {
        $this->user_mod = $user_mod;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }
    
}