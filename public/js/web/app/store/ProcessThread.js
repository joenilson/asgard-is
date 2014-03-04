/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.ProcessThread', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.ProcessThread',
    model: 'Asgard.model.ProcessThread',
    proxy: {
        type: 'ajax',
        url: 'ims/processthreadlist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});