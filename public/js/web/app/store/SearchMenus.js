Ext.define('Asgard.store.SearchSubmenus', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.Submenus',
    model: 'Asgard.model.Submenus',

    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: 'commons/getsubmenus',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});