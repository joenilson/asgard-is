/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Organigram', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Organigram',
    proxy: {
        type: 'ajax',
        url: 'ims/getorganigram',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});