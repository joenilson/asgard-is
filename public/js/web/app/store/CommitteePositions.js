/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.CommitteePositions', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.CommitteePositions',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/getcommitteepositions',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});