/**
* Ext.ux.LoginDialog Class
*
* @extends Ext.window.Window
* @version 1.1
*
* @author Sumit Madan (c) 2011 License: MIT
* (http://www.opensource.org/licenses/mit-license.php)
* 
* @version 1.2
* @author Joe Nilson Zegarra Galvez joenilson (at) gmail (dot) com
* 
* @modified: 17-05-2013
* 
* @added localization to English, Spanish, French and Portuguese
* @added navigator language detection
* @added flags icons in image folder
* 
* @removed forgotPassword, maintained in commented block.
* 
* @modified IconCombo to work with Ext 4.2.0
* 
*/

Ext.define('Ext.ux.LoginDialog', {
    extend: 'Ext.window.Window',
    requires: ['Ext.layout.container.Border', 'Ext.form.Panel', 'Ext.form.field.Checkbox', 'Ext.ux.form.IconCombo'],
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

    
    
    cls: 'form-login-dialog',
    iconCls: 'form-login-icon-title',
    width: 420,
    height: 280,
    resizable: false,
    closable: false,
    draggable: true,
    modal: false,
    closeAction: 'hide',
    layout: 'border',
    title: 'Login',

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

    initComponent: function() {
        var config = {};
        Ext.applyIf(this, Ext.apply(this.initialConfig, config));

        this.messages = this.messages || {};
        this.messages = Ext.Object.merge({
            loginfailed: this.errorprocessText,
            wait: this.waitText,
            header: this.noticeText
        }, this.messages);

        this.qtips = this.qtips || {};
        this.qtips = Ext.Object.merge({
            rememberme: this.rememberText,
            capslockwarning: this.capslockwarningText
        }, this.qtips);


        this.headerPanel = this.headerPanel || {};
        this.headerPanel = Ext.create('Ext.panel.Panel', Ext.Object.merge({
            cls: 'form-login-header',
            baseCls: 'x-plain',
            html: this.messages.header,
            region: 'north',
	    border: false,
            height: 80
        }, this.headerPanel));

        this.usernameField = this.usernameField || {};
        this.usernameField = Ext.Object.merge({
            xtype: 'textfield',
            ref: 'usernameField',
            name: 'username',
            fieldLabel: this.usernameText,
            validateOnBlur: false,
            allowBlank: false
        }, this.usernameField);

        this.passwordField = this.passwordField || {};
        this.passwordField = Ext.Object.merge({
            xtype: 'textfield',
            ref: 'passwordField',
            inputType: 'password',
            name: 'password',
            fieldLabel: this.passwordText,
            width: 300,
            validateOnBlur: false,
            allowBlank: false,
            enableKeyEvents: true,
            listeners: {
                render: {
                    fn:function(field, eOpts) {
                        field.capsWarningTooltip = Ext.create('Ext.tip.ToolTip', {
                            target: field.bodyEl,
                            anchor: 'top',
                            width: 305,
                            html: this.qtips.capslockwarning
                        });

                        // disable to tooltip from showing on mouseover
                        field.capsWarningTooltip.disable();
                    },
                    scope:this
                },

                keypress: {
                    fn: function(field, e, eOpts) {
                        var charCode = e.getCharCode();
                        if((e.shiftKey && charCode >= 97 && charCode <= 122) ||
                            (!e.shiftKey && charCode >= 65 && charCode <= 90)) {

                            field.capsWarningTooltip.enable();
                            field.capsWarningTooltip.show();
                        }
                        else {
                            if(field.capsWarningTooltip.hidden === false) {
                                field.capsWarningTooltip.disable();
                                field.capsWarningTooltip.hide();
                            }
                        }
                    },
                    scope: this
                },

                blur: function(field) {
                    if(field.capsWarningTooltip.hidden === false) {
                        field.capsWarningTooltip.hide();
                    }
                }
            }
        }, this.passwordField);
	/*
	 * Only activate if do you need automated password recovery.
	 * But for an app like this that uses sensitive information is better to validate
	 * the password with the user.
	 * 
        this.forgotPassword = {
            xtype: 'box',
            autoEl: {
                html: '<div style="font-size:11px; text-align: right; width: 388px;">' + this.forgotPasswordLink + '</div>'
            }
        };
	*/
        this.languageField = this.languageField || {};
        this.languageField = Ext.Object.merge({
            xtype: 'iconcombo',
            name: 'userlanguage',
            fieldLabel: this.languageText,
            valueField: 'languageCode',
            displayField: 'languageName',
            iconClsField: 'countryFlag',
            triggerAction: 'all',
            editable: false,
            mode: 'local'
        }, this.languageField);

        this.languageField.store = this.languageField.store || {};
        this.languageField.store = Ext.create('Ext.data.ArrayStore', Ext.applyIf(this.languageField.store, {
            fields: ['languageCode', 'languageName', 'countryFlag'],
            data: Ext.LoginDialog.languages
        }));

        this.rememberMeField = this.rememberMeField || {};
        this.rememberMeField = Ext.Object.merge({
            xtype: 'checkbox',
            itemId: 'rememberMe',
            name: 'rememberme',
            padding: '0 0 0 110',
            boxLabel: '&#160;' + this.rememberText,
            listeners: {
                render: function(checkbox) {
                    checkbox.bodyEl.child('input').set({
                        'data-qtip': this.qtips.rememberme
                    });
                },
                scope: this
            }
        }, this.rememberMeField);

        this.formPanel = this.formPanel || {};
        this.formPanel = Ext.create('Ext.form.Panel', Ext.Object.merge({
            bodyPadding: 10,
            header: false,
            region: 'center',
            border: false,
            waitMsgTarget: true,
            layout: {
                type: 'vbox',
                align: 'stretch'
            },

            defaults: {
                labelWidth: 105
            },
            items: [
                this.usernameField,
                this.passwordField,
                this.forgotPassword, {
                    xtype: 'box',
                    autoEl: 'div',
                    height: 10
                }, this.languageField,
                this.rememberMeField
            ]
        }, this.formPanel));

        this.loginAction = this.loginAction || {};
        this.loginAction = Ext.Object.merge({
            text: this.loginbuttonText,
            ref: '../loginAction',
            iconCls: 'form-login-icon-login',
            scale: 'small',
            width: 100,
            handler: this.submit,
            scope: this
        }, this.loginAction);

        this.cancelAction = this.cancelAction || {};
        this.cancelAction = Ext.Object.merge({
            text: this.cancelbuttonText,
            ref: '../cancelAction',
            iconCls: 'form-login-icon-cancel',
            scale: 'small',
            width: 100,
            handler: this.cancel,
            scope: this
        }, this.cancelAction);

        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([this.loginAction, this.cancelAction]);

        this.items = this.items || [];
        this.items = this.items.concat([this.headerPanel, this.formPanel]);

        this.keys = this.keys || [];
        this.keys = this.keys.concat([{
            key: [10,13],
            handler: this.submit,
            scope: this
        }]);

        if(this.cancelAction && (this.cancelAction.hidden === undefined || this.cancelAction.hidden === false)) {
            this.keys = this.keys.concat([{
                key: [27],
                handler: this.cancel,
                scope: this
            }]);
        }

        this.callParent(arguments);

        this.addEvents ('success', 'failure');
    },

    onShow: function() {
        this.callParent(arguments);
        this.formPanel.usernameField.focus(true, 300);
    },

    onRender: function() {
        this.callParent(arguments);
    },

    setMessage : function (msg) {
        this.headerPanel.update(msg);
    },

    setErrorMessage : function (msg) {
        var errorNode = Ext.DomQuery.selectNode('span[class=error]', this.headerPanel.getEl().dom);
        if(!errorNode) {
            Ext.DomHelper.insertHtml('beforeEnd',
                Ext.DomQuery.selectNode('div[id^=panel-]:last', this.headerPanel.getEl().dom),
                '<br /><span class="error"></span>');
            errorNode = Ext.DomQuery.selectNode('span[class=error]', this.headerPanel.getEl().dom);
        }
        Ext.get(errorNode).update(msg);
    },

    submit: function () {
        var form = this.formPanel.getForm();
	var d = jstz.determine();
	var timezone = d.name();
        if (form.isValid())
        {
            this.loginAction.disable();
            if(this.cancelAction instanceof Ext.Button) {
                this.cancelAction.disable();
            }
            this.setErrorMessage('');
            form.submit({
                url: form.url,
		params: { module: 'login', client_timezone: timezone },
                method: form.method || 'post',
                waitMsg: form.waitMsg || this.waitText,
                success: this.onSuccess,
                failure: this.onFailure,
                scope: this
            });
        }
    },

    cancel: function() {
        this.hide();
    },

    onSuccess: function (form, action) {
        this.formPanel.passwordField.setRawValue('');
        this.loginAction.enable();
	responseMessage = Ext.decode(action.response.responseText)
        if(this.cancelAction instanceof Ext.Button) {
            this.cancelAction.enable();
        }
        this.hide();
	window.location = responseMessage.redirect;
        this.fireEvent('success', this, form, action);
    },

    onFailure: function (form, action) {
        this.loginAction.enable();
	responseMessage = Ext.decode(action.response.responseText)
        if(this.cancelAction instanceof Ext.Button) {
            this.cancelAction.enable();
        }

        this.formPanel.passwordField.focus(true, 300);

        var msg = responseMessage.message;
        if (action.result && action.result.message) {
            msg = action.result.message;
        }
        this.setErrorMessage (msg);

        this.fireEvent('failure', this, form, action);
    }
});
