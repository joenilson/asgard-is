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

class DocsRequest {
    
    protected $doc_id;
    protected $lang;
    protected $doc_classification;
    protected $doc_file;
    protected $desc_request;
    protected $user_request;
    protected $name_request;
    protected $email_request;
    protected $date_request;
    protected $date_attention;
    protected $status;
    protected $user_auth;
    protected $doc_newid;
    protected $country;
    protected $company;
    protected $location;
    protected $desc_attention;
   
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
    
    public function getDoc_id() {
        return $this->doc_id;
    }

    public function getLang() {
        return $this->lang;
    }

    public function getDoc_classification() {
        return $this->doc_classification;
    }

    public function getDoc_file() {
        return $this->doc_file;
    }

    public function getDesc_request() {
        return $this->desc_request;
    }

    public function getUser_request() {
        return $this->user_request;
    }

    public function getName_request() {
        return $this->name_request;
    }

    public function getEmail_request() {
        return $this->email_request;
    }

    public function getDate_request() {
        return $this->date_request;
    }

    public function getDate_attention() {
        return $this->date_attention;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getUser_auth() {
        return $this->user_auth;
    }

    public function getDoc_newid() {
        return $this->doc_newid;
    }

    public function getCountry() {
        return $this->country;
    }

    public function getCompany() {
        return $this->company;
    }

    public function getLocation() {
        return $this->location;
    }

    public function setDoc_id($doc_id) {
        $this->doc_id = $doc_id;
        return $this;
    }

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function setDoc_classification($doc_classification) {
        $this->doc_classification = $doc_classification;
        return $this;
    }

    public function setDoc_file($doc_file) {
        $this->doc_file = $doc_file;
        return $this;
    }

    public function setDesc_request($desc_request) {
        $this->desc_request = $desc_request;
        return $this;
    }

    public function setUser_request($user_request) {
        $this->user_request = $user_request;
        return $this;
    }

    public function setName_request($name_request) {
        $this->name_request = $name_request;
        return $this;
    }

    public function setEmail_request($email_request) {
        $this->email_request = $email_request;
        return $this;
    }

    public function setDate_request($date_request) {
        $this->date_request = $date_request;
        return $this;
    }

    public function setDate_attention($date_attention) {
        $this->date_attention = $date_attention;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setUser_auth($user_auth) {
        $this->user_auth = $user_auth;
        return $this;
    }

    public function setDoc_newid($doc_newid) {
        $this->doc_newid = $doc_newid;
        return $this;
    }

    public function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    public function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }



}
