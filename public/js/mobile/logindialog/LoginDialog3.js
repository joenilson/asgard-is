/**
* Ext.ux.LoginDialog Mobile Class for Sencha Touch 2.2.0
*
* @extends Ext.Container
* 
* @version 1.0
*
* @author Joe Nilson Zegarra Galvez (c) 2011 License: MIT
* (http://www.opensource.org/licenses/mit-license.php)
* 
* @date: 20-05-2013
* 
*/
Ext.define('Ext.ux.LoginDialog', {
  extend: 'Ext.Panel',
  alias: 'widget.logindialog',
  
  /*
  * Requirements
  */
  requires: [
    'Ext.form.*',
    'Ext.field.*',
    'Ext.Button',
    'Ext.Toolbar',
    'Ext.data.Store'
  ],
  
  /*
   * Enviroment Variables
   */
  
  usernameText: 'Username',
  passwordText: 'Password',
  languageText: 'Language',
  titleText: 'Login',
  headerText: 'Login',
  noticeText: 'Access to this location is restricted to authorized users only. Please type your username and password.',
  rememberText: 'Remember me on this computer.',
  loginbuttonText: 'Login',
  cancelbuttonText: 'Cancel',
  erroridentityText: 'User not allowed to login...',
  errorcredentialText: "User/Password doesn't match...",
  errorprocessText: 'Unable to log in',
  waitText: 'Please wait...',
  capslockwarningText: '<div class="form-login-warning">Caps Lock is On</div><br />' +
	      '<div>Having Caps Lock on may cause you to enter your password incorrectly.</div><br />' +
	      '<div>You should press Caps Lock to turn it off before entering your password.</div>',
  forgotPasswordLink: '<a href="about:blank" target="_blank">Forgot Password ?</a>',
    
      
  messages: undefined,
  qtips: undefined,

  headerPanel: undefined,
  formPanel: undefined,
  toolbarPanel: undefined,
  
  usernameField: undefined,
  passwordField: undefined,
  languageField: undefined,
  rememberMeField: undefined,

  loginAction: undefined,
  cancelAction: undefined,

  //modal: true,
  //centered: true,
  url: '0',
  config: {
    xtype: 'formpanel',
    waitMsgTarget: true,
    bodyPadding: 10,
    fullscreen: true,
    title: 'Login',
    url: this.url,
    //autoDestroy: false,
  },
  
  constructor: function(config) {
    /*
    Ext.apply(config, {
      items: this.formItems()
    });
    */
    //this.callParent(arguments);
   
    this.headerPanel = this.headerPanel || {};
    this.headerPanel = Ext.Object.merge({
      xtype: 'toolbar',
      docked: 'top',
      layout: { pack: 'center' },
      height: 20,
      title: this.headerText,  
    }, this.headerPanel);
    
    this.usernameField = this.usernameField || {};
    this.usernameField = Ext.Object.merge({
      xtype: 'textfield',
      name: 'username',
      label: this.usernameText,
      autoCapitalize: false
    }, this.usernameField);

    this.passwordField = this.passwordField || {};
    this.passwordField = Ext.Object.merge({
      xtype: 'passwordfield',
      name: 'password',
      label: this.passwordText
    }, this.passwordField);

    this.rememberMeField = this.rememberMeField || {};
    this.rememberMeField = Ext.Object.merge({
      xtype: 'checkboxfield',
      name: 'rememberme',
      label: this.rememberText,
      value: false
    }, this.rememberMeField);

    this.languageField = this.languageField || {};
    this.languageField = Ext.Object.merge({
      xtype: 'selectfield',
      name: 'userlanguage',
      label: this.languageText,
      valueField: 'languageCode',
      displayField: 'languageName',
      /*
      defaultTabletPickerConfig : {
	items: [
	{
	  xtype: 'list',
	  itemTpl: '<tpl for=".">' +
		    '<div class="x-combo-list-item ux-icon-combo-item ' +
		    '{' +this.iconClsField+ '}">' +
		    '{' + this.displayField + '}' +
		    '</div></tpl>';
	  
	}
	]
      },
      */
      /*
      store: new Ext.create('Ext.data.ArrayStore', {
	fields:  ['languageCode', 'languageName', 'countryFlag'],
	data: Ext.LoginDialog.languages
      })
      */
    }, this.languageField);
    this.languageField.store = this.languageField.store || {};
    this.languageField.store = Ext.create('Ext.data.ArrayStore', Ext.applyIf(this.languageField.store, {
      fields: ['languageCode', 'languageName', 'countryFlag'],
      data: Ext.LoginDialog.languages
    }));
    
    this.loginAction = this.loginAction || {};
    this.loginAction = Ext.Object.merge({
      text: this.loginbuttonText,
      xtype: 'button',
      ui: 'confirm',
      scope: this,
      //handler: this.submit
      
      handler: function() {
	var form = this.formPanel;
	console.log(form.getUrl());
	//alert(form.url);
	form.submit({
	  url: form.getUrl(),
	  xtype: 'loadmask',
	  message: 'Validating...',
	  params: { module: 'login' },
	  success: this.onSuccess,
	  failure: this.onFailure
	});
      }
      
    }, this.loginAction);
    
    this.cancelAction = this.cancelAction || {};
    this.cancelAction = Ext.Object.merge({
      text: this.cancelbuttonText,
      // Ensure the scope is 'this' so we have access to the global 'form' instance
      scope: this,
      xtype: 'button',
      handler: function() {
	// Call the form.reset method
	this.form.reset();
      }
    }, this.cancelAction);

    this.toolbarPanel = this.toolbarPanel || {};
    this.toolbarPanel = Ext.Object.merge({
      xtype: 'toolbar',
      docked: 'bottom',
      layout: { pack: 'center' },
      //height: 20,
      items: [
	this.loginAction,
	this.cancelAction
    ]
    }, this.toolbarPanel);
    
    /*
     * 
     * 
    this.formPanel = this.formPanel || {};
    this.formPanel = Ext.create('Ext.form.Panel', Ext.Object.merge({
      bodyPadding: 10,
      //fullscreen: true,
      items: [
	  this.headerPanel,
	  this.usernameField,
	  this.passwordField,
  	  this.rememberMeField,
	  this.languageField,
	  this.toolbarPanel
      ]
    }, this.formPanel));
    */
    
    this.formPanel = this.formPanel || {};
    this.formPanel = Ext.create('Ext.form.Panel', Ext.Object.merge({
      xtype: 'fieldset',
      fullscreen: true,
      defaults: {
	required: true
      },
      items: [
	this.headerPanel,
	this.usernameField,
	this.passwordField,
	this.rememberMeField,
	this.languageField,
	this.toolbarPanel
      ]
    }, this.formPanel));
    
    this.formPanel.setUrl(this.url);
    
    this.items = this.items || [];
    //this.items = this.items.concat([this.headerPanel, this.formPanel, this.toolbarPanel]);
    //this.items = this.items.concat([this.headerPanel, this.formPanel ]);
    //this.items = this.items.concat([this.headerPanel ]);
    this.items = this.items.concat([this.formPanel ]);
    console.log(this.items);
    //this.callParent(arguments);
    this.addEvents ('success', 'failure');
    
    this.callParent(arguments);
    this.initConfig(config);
    //return this;
  },
  
  applyTitle: function(title) {
     if (!Ext.isString(title) || title.length === 0) {
         console.log('Error: Title must be a valid non-empty string');
     }
     else {
         return title;
     }
 },
  
  formItems: function(){
    
    this.headerPanel = this.headerPanel || {};
    this.headerPanel = Ext.Object.merge({
      xtype: 'toolbar',
      docked: 'top',
      layout: { pack: 'center' },
      height: 20,
      title: this.headerText,  
    }, this.headerPanel);
    
    this.usernameField = this.usernameField || {};
    this.usernameField = Ext.Object.merge({
      xtype: 'textfield',
      name: 'username',
      label: this.usernameText,
      autoCapitalize: false
    }, this.usernameField);

    this.passwordField = this.passwordField || {};
    this.passwordField = Ext.Object.merge({
      xtype: 'textfield',
      name: 'password',
      label: this.passwordText
    }, this.passwordField);

    this.rememberMeField = this.rememberMeField || {};
    this.rememberMeField = Ext.Object.merge({
      xtype: 'checkboxfield',
      name: 'rememberme',
      label: this.rememberText,
      value: false
    }, this.rememberMeField);

    this.languageField = this.languageField || {};
    this.languageField = Ext.Object.merge({
      xtype: 'selectfield',
      name: 'userlanguage',
      label: this.languageText,
      valueField: 'languageCode',
      displayField: 'languageName',
      /*
      defaultTabletPickerConfig : {
	items: [
	{
	  xtype: 'list',
	  itemTpl: '<tpl for=".">' +
		    '<div class="x-combo-list-item ux-icon-combo-item ' +
		    '{' +this.iconClsField+ '}">' +
		    '{' + this.displayField + '}' +
		    '</div></tpl>';
	  
	}
	]
      },
      */
      /*
      store: new Ext.create('Ext.data.ArrayStore', {
	fields:  ['languageCode', 'languageName', 'countryFlag'],
	data: Ext.LoginDialog.languages
      })
      */
    }, this.languageField);
    this.languageField.store = this.languageField.store || {};
    this.languageField.store = Ext.create('Ext.data.ArrayStore', Ext.applyIf(this.languageField.store, {
      fields: ['languageCode', 'languageName', 'countryFlag'],
      data: Ext.LoginDialog.languages
    }));
    
    this.loginAction = this.loginAction || {};
    this.loginAction = Ext.Object.merge({
      text: this.loginbuttonText,
      xtype: 'button',
      ui: 'confirm',
      scope: this,
      handler: this.submit
      /*
      handler: function() {
	var form = this.form;
	form.submit({
	  xtype: 'loadmask',
	  message: 'Validating...',
	  params: { module: 'login' },
	  success: this.onSuccess,
	  failure: this.onFailure
	});
      }
      */
    }, this.loginAction);
    
    this.cancelAction = this.cancelAction || {};
    this.cancelAction = Ext.Object.merge({
      text: this.cancelbuttonText,
      // Ensure the scope is 'this' so we have access to the global 'form' instance
      scope: this,
      xtype: 'button',
      handler: function() {
	// Call the form.reset method
	this.form.reset();
      }
    }, this.cancelAction);

    this.toolbarPanel = this.toolbarPanel || {};
    this.toolbarPanel = Ext.Object.merge({
      xtype: 'toolbar',
      docked: 'bottom',
      layout: { pack: 'center' },
      //height: 20,
      items: [
	this.loginAction,
	this.cancelAction
    ]
    }, this.toolbarPanel);
    
    this.formPanel = this.formPanel || {};
    this.formPanel = Ext.create('Ext.form.Panel', Ext.Object.merge({
      /*
      bodyPadding: 10,
      header: false,
      border: false,
      waitMsgTarget: true,
      */
      //waitMsgTarget: true,
      bodyPadding: 10,
      fullscreen: true,
      xtype: 'fieldset',
      //header: false,
      //border: false,
      items: [
	  this.headerPanel,
	  this.usernameField,
	  this.passwordField,
  	  this.rememberMeField,
	  this.languageField,
	  this.toolbarPanel
      ]
    }, this.formPanel));
    
    
    this.items = this.items || [];
    //this.items = this.items.concat([this.headerPanel, this.formPanel, this.toolbarPanel]);
    //this.items = this.items.concat([this.headerPanel, this.formPanel ]);
    //this.items = this.items.concat([this.headerPanel ]);
    //this.items = this.items.concat([this.formPanel ]);
    //console.log(this.items);
    //this.callParent(arguments);
    this.addEvents ('success', 'failure');
    
    
    return this.formPanel;
    //return this.items;
    //return this.callParent(arguments);
  },
  
  submit: function () {
      var form = this.formPanel.getForm();

      if (form.isValid())
      {
	  this.loginAction.disable();
	  if(this.cancelAction instanceof Ext.Button) {
	      this.cancelAction.disable();
	  }
	  this.setErrorMessage('');
	  form.submit({
	      url: form.url,
	      params: { module: 'login' },
	      method: form.method || 'post',
	      waitMsg: form.waitMsg || this.waitText,
	      success: this.onSuccess,
	      failure: this.onFailure,
	      scope: this
	  });
      }
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
  /*
  applyItems: function() {
    //can do anything here to newItems, oldItems doesn't do anything currently
    console.log(arguments);
    return this.callParent(arguments);
  }*/
});