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
    protected $_type_versioning = null;
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
    
    public function setMajorVersion($majorversion = null, $type_versioning = null){
        switch($type_versioning){
            case "change":
                $majorversion = ($majorversion == null)?1:$majorversion++;
                break;
            case "modification":
                $majorversion = ($majorversion == null)?1:$majorversion;
                break;
            case "correction":
                $majorversion = ($majorversion == null)?1:$majorversion;
                break;
            default:
                $majorversion = ($majorversion == null)?1:$majorversion;
                break;
        }
        $this->_majorversion = (int) $majorversion;
        return $this->_majorversion;
    }
    
    public function getMajorVersion($majorversion = null){
        $this->_majorversion = (int) $majorversion;
        return $this->_majorversion;
    }
    
    public function setMinorVersion($minorversion = null, $type_versioning = null){
        switch($type_versioning){
            case "change":
                $minorversion = ($minorversion == null)?0:$minorversion++;
                break;
            case "modification":
                $minorversion = ($minorversion == null)?0:$minorversion;
                break;
            case "correction":
                $minorversion = ($minorversion == null)?0:$minorversion;
                break;
            default:
                $minorversion = ($minorversion == null)?0:$minorversion;
                break;
        }
        $this->_minorversion = (int) $minorversion;
        return $this->_minorversion;
    }
    
    public function getMinorVersion($minorversion = null){
        $this->_minorversion = (int) $minorversion;
        return $this->_minorversion;
    }

    
    public function setCorrection($correction = null, $type_versioning = null){
        switch($type_versioning){
            case "change":
                $correction = ($correction == null)?0:$correction++;
                break;
            case "modification":
                $correction = ($correction == null)?0:$correction;
                break;
            case "correction":
                $correction = ($correction == null)?0:$correction;
                break;
            default:
                $correction = ($correction == null)?0:$correction;
                break;
        }
        $this->_correction = (int) $correction;
        return $this->_correction;
    }
    
    public function getCorrection($correction = null){
        $this->_correction = (int) $correction;
        return $this->_correction;
    }
    
    public function setVersioning($majorversion = null, $minorversion = null, $correction = null, $type_versioning = null){
        $this->_majorversion = $this->setMajorVersion($majorversion, $type_versioning);
        $this->_minorversion = $this->setMinorVersion($minorversion, $type_versioning);
        $this->_correction = $this->setCorrection($correction, $type_versioning); 
        $this->_versioning = array(
            'majorversion' => $this->_majorversion , 
            'minorversion' =>  $this->_minorversion,
            'correction' =>  $this->_correction);
        return $this->_versioning;
    }
    
    public function getVersioning($majorversion = null, $minorversion = null, $correction = null){
        $this->_majorversion = $this->getMajorVersion($majorversion);
        $this->_minorversion = $this->getMinorVersion($minorversion); 
        $this->_correction = $this->getCorrection($correction); 
        $this->_versioning = $this->_majorversion . '.' . $this->_minorversion . '.' . $this->_correction;
        return $this->_versioning;
    }
}


