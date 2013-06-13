Ext.define('Asgard.model.UserPreferences', {
    extend: 'Ext.data.Model',
    fields: [
    	      { name: 'id', type: 'int', mapping: 'user_id' },
	      'lang',
	      'email',
	      'alias',
	      'alias', 
	      'avatar',
	      'regional',
	      'vacation_from',
	      'vacation_to',
	      'vacation_status',
	      'office_phone',
	      'cell_phone',
	      'home_phone',
	      'other_phone',
	      'fax_phone',
	      'office_ext'
	    ],
    /*
    proxy: {
        type: 'ajax',
        url: '/commons/getsubmodules',
        reader: {
            type: 'json',
            root: 'nodes'
        }
    }
    */
});