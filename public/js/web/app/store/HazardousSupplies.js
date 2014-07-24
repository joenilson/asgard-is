/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.HazardousSupplies', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.HazardousSupplies',
    groupField: 'desc_type',
    proxy: {
        type: 'ajax',
        url: 'ims/gethazardoussupplies',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});