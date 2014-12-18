Ext.define('Asgard.store.Employeesr', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Employeesr',
    proxy: {
        type: 'ajax',
        url: 'hcm/getemployeesr',
        timeout : 360000, 
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});