/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraIncidents', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.HiraIncidentsDetails',
    proxy: {
        type: 'ajax',
        url: 'ims/gethiraincidents',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});