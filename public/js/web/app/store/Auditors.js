/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Auditors', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Auditors',
    proxy: {
        type: 'ajax',
        url: 'ims/getauditors',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});