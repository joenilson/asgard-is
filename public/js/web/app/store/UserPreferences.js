Ext.define('Asgard.store.UserPreferences', {
    extend: 'Ext.data.Store',
    requires: 'Asgard.model.UserPreferences',
    model: 'Asgard.model.UserPreferences',
    autoload: false,
    // Overriding the model's default proxy
    proxy: {
        type: 'ajax',
	method: 'post',
        url: 'commons/getuserpreferences',
	extraParams: { 
	  module: 'userprefs' 
	},
        reader: {
	  type: 'json',
	  root: 'prefs'
        }
    }
});