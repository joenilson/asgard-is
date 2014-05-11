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
class ISOPlan {
    
    protected $company;
    protected $country;
    protected $location;
    protected $id;
    protected $id_process;
    protected $id_thread;
    protected $id_io;
    protected $id_type;
    protected $id_variable;
    protected $id_owner_assoc;
    protected $year_date;
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

    public function getId_process() {
        return $this->id_process;
    }

    public function getId_thread() {
        return $this->id_thread;
    }

    public function getId_type() {
        return $this->id_type;
    }

    public function getId_variable() {
        return $this->id_variable;
    }

    public function getId_owner_assoc() {
        return $this->id_owner_assoc;
    }

    public function getYear_date() {
        return $this->year_date;
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

    public function setId_process($id_process) {
        $this->id_process = $id_process;
        return $this;
    }

    public function setId_thread($id_thread) {
        $this->id_thread = $id_thread;
        return $this;
    }

    public function setId_type($id_type) {
        $this->id_type = $id_type;
        return $this;
    }

    public function setId_variable($id_variable) {
        $this->id_variable = $id_variable;
        return $this;
    }

    public function setId_owner_assoc($id_owner_assoc) {
        $this->id_owner_assoc = $id_owner_assoc;
        return $this;
    }

    public function setYear_date($year_date) {
        $this->year_date = $year_date;
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

    public function getId_io() {
        return $this->id_io;
    }

    public function setId_io($id_io) {
        $this->id_io = $id_io;
        return $this;
    }


}