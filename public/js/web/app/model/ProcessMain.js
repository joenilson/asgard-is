/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.ProcessMain', {
    extend: 'Ext.data.Model',
    fields: [
        'lang',
        { name: 'id', type: 'float' },
        { name: 'value', type: 'string' },
        'description',
        'ordering',
        'status',
        'type',
        'parent_id',
        'assignment',
        'company',
        'country',
        'location'
    ]
});