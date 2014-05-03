/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.DrillsMinutes', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.EmergencyPlan',
    proxy: {
        type: 'ajax',
        url: 'ims/getdrillsminutes',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});