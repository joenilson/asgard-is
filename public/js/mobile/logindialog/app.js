new Ext.application({
    name: 'MyApp',
    // Setup the icons and startup screens for phones and tablets.
    startupImage: {
        '320x460': 'resources/startup/Default.jpg', // Non-retina iPhone, iPod touch, and all Android devices
        '640x920': 'resources/startup/640x920.png', // Retina iPhone and iPod touch
        '640x1096': 'resources/startup/640x1096.png', // iPhone 5 and iPod touch (fifth generation)
        '768x1004': 'resources/startup/768x1004.png', //  Non-retina iPad (first and second generation) in portrait orientation
        '748x1024': 'resources/startup/748x1024.png', //  Non-retina iPad (first and second generation) in landscape orientation
        '1536x2008': 'resources/startup/1536x2008.png', // : Retina iPad (third generation) in portrait orientation
        '1496x2048': 'resources/startup/1496x2048.png' // : Retina iPad (third generation) in landscape orientation
    },

    isIconPrecomposed: false,
    icon: {
        57: 'resources/icons/icon.png',
        72: 'resources/icons/icon@72.png',
        114: 'resources/icons/icon@2x.png',
        144: 'resources/icons/icon@144.png'
    },

    // Require the components we will be using in this example
    requires: [
        'Ext.form.*',
        'Ext.field.*',
        'Ext.Button',
        'Ext.Toolbar',

        'Ext.data.Store'
    ],
    
    launch: function() {
	  var items = this.getFormItems(),
            config, form;
	    
	  config = {
	      xtype: 'formpanel',
	      url: '/auth/authenticate',
	      items: items
	  };
	  
	  if (Ext.os.deviceType == 'Phone') {
	      form = Ext.Viewport.add(config);
	  } else {
	      // If we are not on a phone, we want to make the formpanel model and give it a fixed with and height.
	      Ext.apply(config, {
		  modal: true,
		  height: '90%',
		  width: '60%',
		  centered: true,

		  // Disable hideOnMaskTap so it cannot be hidden
		  hideOnMaskTap: false
	      });

	      // Add it to the Viewport and show it.
	      form = Ext.Viewport.add(config);
	      form.show();
	  }	
	  this.form = form;
      },
	    
       /**
     * This method returns an array of all items we should add into the form panel we create above in our launch function.
     * We have created this function to simply make things cleaner and easier to read and understand. You could just put these items
     * inline up above in the form `config`.
     * @return {Array} items
     */
    getFormItems: function() {
        return [
	{
	    xtype: 'fieldset',
	    defaults: {
		required: true
            },
            items: [{
		docked: 'top',
		xtype: 'toolbar',
		height: 20,
		title: 'Login'
	    },
	    {
		xtype: 'textfield',
		name: 'username',
		label: 'Username',
		autoCapitalize: false
	    },
	    { 
		xtype: 'passwordfield',
		name:  'password',
		label: 'Password'
	    },
	    { 
		xtype: 'checkboxfield',
		name: 'rememberme',
		label: 'Remember Me',
		value: false
	    },
	    {
		xtype: 'selectfield',
		name: 'userlanguage',
		label: 'Language',
		valueField: 'languageCode',
		displayField: 'languageName',
		store: new Ext.create('Ext.data.ArrayStore', {
		  fields:  ['languageCode', 'languageName', 'countryFlag'],
		  data: Ext.LoginDialog.languages
		})
	    },
	    {
                xtype: 'toolbar',
                docked: 'bottom',
		layout: { pack: 'center' },
                items: [
		// Lets add a load button which will load the formpanel with a User model
		{
		      text: 'Login',
		      ui: 'confirm',
		      scope: this,
		      handler: function() {
			  var form = this.form;

			  // Mask the form
			  /*
			  form.setMasked({
			      xtype: 'loadmask',
			      message: 'Validating...'
			  });
			  */
			  form.submit({
			      xtype: 'loadmask',
			      message: 'Validating...',
			      params: { module: 'login' },
			      success: this.onSuccess,
			      failure: this.onFailure,
			  });

		      }
		  },
		  {
		    text: 'Cancel',

		    // Ensure the scope is 'this' so we have access to the global 'form' instance
		    scope: this,
		    handler: function() {
			// Call the form.reset method
			this.form.reset();
		    }
		  }
		  ]
	    }
	]
	
      }]
    },
    setErrorMessage : function (msg) {
	Ext.Msg.alert(' ',msg);
    },
    onSuccess: function (form, response) {
	responseMessage = response;
	window.location = responseMessage.redirect;
        this.fireEvent('success', this, form, response);
    },

    onFailure: function (form, response) {
	responseMessage = response;
        var msg = responseMessage.message;
        if (response && responseMessage) {
            msg = response.message;
        }
        Ext.Msg.alert(' ',msg);
        //setErrorMessage(msg);

        this.fireEvent('failure', this, form, response);
    }
    
});