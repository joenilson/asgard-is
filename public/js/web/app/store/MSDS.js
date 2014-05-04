/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.MSDS', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.MSDS',
    proxy: {
        type: 'ajax',
        url: 'ims/getmsds',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});