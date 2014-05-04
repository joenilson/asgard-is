/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.RequirementsHelper', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.RequirementsHelper',
    proxy: {
        type: 'ajax',
        url: 'ims/getrequirementshelper',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});