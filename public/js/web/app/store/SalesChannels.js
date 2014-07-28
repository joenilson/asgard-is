/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SalesChannels', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SalesOffices',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'sales/saleschannels',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});