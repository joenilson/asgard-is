Ext.define('Asgard.store.rEmployeesGrouped', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.rEmployeesGrouped',
    proxy: {
        type: 'ajax',
        url: 'hcm/getremployeesgrouped',
        timeout : 360000, 
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});