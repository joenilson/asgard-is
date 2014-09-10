Ext.define('Asgard.store.EmployeesDependants', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.EmployeesDependants',
    proxy: {
        type: 'ajax',
        url: 'hcm/getemployeesdependants',
        timeout : 360000, 
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});