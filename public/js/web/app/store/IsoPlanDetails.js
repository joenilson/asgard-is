/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.IsoPlanDetails', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.IsoPlanDetails',
    groupField: 'desc_thread',
    proxy: {
        type: 'ajax',
        url: 'ims/getisoplandetails',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});