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
 * Description of ManagementIndicators
 *
 * @author Joe Nilson <joenilson@grupoism.com.do>
 */
class ManagementIndicators {

    protected $id; 
    protected $lang;
    protected $description;
    protected $management_value;
    protected $management_register;
    protected $frequency_management;
    protected $frequency_indicator;
    protected $formula;
    protected $id_process_main;
    protected $id_process_thread;
    protected $status;
    protected $old_id;
    protected $old_id_process;
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
    
    public function getId() {
        return $this->id;
    }

    public function getLang() {
        return $this->lang;
    }

    public function getDescription() {
        return $this->description;
    }

    public function getManagement_value() {
        return $this->management_value;
    }

    public function getManagement_register() {
        return $this->management_register;
    }

    public function getFrequency_management() {
        return $this->frequency_management;
    }

    public function getFrequency_indicator() {
        return $this->frequency_indicator;
    }

    public function getFormula() {
        return $this->formula;
    }

    public function getId_process_main() {
        return $this->id_process_main;
    }

    public function getId_process_thread() {
        return $this->id_process_thread;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getOld_id() {
        return $this->old_id;
    }

    public function getOld_id_process() {
        return $this->old_id_process;
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

    public function setId($id) {
        $this->id = $id;
        return $this;
    }

    public function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    public function setDescription($description) {
        $this->description = $description;
        return $this;
    }

    public function setManagement_value($management_value) {
        $this->management_value = $management_value;
        return $this;
    }

    public function setManagement_register($management_register) {
        $this->management_register = $management_register;
        return $this;
    }

    public function setFrequency_management($frequency_management) {
        $this->frequency_management = $frequency_management;
        return $this;
    }

    public function setFrequency_indicator($frequency_indicator) {
        $this->frequency_indicator = $frequency_indicator;
        return $this;
    }

    public function setFormula($formula) {
        $this->formula = $formula;
        return $this;
    }

    public function setId_process_main($id_process_main) {
        $this->id_process_main = $id_process_main;
        return $this;
    }

    public function setId_process_thread($id_process_thread) {
        $this->id_process_thread = $id_process_thread;
        return $this;
    }

    public function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    public function setOld_id($old_id) {
        $this->old_id = $old_id;
        return $this;
    }

    public function setOld_id_process($old_id_process) {
        $this->old_id_process = $old_id_process;
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