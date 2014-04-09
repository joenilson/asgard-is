/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.AuditType', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.AuditType',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'ims/getaudittype',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});