/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Objectives', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Objectives',
    proxy: {
        type: 'ajax',
        url: 'ims/getobjectives',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});