/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.EmployeeOffices', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.EmployeeOffices',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'hcm/getemployeeoffices',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});