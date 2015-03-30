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

class DocsLibrary {
    
    protected $doc_id;
    protected $lang;
    protected $doc_classification;
    protected $doc_desc;
    protected $doc_file;
    protected $doc_type;
    protected $doc_review;
    protected $doc_protection;
    protected $doc_owner;
    protected $doc_location;
    protected $doc_origin;
    protected $doc_retention;
    protected $doc_record;
    protected $doc_version_number;
    protected $doc_version_label;
    protected $doc_date_creation;
    protected $doc_user_creation;
    protected $doc_date_modification;
    protected $doc_user_modification;
    protected $doc_date_revision_req;
    protected $doc_user_revision_req;
    protected $doc_date_revision_actual;
    protected $doc_date_revision_next;
    protected $doc_status_general;
    protected $doc_status_revision;
    protected $doc_reference;
    protected $country;
    protected $company;
    protected $location;
    protected $id_process;
    protected $id_thread;
    protected $id_activity;
    protected $doc_final_dispose;
    protected $doc_minimal_time;
    protected $doc_source;
   
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

    public function getDoc_desc() {
        return $this->doc_desc;
    }

    public function getDoc_file() {
        return $this->doc_file;
    }

    public function getDoc_type() {
        return $this->doc_type;
    }

    public function getDoc_review() {
        return $this->doc_review;
    }

    public function getDoc_protection() {
        return $this->doc_protection;
    }

    public function getDoc_owner() {
        return $this->doc_owner;
    }

    public function getDoc_location() {
        return $this->doc_location;
    }

    public function getDoc_origin() {
        return $this->doc_origin;
    }

    public function getDoc_retention() {
        return $this->doc_retention;
    }

    public function getDoc_record() {
        return $this->doc_record;
    }

    public function getDoc_version_number() {
        return $this->doc_version_number;
    }

    public function getDoc_version_label() {
        return $this->doc_version_label;
    }

    public function getDoc_date_creation() {
        return $this->doc_date_creation;
    }

    public function getDoc_user_creation() {
        return $this->doc_user_creation;
    }

    public function getDoc_date_modification() {
        return $this->doc_date_modification;
    }

    public function getDoc_user_modification() {
        return $this->doc_user_modification;
    }

    public function getDoc_date_revision_req() {
        return $this->doc_date_revision_req;
    }

    public function getDoc_user_revision_req() {
        return $this->doc_user_revision_req;
    }

    public function getDoc_date_revision_actual() {
        return $this->doc_date_revision_actual;
    }

    public function getDoc_date_revision_next() {
        return $this->doc_date_revision_next;
    }

    public function getDoc_status_general() {
        return $this->doc_status_general;
    }

    public function getDoc_status_revision() {
        return $this->doc_status_revision;
    }

    public function getDoc_reference() {
        return $this->doc_reference;
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

    public function setDoc_desc($doc_desc) {
        $this->doc_desc = $doc_desc;
        return $this;
    }

    public function setDoc_file($doc_file) {
        $this->doc_file = $doc_file;
        return $this;
    }

    public function setDoc_type($doc_type) {
        $this->doc_type = $doc_type;
        return $this;
    }

    public function setDoc_review($doc_review) {
        $this->doc_review = $doc_review;
        return $this;
    }

    public function setDoc_protection($doc_protection) {
        $this->doc_protection = $doc_protection;
        return $this;
    }

    public function setDoc_owner($doc_owner) {
        $this->doc_owner = $doc_owner;
        return $this;
    }

    public function setDoc_location($doc_location) {
        $this->doc_location = $doc_location;
        return $this;
    }

    public function setDoc_origin($doc_origin) {
        $this->doc_origin = $doc_origin;
        return $this;
    }

    public function setDoc_retention($doc_retention) {
        $this->doc_retention = $doc_retention;
        return $this;
    }

    public function setDoc_record($doc_record) {
        $this->doc_record = $doc_record;
        return $this;
    }

    public function setDoc_version_number($doc_version_number) {
        $this->doc_version_number = $doc_version_number;
        return $this;
    }

    public function setDoc_version_label($doc_version_label) {
        $this->doc_version_label = $doc_version_label;
        return $this;
    }

    public function setDoc_date_creation($doc_date_creation) {
        $this->doc_date_creation = $doc_date_creation;
        return $this;
    }

    public function setDoc_user_creation($doc_user_creation) {
        $this->doc_user_creation = $doc_user_creation;
        return $this;
    }

    public function setDoc_date_modification($doc_date_modification) {
        $this->doc_date_modification = $doc_date_modification;
        return $this;
    }

    public function setDoc_user_modification($doc_user_modification) {
        $this->doc_user_modification = $doc_user_modification;
        return $this;
    }

    public function setDoc_date_revision_req($doc_date_revision_req) {
        $this->doc_date_revision_req = $doc_date_revision_req;
        return $this;
    }

    public function setDoc_user_revision_req($doc_user_revision_req) {
        $this->doc_user_revision_req = $doc_user_revision_req;
        return $this;
    }

    public function setDoc_date_revision_actual($doc_date_revision_actual) {
        $this->doc_date_revision_actual = $doc_date_revision_actual;
        return $this;
    }

    public function setDoc_date_revision_next($doc_date_revision_next) {
        $this->doc_date_revision_next = $doc_date_revision_next;
        return $this;
    }

    public function setDoc_status_general($doc_status_general) {
        $this->doc_status_general = $doc_status_general;
        return $this;
    }

    public function setDoc_status_revision($doc_status_revision) {
        $this->doc_status_revision = $doc_status_revision;
        return $this;
    }

    public function setDoc_reference($doc_reference) {
        $this->doc_reference = $doc_reference;
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
    
    public function getId_process() {
        return $this->id_process;
    }

    public function getId_thread() {
        return $this->id_thread;
    }

    public function getId_activity() {
        return $this->id_activity;
    }

    public function setId_process($id_process) {
        $this->id_process = $id_process;
        return $this;
    }

    public function setId_thread($id_thread) {
        $this->id_thread = $id_thread;
        return $this;
    }

    public function setId_activity($id_activity) {
        $this->id_activity = $id_activity;
        return $this;
    }

    function getDoc_final_dispose() {
        return $this->doc_final_dispose;
    }

    function getDoc_minimal_time() {
        return $this->doc_minimal_time;
    }

    function setDoc_final_dispose($doc_final_dispose) {
        $this->doc_final_dispose = $doc_final_dispose;
        return $this;
    }

    function setDoc_minimal_time($doc_minimal_time) {
        $this->doc_minimal_time = $doc_minimal_time;
        return $this;
    }

    function getDoc_source() {
        return $this->doc_source;
    }

    function setDoc_source($doc_source) {
        $this->doc_source = $doc_source;
        return $this;
    }

}
