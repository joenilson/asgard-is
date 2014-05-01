/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Communications', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Communications',
    proxy: {
        type: 'ajax',
        url: 'ims/getcommunications',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});