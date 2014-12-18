<?php
namespace Application\Model\Entity;

class Users {
    protected $id;
    protected $username;
    protected $password;
    protected $salt;
    protected $realname;
    protected $role;
    protected $date_created;
    protected $date_lastlogin;
    protected $country;
    protected $company;
    protected $location;
    protected $admin;
    protected $status;
    protected $type;
    protected $account_type;
    protected $type_system;
    protected $id_company;
    protected $id_location;
    protected $id_employee;
    
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
    
    function getId() {
        return $this->id;
    }

    function getUsername() {
        return $this->username;
    }

    function getPassword() {
        return $this->password;
    }

    function getSalt() {
        return $this->salt;
    }

    function getRealname() {
        return $this->realname;
    }

    function getRole() {
        return $this->role;
    }

    function getDate_created() {
        return $this->date_created;
    }

    function getDate_lastlogin() {
        return $this->date_lastlogin;
    }

    function getCountry() {
        return $this->country;
    }

    function getCompany() {
        return $this->company;
    }

    function getLocation() {
        return $this->location;
    }

    function getAdmin() {
        return $this->admin;
    }

    function getStatus() {
        return $this->status;
    }

    function getType() {
        return $this->type;
    }

    function getAccount_type() {
        return $this->account_type;
    }

    function getType_system() {
        return $this->type_system;
    }

    function getId_company() {
        return $this->id_company;
    }

    function getId_location() {
        return $this->id_location;
    }

    function getId_employee() {
        return $this->id_employee;
    }

    function setId($id) {
        $this->id = $id;
        return $this;
    }

    function setUsername($username) {
        $this->username = $username;
        return $this;
    }

    function setPassword($password) {
        $this->password = $password;
        return $this;
    }

    function setSalt($salt) {
        $this->salt = $salt;
        return $this;
    }

    function setRealname($realname) {
        $this->realname = $realname;
        return $this;
    }

    function setRole($role) {
        $this->role = $role;
        return $this;
    }

    function setDate_created($date_created) {
        $this->date_created = $date_created;
        return $this;
    }

    function setDate_lastlogin($date_lastlogin) {
        $this->date_lastlogin = $date_lastlogin;
        return $this;
    }

    function setCountry($country) {
        $this->country = $country;
        return $this;
    }

    function setCompany($company) {
        $this->company = $company;
        return $this;
    }

    function setLocation($location) {
        $this->location = $location;
        return $this;
    }

    function setAdmin($admin) {
        $this->admin = $admin;
        return $this;
    }

    function setStatus($status) {
        $this->status = $status;
        return $this;
    }

    function setType($type) {
        $this->type = $type;
        return $this;
    }

    function setAccount_type($account_type) {
        $this->account_type = $account_type;
        return $this;
    }

    function setType_system($type_system) {
        $this->type_system = $type_system;
        return $this;
    }

    function setId_company($id_company) {
        $this->id_company = $id_company;
        return $this;
    }

    function setId_location($id_location) {
        $this->id_location = $id_location;
        return $this;
    }

    function setId_employee($id_employee) {
        $this->id_employee = $id_employee;
        return $this;
    }


    
}