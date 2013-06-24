<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model\Entity;

class ContentText {

    protected $_id_module;
    protected $_id_submodule;
    protected $_lang;
    protected $_content;
    protected $_majorversion;
    protected $_minorversion;
    protected $_correction;
    protected $_date_creation;
    protected $_date_lastmodif;
    
    public function __construct(array $options = null) {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value) {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new \Exception('Invalid module property');
        }
        $this->$method($value);
    }

    public function __get($name) {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new \Exception('Invalid module property');
        }
        return $this->$method();
    }

    public function setOptions(array $options) {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }

    public function setId_module($id_module){
        $this->_id_module = (int) $id_module;
        return $this;
    }
    
    public function getId_module(){
        return $this->_id_module;
    }
    
    public function setId_submodule($id_submodule){
        $this->_id_submodule = (int) $id_submodule;
        return $this;
    }
    
    public function getId_submodule(){
        return $this->_id_submodule;
    }

    public function setLang($lang){
        $this->_lang = (string) $lang;
        return $this;
    }
    
    public function getLang(){
        return $this->_lang;
    }

    public function setContent($content){
        $this->_content = (string) $content;
        return $this;
    }
    
    public function getContent(){
        return $this->_content;
    }
    
    public function setMajorversion($majorversion){
        $this->_majorversion = (int) $majorversion;
        return $this;
    }
    
    public function getMajorversion(){
        return $this->_majorversion;
    }
    
    public function setMinorversion($minorversion){
        $this->_minorversion = (int) $minorversion;
        return $this;
    }
    
    public function getMinorversion(){
        return $this->_minorversion;
    }

    public function setCorrection($correction){
        $this->_correction = (int) $correction;
        return $this;
    }
    
    public function getCorrection(){
        return $this->_correction;
    }

    public function setDate_creation($date_creation){
        $this->_date_creation = (int) $date_creation;
        return $this;
    }
    
    public function getDate_creation(){
        return $this->_date_creation;
    }

    public function setDate_lastmodif($date_lastmodif){
        $this->_date_lastmodif = (int) $date_lastmodif;
        return $this;
    }
    
    public function getDate_lastmodif(){
        return $this->_date_lastmodif;
    }
    
    
}
