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
class ProcessIo {

    protected $company; 
    protected $country; 
    protected $location;
    protected $id;
    protected $process;
    protected $thread;
    protected $description;
    protected $type_io;
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
    
    function getCompany() {
        return $this->company;
    }

    function getCountry() {
        return $this->country;
    }

    function getLocation() {
        return $this->location;
    }

    function getId() {
        return $this->id;
    }

    function getProcess() {
        return $this->process;
    }

    function getThread() {
        return $this->thread;
    }

    function getDescription() {
        return $this->description;
    }

    function getType_io() {
        return $this->type_io;
    }

    function getStatus() {
        return $this->status;
    }

    function getUser_creation() {
        return $this->user_creation;
    }

    function getDate_creation() {
        return $this->date_creation;
    }

    function getUser_modification() {
        return $this->user_modification;
    }

    function getDate_modification() {
        return $this->date_modification;
    }

    function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    function setId($id) {
        $this->id = $id;
        return $this;
    }

    function setProcess($process) {
        $this->process = $process;
        return $this;
    }

    function setThread($thread) {
        $this->thread = $thread;
        return $this;
    }

    function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    function setType_io($type_io) {
        $this->type_io = $type_io;
        return $this;
    }

    function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    function setUser_creation($user_creation) {
        $this->user_creation = $user_creation;
        return $this;
    }

    function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }

    function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }


}