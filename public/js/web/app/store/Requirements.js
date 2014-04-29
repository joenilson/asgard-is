/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Requirements', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Requirements',
    proxy: {
        type: 'ajax',
        url: 'ims/getrequirements',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});