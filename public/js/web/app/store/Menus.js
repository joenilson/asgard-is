Ext.define('Asgard.store.Menus', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.Menus',
    model: 'Asgard.model.Menus',
    //autoload: false,
    proxy: {
        type: 'ajax',
        url: 'commons/getmenus',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});