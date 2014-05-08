/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.MTM', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.MTM',
    groupField: 'desc_type',
    proxy: {
        type: 'ajax',
        url: 'ims/getmtm',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});