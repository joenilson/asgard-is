/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.IsoPlan', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.IsoPlan',
    proxy: {
        type: 'ajax',
        url: 'ims/getisoplan',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});