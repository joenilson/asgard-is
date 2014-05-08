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
    protected $date_creation;
    protected $date_modification;
    protected $id;
    protected $id_doc;
    protected $id_frequency;
    protected $id_indicator;
    protected $id_owner;
    protected $id_process;
    protected $id_thread;
    protected $location;
    protected $record_file;
    protected $status;
    protected $user_creation;
    protected $user_modification;
    protected $variables;
    
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

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function getId() {
        return $this->id;
    }

    public function getId_doc() {
        return $this->id_doc;
    }

    public function getId_frequency() {
        return $this->id_frequency;
    }

    public function getId_indicator() {
        return $this->id_indicator;
    }

    public function getId_owner() {
        return $this->id_owner;
    }

    public function getId_process() {
        return $this->id_process;
    }

    public function getId_thread() {
        return $this->id_thread;
    }

    public function getLocation() {
        return $this->location;
    }

    public function getRecord_file() {
        return $this->record_file;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getUser_creation() {
        return $this->user_creation;
    }

    public function getUser_modification() {
        return $this->user_modification;
    }

    public function getVariables() {
        return $this->variables;
    }

    public function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    public function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setId_doc($id_doc) {
        $this->id_doc = $id_doc;
        return $this;
    }

    public function setId_frequency($id_frequency) {
        $this->id_frequency = $id_frequency;
        return $this;
    }

    public function setId_indicator($id_indicator) {
        $this->id_indicator = $id_indicator;
        return $this;
    }

    public function setId_owner($id_owner) {
        $this->id_owner = $id_owner;
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

    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    public function setRecord_file($record_file) {
        $this->record_file = $record_file;
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

    public function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }

    public function setVariables($variables) {
        $this->variables = $variables;
        return $this;
    }

}