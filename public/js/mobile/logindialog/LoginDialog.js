/**
* Ext.ux.LoginDialog Mobile Class for Sencha Touch 2.2.0
*
* @extends Ext.form.Panel
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
  //requires: ['Ext.form.Panel', 'Ext.field.Select', 'Ext.panel.Panel'],
  requires: [
    'Ext.form.*',
    'Ext.field.*',
    'Ext.Button',
    'Ext.Toolbar',

    'Ext.data.Store'
  ],
  //, 'Ext.ux.form.IconCombo'
  alias: 'widget.logindialog',

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

  usernameField: undefined,
  passwordField: undefined,
  languageField: undefined,
  rememberMeField: undefined,

  loginAction: undefined,
  cancelAction: undefined,

  config: {
    name: null
  },

  initialize: function() {
      this.callParent(arguments);
  },
  
  constructor: function(config) {
      
    if(config){
      this.initConfig(config);
    }
    
    this.headerPanel = this.headerPanel || {};
    this.headerPanel = Ext.create('Ext.Panel', Ext.Object.merge({
      docked: 'top',
      xtype: 'toolbar',
      height: 20,
      title: 'Login'  
    }, this.headerPanel));
      
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
      label: 'Remember Me',
      value: false
    }, this.rememberMeField);

    this.languageField = this.languageField || {};
    this.languageField = Ext.Object.merge({
      xtype: 'selectfield',
      name: 'userlanguage',
      label: 'Language',
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
	  
    this.formPanel = this.formPanel || {};
    this.formPanel = Ext.create('Ext.form.Panel', Ext.Object.merge({
      /*
      bodyPadding: 10,
      header: false,
      border: false,
      waitMsgTarget: true,
      */
      layout: {
	  type: 'hbox'
	  //align: 'stretch'
      },
      /*
      defaults: {
	  labelWidth: 105
      },
      */
      items: [
	  this.usernameField,
	  this.passwordField,
	  this.languageField,
	  this.rememberMeField
      ]
    }, this.formPanel));
      
    this.loginAction = this.loginAction || {};
    this.loginAction = Ext.Object.merge({
      text: this.loginbuttonText,
      ui: 'confirm',
      scope: this,
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
    }, this.loginAction);

    this.cancelAction = this.cancelAction || {};
    this.cancelAction = Ext.Object.merge({
      text: this.cancelbuttonText,
      // Ensure the scope is 'this' so we have access to the global 'form' instance
      scope: this,
      handler: function() {
	// Call the form.reset method
	this.form.reset();
      }
	/*
	text: this.cancelbuttonText,
	ref: '../cancelAction',
	iconCls: 'form-login-icon-cancel',
	scale: 'medium',
	width: 90,
	handler: this.cancel,
	scope: this
	*/
    }, this.cancelAction);

    this.buttons = this.buttons || [];
    this.buttons = this.buttons.concat([this.loginAction, this.cancelAction]);

    this.items = this.items || [];
    this.items = this.items.concat([this.headerPanel, this.formPanel]);
    /*
    this.keys = this.keys || [];
    this.keys = this.keys.concat([{
	key: [10,13],
	handler: this.submit,
	scope: this
    }]);
    */  
    this.addEvents ('success', 'failure');

  },
    
  onShow: function() {
      this.callParent(arguments);
      this.formPanel.usernameField.focus(true, 300);
  },

  onRender: function() {
      this.callParent(arguments);
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
