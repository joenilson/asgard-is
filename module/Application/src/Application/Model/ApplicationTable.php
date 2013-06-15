<?php
namespace Application\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\TableGateway\Feature;
use Zend\Db\Sql\TableIdentifier;
use Zend\Db\Sql\Select;
use Application\Model\Entity\Application;

class ApplicationTable extends AbstractTableGateway {

    protected $table_name = 'application';
    protected $schema_name = 'system';
    protected $sequence_name = 'system.application_app_id_seq';

    public function __construct(Adapter $adapter) {
        $this->table = new TableIdentifier($this->table_name, $this->schema_name);
        $this->adapter = new Feature\FeatureSet();
        $this->adapter->addFeature(new Feature\SequenceFeature('app_id',$this->sequence_name));
        $this->adapter = $adapter;
    }

    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
            $select->order('app_id ASC');
        });
        return $resultSet->toArray();
    }

    public function getApplicationById($id) {
        $row = $this->select(array('app_id' => $id))->toArray();
        if (!$row)
            return false;
        return $row;
    }

    public function save(Application $app)
    {
        $data = array(
            'app_id' => $app->getApp_id(),
            'app_name' => $app->getApp_name(),
            'app_codename' => $app->getApp_codename(),
            'app_moajorversion' => $app->getApp_majorversion(),
            'app_minorversion' => $app->getApp_minorversion(),
            'app_patch' => $app->getApp_patch(),
            'app_build' => $app->getApp_build(),
            'app_date_begin' => $app->getApp_date_begin(),
            'app_timezone' => $app->getApp_timezone(),
            'app_status' => $app->getApp_status(),
            'app_module_default' => $app->getApp_module_default()
        );

        $app_id = (int) $app->app_id;
        if ($app_id == 0) {
            if (!$this->insert($data))
                return false;
            return $this->adapter->getDriver()->getLastGeneratedValue($this->sequence_name);
        } elseif ($this->getApplicationById($app_id)) {
            $this->update(
                $data,
                array('app_id' => $app_id,)
            );
            return $app_id;
        } else {
            throw new \Exception('id object does not exist');
        }
    }

    public function updateById($app_id,$data)
    {
        $app_id = (int) $app_id;
        $this->update($data, array('app_id' => $app_id));
    }
}