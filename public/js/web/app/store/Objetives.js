/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.Objetives', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Objetives',
    groupField: 'policy',
    proxy: {
        type: 'ajax',
        url: 'ims/getobjetives',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});