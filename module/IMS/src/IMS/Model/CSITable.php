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
use IMS\Model\Entity\CSI;

class CSITable extends AbstractTableGateway {

    protected $table_name = 'customer_satisfaction_index';
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
            $select->order('id_incident ASC');
        });
        return $resultSet->toArray();
    }
    
    public function getCSIByDate($company,$country,$location,$year,$month)
    {
        $row = $this->select(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'cs_year' =>(string) $year, 
                                'cs_month' => $month));
        if (!$row)
            return false;
        return $row->toArray();
    }
    
    public function getCSIByIdDate($company,$country,$location,$cs_indicator,$year,$month)
    {
        $row = $this->select(array('company'=>(string) $company,
                                'country'=>(string) $country,
                                'location'=>(string) $location,
                                'cs_indicator' =>(string) $cs_indicator, 
                                'cs_year' =>(string) $year, 
                                'cs_month' => $month)
                            );
        if (!$row)
            return false;
        return $row->toArray();
    }
   
    public function save(CSI $object)
    {
        $data = array(
            'company' => $object->getCompany(),
            'country' => $object->getCountry(),
            'location' => $object->getLocation(),
            'cs_year' => $object->getCs_year(),
            'cs_month' => $object->getCs_month(),
            'cs_indicator' => $object->getCs_indicator(),
            'cs_final_score'=> $object->getCs_final_score(),
            'date_creation' => $object->getDate_creation(),
            'user_creation' => $object->getUser_creation(),
            'date_modification' => $object->getDate_modification(),
            'user_modification' => $object->getUser_modification()
        );
        
        $year = (string) $object->getCs_year();
        $month = (string) $object->getCs_month();
        $cs_indicator = (int) $object->getCs_indicator();
        $company = (string) $object->getCompany();
        $country = (string) $object->getCountry();
        $location = (string) $object->getLocation();
                
        
        
        if (!$this->getCSIByIdDate($company,$country,$location,$cs_indicator,$year,$month)) {
            if (!$this->insert($data)){
                throw new \Exception('insert statement can\'t be executed');
            }
            return true;
        } elseif ($this->getCSIByIdDate($company,$country,$location,$cs_indicator,$year,$month)) {
            $this->update( $data, 
                    array('company'=> $company,'country'=> $country,'location'=>$location,'cs_indicator' => $cs_indicator, 'cs_year' => $year, 'cs_month' => $month) );
            return true;
        } else {
            throw new \Exception('cs_indicator or cs_year or cs_month in object Customer Satisfaction Index does not exist');
        }
    }

    public function updateCSI($company,$country,$location,$cs_indicator,$year,$month,$data)
    {
        $company = (string) $company;
        $country = (string) $country;
        $location = (string) $location;
        $cs_indicator = (int) $cs_indicator;
        $year = (string) $year;
        $month = (string) $month;
        $this->update($data, array('company'=> $company,'country'=> $country,'location'=>$location,'cs_indicator' => $cs_indicator, 'cs_year' => $year, 'cs_month' => $month));
    }
}
