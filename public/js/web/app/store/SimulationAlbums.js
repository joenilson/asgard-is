/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SimulationAlbums', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SimulationAlbums',
    proxy: {
        type: 'ajax',
        url: 'ims/getdrillsphotos',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});