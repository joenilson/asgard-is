/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.DocsLibrary', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.DocsLibrary',
    proxy: {
        type: 'ajax',
        url: '/ims/processdocslist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});