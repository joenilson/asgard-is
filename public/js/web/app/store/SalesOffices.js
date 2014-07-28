/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SalesOffices', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SalesOffices',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'sales/salesoffices',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});