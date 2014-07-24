Ext.define('Asgard.store.Users', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.Users',
    autoload: false,
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
	method: 'post',
        url: 'admin/users/getusers',
	extraParams: { 
	  module: 'users' 
	},
        reader: {
	  type: 'json',
	  root: 'results'
        }
    }
});