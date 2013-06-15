Ext.Loader.setConfig({enabled: true});
    
var userLang = (navigator.language) ? navigator.language : navigator.userLanguage;
Ext.onReady(function() {
    loginDialogInit = (function() {
      return {
	init: function() {
	  Ext.tip.QuickTipManager.init();
	  var extLang = userLang;
	  this.setupLang(extLang);
	},
	setupLang: function(extLang) {
	  if(extLang){
	    url_general = Ext.util.Format.format("/js/extjs/locale/ext-lang-{0}.js", extLang.substring(0,2));
	    url_form = Ext.util.Format.format("/js/commons/logindialog/LoginDialog_{0}.js", extLang.substring(0,2));
	    Ext.Loader.injectScriptElement(url_general, this.onSuccess, this.onFailure, this);
	    Ext.Loader.injectScriptElement(url_form, this.onSuccess, this.onFailure, this);
	    userLang = extLang;
	  }else{
	      this.setupLogin();  
	  }
	},
	onSuccess: function() {
	    this.setupLogin();
	},
	onFailure: function() {
	    Ext.Msg.alert('Failure', 'Failed to load locale file.');
	    this.setupLogin();
	},
	setupLogin: function() {
	  var loginDialog = Ext.create('Ext.ux.LoginDialog', {
	    formPanel: {
		url: '/auth/authenticate',
	    },
	    languageField: {
		value: userLang.substring(0,2),
		listeners: {
		    select: {
			fn: function(cb, records) {
			    var record = records[0];
			    var extLang = record.get("languageCode");
			    this.setupLang(extLang);
			    cb.setValue(record.get("languageName"));
			},
			scope: this
		    }
		}
	    },
	    listeners: {
		      afterrender: function(component, eOpts) {
			  Ext.EventManager.onWindowResize(component.center, component) 
		      },
		      beforeclose: function(component, eOpts) { 
			  Ext.EventManager.removeResizeListener(component.center, component); 
		      }
	    },
	    scope: this
	  });
	  
	  loginDialog.show();
	}
	};
    })();
    loginDialogInit.init();
});