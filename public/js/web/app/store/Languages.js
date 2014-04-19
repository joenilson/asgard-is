Ext.define('Asgard.store.Languages', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.Languages',
    model: 'Asgard.model.Languages',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'commons/getlanguages',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});