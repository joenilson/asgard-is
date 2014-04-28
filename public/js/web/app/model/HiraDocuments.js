/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraDocuments', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'id_danger_risk', type: 'float'},
        { name: 'id_danger', type: 'float'},
        { name: 'desc_danger', type: 'string'},
        { name: 'id_risk', type: 'float'},
        { name: 'desc_risk', type: 'string'},
        { name: 'id_process_main', type: 'float'},
        { name: 'process_main_desc', type: 'string'},
        { name: 'process_sup_desc', type: 'string'},
        { name: 'type', type: 'float'},
        { name: 'type_desc', type: 'string'},
        { name: 'eval_iper_h', type: 'float'},
        { name: 'eval_iper_m', type: 'float'},
        { name: 'eval_iper_l', type: 'float'},
        { name: 'control_measures', type: 'string'},
        { name: 'eval_risk_h', type: 'float'},
        { name: 'eval_risk_m', type: 'float'},
        { name: 'eval_risk_l', type: 'float'},
        { name: 'date_creation', type: 'date', dateFormat: 'c' },
        { name: 'user_creation', type: 'string'},
        { name: 'date_modification', type: 'date', dateFormat: 'c'},
        { name: 'user_modification', type: 'string'},
        { name: 'status', type: 'float'},
        { name: 'company', type: 'string'},
        { name: 'country', type: 'string'},
        { name: 'location', type: 'string'},
        { name: 'id_machine', type: 'float' },
        { name: 'id_activity', type: 'float' },
        { name: 'activity_desc', type: 'string' }
    ]
});