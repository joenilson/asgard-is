/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraDocumentsByThread', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'company', type: 'string'},
        { name: 'country', type: 'string'},
        { name: 'location', type: 'string'},        
        { name: 'id', type: 'float'},
        { name: 'process_main_id', type: 'float'},
        { name: 'process_main_desc', type: 'string'},
        { name: 'process_thread_id', type: 'float'},
        { name: 'process_thread_desc', type: 'string'},
        { name: 'activity', type: 'string' },        
        { name: 'danger_code', type: 'string'},
        { name: 'description_danger', type: 'string'},
        { name: 'description_risk', type: 'string'},
        { name: 'description_consequence', type: 'string'},
        { name: 'danger_frequency', type: 'int'},
        { name: 'danger_severity', type: 'int'},
        { name: 'danger_fxs', type: 'int'},
        { name: 'classification', 
            convert: function(value, record) {
                var classification;
                var val = record.get('danger_fxs');
                if (val < 21) {
                    classification = 'low';
                } else if (val < 37 && val > 20) {
                    classification = 'moderate';
                } else if (val < 55 && val > 36) {
                    classification = 'important';
                } else if ( val > 55 ) {
                    classification = 'critical';
                }
                return classification;
            }
        },
        { name: 'control_measures', type: 'string'},
        { name: 'tracing', type: 'string'},
        { name: 'measurement', type: 'string'},
        { name: 'status', type: 'float'},
        { name: 'date_creation', type: 'date', dateFormat: 'c' },
        { name: 'user_creation', type: 'string'},
        { name: 'date_modification', type: 'date', dateFormat: 'c'},
        { name: 'user_modification', type: 'string'}
    ]
});