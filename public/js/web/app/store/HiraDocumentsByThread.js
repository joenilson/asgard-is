/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraDocumentsByThread', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraDocumentsByThread',
    model: 'Asgard.model.HiraDocumentsByThread',
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: 'ims/hiraDocsByThread',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});