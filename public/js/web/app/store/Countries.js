Ext.define('Asgard.store.Countries', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.Countries',
    model: 'Asgard.model.Countries',
    //autoload: false,
    proxy: {
        type: 'ajax',
        url: 'commons/getcountries',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});