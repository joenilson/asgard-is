Ext.define('Asgard.store.Customers', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Customers',
    proxy: {
        type: 'ajax',
        url: 'sales/customerinfo',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});