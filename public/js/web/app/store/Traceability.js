/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Traceability', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Traceability',
    proxy: {
        type: 'ajax',
        url: 'ims/gettraceability',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});