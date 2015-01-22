/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SimulationsBrigade', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SimulationsBrigade',
    proxy: {
        type: 'ajax',
        url: 'ims/getsimulationsbrigade',
        reader: {
            type: 'json',
            root: 'images'
        }
    }
});