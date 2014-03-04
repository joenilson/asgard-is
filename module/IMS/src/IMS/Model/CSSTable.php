<?php
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Predicate\Expression;
use IMS\Model\Entity\CSS;

class CSSTable extends AbstractTableGateway {

    protected $table_name = 'customer_satisfaction_scale';
    protected $ht_table_name = 'docs_helpers';
    protected $schema_name = 'ims';

    private function processList($value)
    {
        if(is_array($value)){
            $var_values = "";
            $counterValues = 0;
            foreach ($value as $val)
            {
                $separator = (count($value)==$counterValues)?"":",";
                $var_values+="{$val}".$separator;
            }
        }else{
            $var_values = $value;
        }
        return $var_values;
    }
    
    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('cs_indicator ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getCSRByDate($company,$country,$location,$year)
    {
        $row = $this->select(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'cs_year' =>(string) $year));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getCSRByIdDate($company,$country,$location,$cs_indicator,$year)
    {
        $row = $this->select(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'cs_indicator' =>(string) $cs_indicator, 
                                'cs_year' =>(string) $year)
                            );
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function save(CSR $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'cs_year' => $object->getCs_year(),
            'cs_indicator' => $object->getCs_indicator(),
            'cs_indicator_range' => $object->getCs_indicator_range(),
            'cs_indicator_score' => $object->getCs_indicator_score(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation(),
            'date_modification' => $object->getDate_modification(),
            'user_modification' => $object->getUser_modification()
        );
        
        $year = (string) $object->getCs_year();
        $cs_indicator = (int) $object->getCs_indicator();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
        
        if (!$this->getCSRByIdDate($company,$country,$location,$cs_indicator,$year)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getCSRByIdDate($company,$country,$location,$cs_indicator,$year)) {
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'cs_indicator' => $cs_indicator, 'cs_year' => $year) );
            return true;
        } else {
            throw new \Exception('company or country or location or cs_indicator or cs_year in object Customer Satisfaction Body does not exist');
        }
    }

    public function updateCSR($company,$country,$location,$cs_indicator,$year,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $cs_indicator = (int) $cs_indicator;
        $year = (string) $year;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'cs_indicator' => $cs_indicator, 'cs_year' => $year));
    }
}
