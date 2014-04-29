/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.OwnersProfile', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'company', type: 'string' }, 
        {name: 'country', type: 'string' }, 
        {name: 'location', type: 'string' }, 
        {name: 'lang', type: 'string' }, 
        {name: 'id', type: 'float' }, 
        {name: 'profile_desc', type: 'string' }, 
        {name: 'profile_file', type: 'string' }, 
        {name: 'status', type: 'string' },
        {name: 'user_creation', type: 'float' },
        {name: 'date_creation', type: 'date', dateFormat: 'c' },
        {name: 'user_modification', type: 'float' },
        {name: 'date_modification', type: 'date', dateFormat: 'c' }
    ]
});