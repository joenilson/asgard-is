/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraIncidentsList', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraIncidentsList',
    model: 'Asgard.model.HiraIncidentsList',
    proxy: {
        type: 'ajax',
        url: '/ims/hirailist',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});