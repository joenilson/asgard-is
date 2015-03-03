/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.process_io', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.process_io',
    proxy: {
        type: 'ajax',
        url: 'ims/getprocessio',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});