Ext.define('Asgard.model.Users', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'id', type: 'float' },
        { name: 'username', type: 'string' },
        { name: 'realname', type: 'string' },
        { name: 'role', type: 'float' },
        { name: 'date_created', type: 'date', dateFormat: 'Y-m-d H:i:s' },
        { name: 'date_lastlogin', type: 'date', dateFormat: 'Y-m-d H:i:s' },
        { name: 'country', type: 'string' },
        { name: 'country_desc', type: 'string' },
        { name: 'company', type: 'string' },
        { name: 'company_desc', type: 'string' },
        { name: 'location', type: 'string' },
        { name: 'location_desc', type: 'string' },
        { name: 'admin', type: 'string' },
        { name: 'status', type: 'string' },
        { name: 'type', type: 'string' },
        { name: 'account_type', type: 'string' }
    ]
});