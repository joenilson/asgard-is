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
 * Description of CSR
 *
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */
class CSR {

    protected $company; 
    protected $country; 
    protected $location;
    protected $cs_year;
    protected $cs_indicator;
    protected $cs_indicator_range;
    protected $cs_indicator_score;
    protected $date_creation;
    protected $user_creation;
    protected $date_modification;
    protected $user_modification;
    
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

        
    public function getCs_year() {
        return $this->cs_year;
    }

    public function getCs_indicator() {
        return $this->cs_indicator;
    }

    public function getCs_indicator_range() {
        return $this->cs_indicator_range;
    }

    public function getCs_indicator_score() {
        return $this->cs_indicator_score;
    }

    public function getDate_creation() {
        return $this->date_creation;
    }

    public function getUser_creation() {
        return $this->user_creation;
    }

    public function getDate_modification() {
        return $this->date_modification;
    }

    public function getUser_modification() {
        return $this->user_modification;
    }

    public function setCs_year($cs_year) {
        $this->cs_year = $cs_year;
        return $this;
    }

    public function setCs_indicator($cs_indicator) {
        $this->cs_indicator = $cs_indicator;
        return $this;
    }

    public function setCs_indicator_range($cs_indicator_range) {
        $this->cs_indicator_range = $cs_indicator_range;
        return $this;
    }

    public function setCs_indicator_score($cs_indicator_score) {
        $this->cs_indicator_score = $cs_indicator_score;
        return $this;
    }

    public function setDate_creation($date_creation) {
        $this->date_creation = $date_creation;
        return $this;
    }

    public function setUser_creation($user_creation) {
        $this->user_creation = $user_creation;
        return $this;
    }

    public function setDate_modification($date_modification) {
        $this->date_modification = $date_modification;
        return $this;
    }

    public function setUser_modification($user_modification) {
        $this->user_modification = $user_modification;
        return $this;
    }



}