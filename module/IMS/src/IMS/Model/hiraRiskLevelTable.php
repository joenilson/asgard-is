<?php 
// module/IMS/src/IMS/Model/hiraRiskLevelTable.php

namespace IMS\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use IMS\Model\Entity\hiraRiskLevel;

class hiraRiskLevelTable extends AbstractTableGateway {
    
    protected $table_name = 'hira_risk_level';
    protected $schema_name = 'ims';
    protected $sequence_name = 'ims.hira_risk_level_id_level_seq';
    protected $sequence_field = 'id_level';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = new Feature\FeatureSet();
        $this->adapter->addFeature(new Feature\SequenceFeature($this->sequence_field,$this->sequence_name));
        $this->adapter = $adapter;
    }
    
    public function fetchAll() {
    	$resultSet = $this->select(function (Select $select) {
    		$select->order('id_level ASC');
    	});
    	return $resultSet->toArray();
    }
    
    public function getHiraRiskLevel($id_level) {
        $resultSet = $this->select(array('id_level' => (int) $id_level));
        $hRL=array();
        if($resultSet->count() > 0)
        {
            for ($index = 0; $index < $resultSet->count(); $index++) {
                $row = $resultSet->current();
                $hRL[] = new hiraRiskLevel(array(
                    'id_level' => $row->id_level,
                    'min_risk' => $row->min_risk,
                    'max_risk' => $row->max_risk,
                    'min_fixtime' => $row->min_fixtime,
                    'max_fixtime' => $row->max_fixtime,
                    'format_fixtime' => $row->format_fixtime,
                    'status' => $row->status
                ));
                $resultSet->next();
            }
            return $hRL;
        }
        else
        {
            return false;
        }
    }
    
    public function saveRiskLevel(hiraRiskLevel $object) {
    	$data = array(
    	    'id_level' => $object->getId_level(),
    	    'min_risk' => $object->getMin_risk(),
    	    'max_risk' => $object->getMax_risk(),
    	    'min_fixtime' => $object->getMin_fixtime(),
    	    'max_fixtime' => $object->getMax_fixtime(),
    	    'format_fixtime' => $object->getFormat_fixtime(),
            'status' => $object->getStatus()
    	);
    
    	$id_level = (int) $object->getId_level();
    
    	if ($id_level == 0) {
    		$data['datecreation'] = date("Y-m-d H:i:s");
    		if (!$this->insert($data))
    			return false;
    		return $this->adapter->getDriver()->getLastGeneratedValue($this->sequence_name);

    	}
    	elseif ($this->getModule($id_level)) {
    		if (!$this->update($data, array('mid' => $id_level)))
    			return false;
    		return $id_level;
    	}
    	else
    		return false;
    }
    
    public function removeModule($id_level) {
        $data['status']=false;
    	return $this->update($data, array('id_level' => (int) $id_level));
    }
    
}