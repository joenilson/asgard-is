/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SimulationPhotos', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SimulationPhotos',
    proxy: {
        type: 'ajax',
        url: 'ims/getalbumphotos',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});