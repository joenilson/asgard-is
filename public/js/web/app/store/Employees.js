Ext.define('Asgard.store.Employees', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Employees',
    proxy: {
        type: 'ajax',
        url: 'hcm/getemployees',
        timeout : 360000, 
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});