/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraNCType', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraNCType',
    model: 'Asgard.model.HiraNCType',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/hiranctype',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});