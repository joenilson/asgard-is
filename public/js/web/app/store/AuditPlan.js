/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.AuditPlan', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.AuditPlan',
    proxy: {
        type: 'ajax',
        url: 'ims/getauditplan',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});