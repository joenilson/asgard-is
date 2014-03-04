/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.ProcessOwner', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.ProcessOwner',
    model: 'Asgard.model.ProcessOwner',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/processownerlist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});