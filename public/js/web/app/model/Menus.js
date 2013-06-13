Ext.define('Asgard.model.Menus', {
    extend: 'Ext.data.Model',
    fields: ['mid', 'mshortdesc', { name: 'iconCls', type: 'string', mapping: 'icon' } , 'typeof', 'loadurl'],
    /*
    proxy: {
        type: 'ajax',
        url: '/commons/getmenus',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
    */
});