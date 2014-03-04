/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.DocsRequest', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.DocsRequest',
    proxy: {
        type: 'ajax',
        url: 'ims/processrequestlist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});