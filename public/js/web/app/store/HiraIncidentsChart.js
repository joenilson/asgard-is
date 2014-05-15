/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraIncidentsChart', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.HiraIncidentsList',
    proxy: {
        type: 'ajax',
        url: 'ims/hirailistchart',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});

