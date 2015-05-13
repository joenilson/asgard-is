/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraHelpers', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraHelpers',
    model: 'Asgard.model.HiraHelpers',
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
        url: 'ims/hiraHelpers',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});