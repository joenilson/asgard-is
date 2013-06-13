Ext.define('Asgard.store.contentPanel', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.contentPanel',
    model: 'Asgard.model.contentPanel',

    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: '/commons/getcontentpanel',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});