/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HiraIncidentsDetails', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.HiraIncidentsDetails',
    model: 'Asgard.model.HiraIncidentsDetails',
    groupField: 'vc_TipoIncidente',
    proxy: {
        type: 'ajax',
        url: '/ims/hiradetails',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});