/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.IsoPlanHelpers', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.IsoPlanHelpers',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/getisoplanhelpers',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});