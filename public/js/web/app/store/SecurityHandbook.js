/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SecurityHandbook', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SecurityHandbook',
    proxy: {
        type: 'ajax',
        url: 'ims/getsecurityhandbook',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});