/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Process', {
    extend: 'Ext.data.Store',
    autoLoad: true,
    model: 'Asgard.model.ProcessMain',
    proxy: {
        type: 'ajax',
        url: 'ims/processlist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});