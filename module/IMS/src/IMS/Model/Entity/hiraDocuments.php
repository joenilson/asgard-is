<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */

namespace IMS\Model\Entity;

class hiraDocuments {
    
    protected $in_idPeligroRiesgo;
    protected $in_idPeligro;
    protected $in_idRiesgo;
    protected $in_idProc;
    protected $in_EI_A;
    protected $in_EI_M;
    protected $in_EI_B;
    protected $vc_MedidasControl;
    protected $in_ER_A;
    protected $in_ER_M;
    protected $in_ER_B;
    protected $dt_FechaCreacion;
    protected $vc_UsuarioCreacion;
    protected $dt_FechaModificacion;
    protected $vc_UsuarioModificacion;
    protected $in_Estado;
    protected $in_idUbicacion;
    protected $in_idMaquinaria;
   
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
    
    public function getIn_idPeligroRiesgo() {
        return $this->in_idPeligroRiesgo;
    }

    public function setIn_idPeligroRiesgo($in_idPeligroRiesgo) {
        $this->in_idPeligroRiesgo = $in_idPeligroRiesgo;
        return $this;
    }

    public function getIn_idPeligro() {
        return $this->in_idPeligro;
    }

    public function setIn_idPeligro($in_idPeligro) {
        $this->in_idPeligro = $in_idPeligro;
        return $this;
    }

    public function getIn_idRiesgo() {
        return $this->in_idRiesgo;
    }

    public function setIn_idRiesgo($in_idRiesgo) {
        $this->in_idRiesgo = $in_idRiesgo;
        return $this;
    }

    public function getIn_idProc() {
        return $this->in_idProc;
    }

    public function setIn_idProc($in_idProc) {
        $this->in_idProc = $in_idProc;
        return $this;
    }

    public function getIn_EI_A() {
        return $this->in_EI_A;
    }

    public function setIn_EI_A($in_EI_A) {
        $this->in_EI_A = $in_EI_A;
        return $this;
    }

    public function getIn_EI_M() {
        return $this->in_EI_M;
    }

    public function setIn_EI_M($in_EI_M) {
        $this->in_EI_M = $in_EI_M;
        return $this;
    }

    public function getIn_EI_B() {
        return $this->in_EI_B;
    }

    public function setIn_EI_B($in_EI_B) {
        $this->in_EI_B = $in_EI_B;
        return $this;
    }

    public function getVc_MedidasControl() {
        return $this->vc_MedidasControl;
    }

    public function setVc_MedidasControl($vc_MedidasControl) {
        $this->vc_MedidasControl = $vc_MedidasControl;
        return $this;
    }

    public function getIn_ER_A() {
        return $this->in_ER_A;
    }

    public function setIn_ER_A($in_ER_A) {
        $this->in_ER_A = $in_ER_A;
        return $this;
    }

    public function getIn_ER_M() {
        return $this->in_ER_M;
    }

    public function setIn_ER_M($in_ER_M) {
        $this->in_ER_M = $in_ER_M;
        return $this;
    }

    public function getIn_ER_B() {
        return $this->in_ER_B;
    }

    public function setIn_ER_B($in_ER_B) {
        $this->in_ER_B = $in_ER_B;
        return $this;
    }

    public function getDt_FechaCreacion() {
        return $this->dt_FechaCreacion;
    }

    public function setDt_FechaCreacion($dt_FechaCreacion) {
        $this->dt_FechaCreacion = $dt_FechaCreacion;
        return $this;
    }

    public function getVc_UsuarioCreacion() {
        return $this->vc_UsuarioCreacion;
    }

    public function setVc_UsuarioCreacion($vc_UsuarioCreacion) {
        $this->vc_UsuarioCreacion = $vc_UsuarioCreacion;
        return $this;
    }

    public function getDt_FechaModificacion() {
        return $this->dt_FechaModificacion;
    }

    public function setDt_FechaModificacion($dt_FechaModificacion) {
        $this->dt_FechaModificacion = $dt_FechaModificacion;
        return $this;
    }

    public function getVc_UsuarioModificacion() {
        return $this->vc_UsuarioModificacion;
    }

    public function setVc_UsuarioModificacion($vc_UsuarioModificacion) {
        $this->vc_UsuarioModificacion = $vc_UsuarioModificacion;
        return $this;
    }

    public function getIn_Estado() {
        return $this->in_Estado;
    }

    public function setIn_Estado($in_Estado) {
        $this->in_Estado = $in_Estado;
        return $this;
    }

    public function getIn_idUbicacion() {
        return $this->in_idUbicacion;
    }

    public function setIn_idUbicacion($in_idUbicacion) {
        $this->in_idUbicacion = $in_idUbicacion;
        return $this;
    }

    public function getIn_idMaquinaria() {
        return $this->in_idMaquinaria;
    }

    public function setIn_idMaquinaria($in_idMaquinaria) {
        $this->in_idMaquinaria = $in_idMaquinaria;
        return $this;
    }

}
