Ext.define('Asgard.store.Locations', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.Locations',
    model: 'Asgard.model.Locations',
    //autoload: false,
    proxy: {
        type: 'ajax',
        url: 'commons/getlocations',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});