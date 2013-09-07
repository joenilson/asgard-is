/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraDocuments', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraDocuments',
    model: 'Asgard.model.HiraDocuments',
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: '/ims/hiraDocs',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});