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
class IEEA {

    protected $company;
    protected $country;
    protected $location;
    protected $id;
    protected $eval_date;
    protected $eval_team;
    protected $id_process;
    protected $id_thread;
    protected $aspect_code;
    protected $normal_condition;
    protected $abnormal_condition;
    protected $emergency_condition;
    protected $magnitude;
    protected $severity;
    protected $consequence;
    protected $probability;
    protected $significance;
    protected $significant;
    protected $legal_requirement;
    protected $operational_control;
    protected $goal;
    protected $emergency_plan;
    protected $tracing;
    protected $measurement;
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

    public function getEval_date() {
        return $this->eval_date;
    }

    public function getEval_team() {
        return $this->eval_team;
    }

    public function getId_process() {
        return $this->id_process;
    }

    public function getId_thread() {
        return $this->id_thread;
    }

    public function getAspect_code() {
        return $this->aspect_code;
    }

    public function getNormal_condition() {
        return $this->normal_condition;
    }

    public function getAbnormal_condition() {
        return $this->abnormal_condition;
    }

    public function getEmergency_condition() {
        return $this->emergency_condition;
    }

    public function getMagnitude() {
        return $this->magnitude;
    }

    public function getSeverity() {
        return $this->severity;
    }

    public function getConsequence() {
        return $this->consequence;
    }

    public function getProbability() {
        return $this->probability;
    }

    public function getSignificance() {
        return $this->significance;
    }

    public function getSignificant() {
        return $this->significant;
    }

    public function getLegal_requirement() {
        return $this->legal_requirement;
    }

    public function getOperational_control() {
        return $this->operational_control;
    }

    public function getGoal() {
        return $this->goal;
    }

    public function getEmergency_plan() {
        return $this->emergency_plan;
    }

    public function getTracing() {
        return $this->tracing;
    }

    public function getMeasurement() {
        return $this->measurement;
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

    public function setEval_date($eval_date) {
        $this->eval_date = $eval_date;
        return $this;
    }

    public function setEval_team($eval_team) {
        $this->eval_team = $eval_team;
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

    public function setAspect_code($aspect_code) {
        $this->aspect_code = $aspect_code;
        return $this;
    }

    public function setNormal_condition($normal_condition) {
        $this->normal_condition = $normal_condition;
        return $this;
    }

    public function setAbnormal_condition($abnormal_condition) {
        $this->abnormal_condition = $abnormal_condition;
        return $this;
    }

    public function setEmergency_condition($emergency_condition) {
        $this->emergency_condition = $emergency_condition;
        return $this;
    }

    public function setMagnitude($magnitude) {
        $this->magnitude = $magnitude;
        return $this;
    }

    public function setSeverity($severity) {
        $this->severity = $severity;
        return $this;
    }

    public function setConsequence($consequence) {
        $this->consequence = $consequence;
        return $this;
    }

    public function setProbability($probability) {
        $this->probability = $probability;
        return $this;
    }

    public function setSignificance($significance) {
        $this->significance = $significance;
        return $this;
    }

    public function setSignificant($significant) {
        $this->significant = $significant;
        return $this;
    }

    public function setLegal_requirement($legal_requirement) {
        $this->legal_requirement = $legal_requirement;
        return $this;
    }

    public function setOperational_control($operational_control) {
        $this->operational_control = $operational_control;
        return $this;
    }

    public function setGoal($goal) {
        $this->goal = $goal;
        return $this;
    }

    public function setEmergency_plan($emergency_plan) {
        $this->emergency_plan = $emergency_plan;
        return $this;
    }

    public function setTracing($tracing) {
        $this->tracing = $tracing;
        return $this;
    }

    public function setMeasurement($measurement) {
        $this->measurement = $measurement;
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


}