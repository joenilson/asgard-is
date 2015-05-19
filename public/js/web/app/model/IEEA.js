/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.IEEA', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'company', type: 'string' },
        { name: 'country', type: 'string' },
        { name: 'location', type: 'string' },
        { name: 'id', type: 'float' },
        { name: 'eval_date', type: 'string' },
        { name: 'eval_team', type: 'string' },
        { name: 'id_process', type: 'float' },
        { name: 'desc_process', type: 'string' },
        { name: 'id_thread', type: 'float' },
        { name: 'desc_thread', type: 'string' },
        { name: 'aspect_code', type: 'string' },
        { name: 'description', type: 'string' },
        { name: 'description_impact', type: 'string' },
        { name: 'aspect_legal_requirement', type: 'string' },
        { name: 'normal_condition', type: 'boolean' },
        { name: 'abnormal_condition', type: 'boolean' },
        { name: 'emergency_condition', type: 'boolean' },
        { name: 'magnitude', type: 'integer' },
        { name: 'severity', type: 'integer' },
        { name: 'consequence', type: 'integer' },
        { name: 'probability', type: 'integer' },
        { name: 'significance', type: 'integer' },
        { name: 'significant', type: 'boolean' },
        { name: 'legal_requirement', type: 'boolean' },
        { name: 'operational_control', type: 'string' },
        { name: 'goal', type: 'string' },
        { name: 'emergency_plan', type: 'string' },
        { name: 'tracing', type: 'string' },
        { name: 'measurement', type: 'string' },
        { name: 'status', type: 'string' },
        { name: 'user_creation', type: 'int' },
        { name: 'date_creation', type: 'date', dateFormat: 'c' },
        { name: 'user_modification', type: 'int' },
        { name: 'date_modification', type: 'date', dateFormat: 'c' }
    ]
});