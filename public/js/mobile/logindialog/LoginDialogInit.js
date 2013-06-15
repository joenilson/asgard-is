Ext.Loader.setConfig({enabled: true});
	
    var userLang = (navigator.language) ? navigator.language : navigator.userLanguage;
    
    new Ext.application({
      name: 'MyApp',
    
      launch: function() {
	  var extLang = userLang;
	  this.setupLang(extLang);
	  console.log('1 '+extLang);
      },

	setupLang: function(extLang) {
	  if(extLang){
	    url_general = Ext.util.Format.format("/js/extjs/locale/ext-lang-{0}.js", extLang.substring(0,2));
	    url_form = Ext.util.Format.format("/js/commons/logindialog/LoginDialog_{0}.js", extLang.substring(0,2));
	    Ext.Loader.injectScriptElement(url_general, this.onSuccess, this.onFailure, this);
	    Ext.Loader.injectScriptElement(url_form, this.onSuccess, this.onFailure, this);
	    //console.log(url_form);
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
	  console.log('4.1 - inicio setupLogin()');
	  var loginDialog = Ext.create('Ext.ux.LoginDialog', {
	    url: '/auth/authenticate',
	    scope: this,
	    onPainted: function() {
		console.log('onpainted: '+Ext.getCmp('selectfield'));
		Ext.getCmp('selectfield').setOptions([  //use id of select
		    {text: 'Male',  value: 'male'},
		    {text: 'Female', value: 'female'}
		])
	    },
	    languageField: {
	      value: 'Lo que sea',
	      listeners: {
		change: function(selectfield, newValue, oldValue) {
		  var extLang = newValue;
		  console.log(oldValue+' :: '+newValue);
		  this.setupLang(extLang);
		  languageField.setValue(record.get("languageName"));
		},
		scope: this
	      }
	    }

	  });
	  /*
	  loginDialog.languageField.on({
                        scope: this,
                        change: function() {
                            console.log('changed');
                        }
                    });
	  */
	  
	  
	  console.log(Ext.getCmp('selectfield'));
	  console.log(loginDialog.languageField);
	  console.log('3 '+Ext.os.deviceType+' , lang: '+userLang);
	  loginDialog.show();
	}
	
    });
    //loginDialogInit.init();