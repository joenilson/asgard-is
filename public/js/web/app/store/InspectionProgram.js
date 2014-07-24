/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.InspectionProgram', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.InspectionProgram',
    proxy: {
        type: 'ajax',
        url: 'ims/getinspectionprogram',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});