/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.OHRType', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.OHRType',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/getohrtypes',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});