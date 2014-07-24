/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraNCType', {
    extend: 'Ext.data.Model',
    fields: [
        'id'
        ,'lang'
        ,'description'
        ,'code'
        ,'version'
        ,'status'
        ,'date_creation'
        ,'user_creation'
        ,'date_modification'
        ,'user_modification'
    ]
});