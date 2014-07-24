/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.ProcessOwner', {
    extend: 'Ext.data.Model',
    fields: [
        'lang',
        {name: 'id', type: 'float' },
        {name: 'name', type: 'string' },
        'status'
    ]
});