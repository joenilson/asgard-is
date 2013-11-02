/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.ProcessMain', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.ProcessMain',
    model: 'Asgard.model.ProcessMain',
    proxy: {
        type: 'ajax',
        url: '/ims/processmainlist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});