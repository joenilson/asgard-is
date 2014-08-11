/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.BrigadePositions', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.BrigadePositions',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/getbrigadepositions',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});