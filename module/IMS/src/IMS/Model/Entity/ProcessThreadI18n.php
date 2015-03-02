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

class ProcessThreadI18n {
    
    protected $lang;
    protected $id;
    protected $value;
    protected $mission;
    protected $scope;
    protected $rich_content;
   
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
    
    function getLang() {
        return $this->lang;
    }

    function getId() {
        return $this->id;
    }

    function getValue() {
        return $this->value;
    }

    function getMission() {
        return $this->mission;
    }

    function getScope() {
        return $this->scope;
    }

    function getRich_content() {
        return $this->rich_content;
    }

    function setLang($lang) {
        $this->lang = $lang;
        return $this;
    }

    function setId($id) {
        $this->id = $id;
        return $this;
    }

    function setValue($value) {
        $this->value = $value;
        return $this;
    }

    function setMission($mission) {
        $this->mission = $mission;
        return $this;
    }

    function setScope($scope) {
        $this->scope = $scope;
        return $this;
    }

    function setRich_content($rich_content) {
        $this->rich_content = $rich_content;
        return $this;
    }



}
