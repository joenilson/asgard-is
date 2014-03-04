/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraIncidentsType', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraIncidentsType',
    model: 'Asgard.model.HiraIncidentsType',
    proxy: {
        type: 'ajax',
        url: 'ims/hiralit',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});