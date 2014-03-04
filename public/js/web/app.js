Ext.Loader.setConfig({ 
  enabled: true, 
  paths   : {
    Asgard : 'js/web/app'
  } 
});
Ext.setGlyphFontFamily('Pictos');
Ext.application({
    name: 'Asgard',

    paths: {
        'feature': 'js/extjs/features',
        'Asgard': 'js/web/app'
    },
    
    models: ['Menus', 'Submenus'],
    stores: ['SearchSubmenus', 'Menus','UserPreferences','DocsRequest'],
    requires : ['Asgard.view.Viewport','feature.FixedSummary','Asgard.lib.grid.changeRequestQueue'],
    // Define all the controllers that should initialize at boot up of your application
    controllers: [
      'UserWorkspace',
      'Menus',
      'AppTabs'
    ],
    
    autoCreateViewport: false,
    
    launch: function() {
      // This is fired as soon as the page is ready
      storePrefs = Ext.create('Asgard.store.UserPreferences');
      storePrefs.load({
	scope: this,
	callback: function(records, operation, success) {
	  if(success){
	    Asgard.userData = records[0];
	    if (records[0].get('lang') !== 'en'){
	      url = Ext.util.Format.format("js/web/app/locales/app_locale_{0}.js",records[0].get('lang'));
	      url_general = Ext.util.Format.format("js/extjs/locale/ext-lang-{0}.js", records[0].get('lang'));
	    }
	    
	    this.viewport = Ext.create('Asgard.view.Viewport');
	  }
	}
      });
    },
    
    onSuccess: function() {
      console.log('Lang file loaded');
    },
    onFailure: function() {
	Ext.Msg.alert('Failure', 'Failed to load locale file.');
    },
    
    //static variables used throughout the app
    globals: {
      
    }
    
    
});