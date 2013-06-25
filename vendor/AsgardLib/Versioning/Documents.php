<?php
/*
 * Asgard  Library for common functions
 * Versioning functions
 * Documents versioning Class
 * With this class we can create a document versioning for documents
 * 
 */

namespace AsgardLib\Versioning;

class Documents {

    protected $_doctype = null;
    protected $_majorversion = null;
    protected $_minorversion = null;
    protected $_correction = null;
    protected $_versioning = null;
    
    public function __construct($doctype = null) {
        $this->setDoctype($doctype);
    }
    
    public function setDoctype($doctype = null){
        $this->_doctype = (string) $doctype; 
        return $this->_doctype;
    }
    
    public function setMajorVersion($majorversion = null){
        $majorversion = ($majorversion == null)?1:$majorversion++;
        $this->_majorversion = (int) $majorversion;
        return $this->_majorversion;
    }
    
    public function setMinorVersion($minorversion = null){
        $minorversion = ($minorversion == null)?0:$minorversion++;
        $this->_minorversion = (int) $minorversion; 
        return $this->_minorversion;
    }
    
    public function setCorrection($correction = null){
        $correction = ($correction == null)?0:$correction++;
        $this->_correction = (int) $correction;
        return $this->_correction;
    }
    
    public function getVersioning($majorversion = null, $minorversion = null, $correction = null){
        $this->_majorversion = $this->setMajorVersion($majorversion);
        $this->_minorversion = $this->setMinorVersion($minorversion); 
        $this->_correction = $this->setCorrection($correction); 
        $this->_versioning = $this->_majorversion . '.' . $this->_minorversion . '.' . $this->_correction;
        return $this->_versioning;
    }
}


