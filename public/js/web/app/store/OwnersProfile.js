/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.OwnersProfile', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.OwnersProfile',
    proxy: {
        type: 'ajax',
        url: 'ims/getownersprofile',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});