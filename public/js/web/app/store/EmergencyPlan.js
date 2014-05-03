/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.EmergencyPlan', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.EmergencyPlan',
    proxy: {
        type: 'ajax',
        url: 'ims/getemergencyplan',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});