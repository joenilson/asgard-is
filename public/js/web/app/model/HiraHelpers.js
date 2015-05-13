/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraHelpers', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'helper', type: 'string'},
        { name: 'lang', type: 'string'},        
        { name: 'id', type: 'string'},
        { name: 'id_type', type: 'float'},
        { name: 'id_type_desc', type: 'string'},
        { name: 'description', type: 'string'},
        { name: 'description_danger', type: 'string'},
        { name: 'description_risk', type: 'string'},
        { name: 'description_consequence', type: 'string'},
        { name: 'status', type: 'float'},
        { name: 'date_creation', type: 'date', dateFormat: 'c' },
        { name: 'user_id', type: 'string'}
    ],
    idField: 'id_type'
});