Ext.define('Asgard.controller.UserWorkspace', {
    extend: 'Ext.app.Controller',

    //stores: ['UserPreferences'],
    //models: ['UserPreferences'],
    //require: ['Asgard.store.UserPreferences'],
    
    init: function() {
        this.control({
            'viewport > headerbar': {
                render: this.onPanelRendered,
            },
	    'viewport > menubar': {
                render: this.onPanelRendered
            },
	    'viewport > appstatusbar': {
                render: this.onPanelRendered
            },
	    'viewport > contentpanel': {
                render: this.onPanelRendered
            }
        });
    },

    onPanelRendered: function(module) {
        //console.log('The panel '+module.alias+' was rendered');
    },
  
    changeValues: function(module) {
      
    },

});