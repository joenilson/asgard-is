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
    protected $id_type;
    protected $id_cycle;
    protected $id_process;
    protected $id_thread;
    protected $id_ea;
    protected $id_ei;
    protected $quantity;
    protected $unit_measure;
    protected $influence;
    protected $magnitude;
    protected $frequency;
    protected $e_impact;
    protected $save;
    protected $t_normal_c;
    protected $legal_req;
    protected $corporative_req;
    protected $voluntary_req;
    protected $total_req;
    protected $abnormal_ha_a;
    protected $abnormal_ha_b;
    protected $abnormal_ha_c;
    protected $abnormal_ha_d;
    protected $abnormal_im_e;
    protected $abnormal_im_f;
    protected $abnormal_su_g;
    protected $abnormal_factor;
    protected $abnormal_table;
    protected $ranking;
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

    public function getId_type() {
        return $this->id_type;
    }

    public function getId_cycle() {
        return $this->id_cycle;
    }

    public function getId_process() {
        return $this->id_process;
    }

    public function getId_thread() {
        return $this->id_thread;
    }

    public function getId_ea() {
        return $this->id_ea;
    }

    public function getId_ei() {
        return $this->id_ei;
    }

    public function getQuantity() {
        return $this->quantity;
    }

    public function getUnit_measure() {
        return $this->unit_measure;
    }

    public function getInfluence() {
        return $this->influence;
    }

    public function getMagnitude() {
        return $this->magnitude;
    }

    public function getFrequency() {
        return $this->frequency;
    }

    public function getE_impact() {
        return $this->e_impact;
    }

    public function getSave() {
        return $this->save;
    }

    public function getT_normal_c() {
        return $this->t_normal_c;
    }

    public function getLegal_req() {
        return $this->legal_req;
    }

    public function getCorporative_req() {
        return $this->corporative_req;
    }

    public function getVoluntary_req() {
        return $this->voluntary_req;
    }

    public function getTotal_req() {
        return $this->total_req;
    }

    public function getAbnormal_ha_a() {
        return $this->abnormal_ha_a;
    }

    public function getAbnormal_ha_b() {
        return $this->abnormal_ha_b;
    }

    public function getAbnormal_ha_c() {
        return $this->abnormal_ha_c;
    }

    public function getAbnormal_ha_d() {
        return $this->abnormal_ha_d;
    }

    public function getAbnormal_im_e() {
        return $this->abnormal_im_e;
    }

    public function getAbnormal_im_f() {
        return $this->abnormal_im_f;
    }

    public function getAbnormal_su_g() {
        return $this->abnormal_su_g;
    }

    public function getAbnormal_factor() {
        return $this->abnormal_factor;
    }

    public function getAbnormal_table() {
        return $this->abnormal_table;
    }

    public function getRanking() {
        return $this->ranking;
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

    public function setId_type($id_type) {
        $this->id_type = $id_type;
        return $this;
    }

    public function setId_cycle($id_cycle) {
        $this->id_cycle = $id_cycle;
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

    public function setId_ea($id_ea) {
        $this->id_ea = $id_ea;
        return $this;
    }

    public function setId_ei($id_ei) {
        $this->id_ei = $id_ei;
        return $this;
    }

    public function setQuantity($quantity) {
        $this->quantity = $quantity;
        return $this;
    }

    public function setUnit_measure($unit_measure) {
        $this->unit_measure = $unit_measure;
        return $this;
    }

    public function setInfluence($influence) {
        $this->influence = $influence;
        return $this;
    }

    public function setMagnitude($magnitude) {
        $this->magnitude = $magnitude;
        return $this;
    }

    public function setFrequency($frequency) {
        $this->frequency = $frequency;
        return $this;
    }

    public function setE_impact($e_impact) {
        $this->e_impact = $e_impact;
        return $this;
    }

    public function setSave($save) {
        $this->save = $save;
        return $this;
    }

    public function setT_normal_c($t_normal_c) {
        $this->t_normal_c = $t_normal_c;
        return $this;
    }

    public function setLegal_req($legal_req) {
        $this->legal_req = $legal_req;
        return $this;
    }

    public function setCorporative_req($corporative_req) {
        $this->corporative_req = $corporative_req;
        return $this;
    }

    public function setVoluntary_req($voluntary_req) {
        $this->voluntary_req = $voluntary_req;
        return $this;
    }

    public function setTotal_req($total_req) {
        $this->total_req = $total_req;
        return $this;
    }

    public function setAbnormal_ha_a($abnormal_ha_a) {
        $this->abnormal_ha_a = $abnormal_ha_a;
        return $this;
    }

    public function setAbnormal_ha_b($abnormal_ha_b) {
        $this->abnormal_ha_b = $abnormal_ha_b;
        return $this;
    }

    public function setAbnormal_ha_c($abnormal_ha_c) {
        $this->abnormal_ha_c = $abnormal_ha_c;
        return $this;
    }

    public function setAbnormal_ha_d($abnormal_ha_d) {
        $this->abnormal_ha_d = $abnormal_ha_d;
        return $this;
    }

    public function setAbnormal_im_e($abnormal_im_e) {
        $this->abnormal_im_e = $abnormal_im_e;
        return $this;
    }

    public function setAbnormal_im_f($abnormal_im_f) {
        $this->abnormal_im_f = $abnormal_im_f;
        return $this;
    }

    public function setAbnormal_su_g($abnormal_su_g) {
        $this->abnormal_su_g = $abnormal_su_g;
        return $this;
    }

    public function setAbnormal_factor($abnormal_factor) {
        $this->abnormal_factor = $abnormal_factor;
        return $this;
    }

    public function setAbnormal_table($abnormal_table) {
        $this->abnormal_table = $abnormal_table;
        return $this;
    }

    public function setRanking($ranking) {
        $this->ranking = $ranking;
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