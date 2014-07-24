/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Audits', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Audits',
    proxy: {
        type: 'ajax',
        url: 'ims/getaudits',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});