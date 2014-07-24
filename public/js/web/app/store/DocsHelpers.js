/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.DocsHelpers', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.DocsHelpers',
    proxy: {
        type: 'ajax',
        url: 'ims/processdocshelpers',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});