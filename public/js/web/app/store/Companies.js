Ext.define('Asgard.store.Companies', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Companies',
    proxy: {
        type: 'ajax',
        url: '/commons/getcompanies',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});