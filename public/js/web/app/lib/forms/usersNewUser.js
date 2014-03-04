/* 
 * Copyright (C) 2013 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.forms.usersNewUser',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newuser',
    url: 'admin/users/createuser',

    usernameText: 'Username',
    passwordText: 'Password',
    realnameText: 'Realname',
    emailText: 'Email',
    adminText: 'Is Admin?',
    langText: 'Language',
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    warningTitle: 'Warning',
    warningText: 'Username exists!, chooser another username',
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
   
    usernameField: undefined,
    passwordField: undefined,
    realnameField: undefined,
    emailField: undefined,
    adminField: undefined,
    companiesField: undefined,
    countriesField: undefined,
    locationsField: undefined,
    langField: undefined,
    usersList: undefined,
    defaults: {
        labelWidth: 180,
        msgTarget: 'qtip'
    },
    anchor: '100%',
    width: 540,
    
    initComponent: function(){
        
        var users = new Ext.create('Asgard.store.Users');
        this.usernameField = this.usernameField || [];
        this.usernameField = Ext.Object.merge({
            fieldLabel: this.usernameText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'username',
            anchor: '100%',
            listeners:{
                change: function(field, valueForm, other) {
                    users.clearFilter();
                    users.load();
                    scope: this;
                    var match = users.find( "username", valueForm, 0, false, false, true );
                    me = field.up('form');
                    if(match>-1){
                        Ext.MessageBox.alert(me.warningTitle, me.warningText);
                    }
                }
            },
            allowBlank:false
        }, this.usernameField);
        
        this.passwordField = this.passwordField || [];
        this.passwordField = Ext.Object.merge({
            fieldLabel: this.passwordText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'password',
            anchor: '100%',
            inputType: 'password',
            allowBlank:false
        }, this.passwordField);
        
        this.realnameField = this.realnameField || [];
        this.realnameField = Ext.Object.merge({
            fieldLabel: this.realnameText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'realname',
            anchor: '100%',
            allowBlank:false
        }, this.realnameField);
        
        this.emailField = this.emailField || [];
        this.emailField = Ext.Object.merge({
            fieldLabel: this.emailText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'email',
            vtype: 'email',
            anchor: '100%',
            allowBlank:false
        }, this.emailField);
        
        this.adminField = this.adminField || [];
        this.adminField = Ext.Object.merge({
            fieldLabel: this.adminText,
            afterLabelTextTpl: this.required,
            xtype: 'checkboxfield',
            name: 'admin'
        }, this.adminField);
        
        this.langField = this.langField || [];
        this.langField = Ext.Object.merge({
            fieldLabel: this.langText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'lang',
            anchor: '100%',
            allowBlank:false
        }, this.langField);
        
        this.companiesField = this.companiesField || [];
        this.companiesField = Ext.Object.merge({
            xtype: 'companiescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Companies',{ autoLoad: true}),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var countriesCombo = panel.items.getAt(1);
                    countriesCombo.store.load({params: {cid: combo.getValue('id')}});
                }
            }
        }, this.companiesField);
        
        this.countriesField = this.countriesField || [];
        this.countriesField = Ext.Object.merge({
            xtype: 'countriescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Countries'),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var locationsCombo = panel.items.getAt(2);
                    var languageField = panel.items.getAt(8);
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    locationsCombo.store.load({params: {cid: combo.getValue('id')}});
                    languageField.setValue(comboRecord.data.locale);
                }
            }
        }, this.countriesField);
        
        this.locationsField = this.locationsField || [];
        this.locationsField = Ext.Object.merge({
            xtype: 'locationscombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Locations')
        }, this.locationsField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'apply',
                type: 'button',
                itemId: 'apply',
                scope: me,
                handler: this.fnSubmit
            }, this.submitButton);

        this.cancelButton = this.cancelButton || []; 
        this.cancelButton = Ext.Object.merge({
                text: this.textCancelButton,
                name: 'cancel',
                type: 'button',
                itemId: 'cancel',
                scope: me,
                handler: function(button) { button.up('panel').getForm().reset(); }
            }, this.cancelButton);
        
        this.items = this.items || [];
        this.items = this.items.concat([
            this.companiesField,
            this.countriesField,
            this.locationsField,
            this.usernameField,
            this.passwordField,
            this.realnameField,
            this.emailField,
            this.adminField,
            this.langField
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(button, event) {
        var form = button.up('panel').getForm();
        if(form.isValid()){
            form.submit({
                params: {
                    module: 'sysnu'
                },
                success: function(fp, o, m, r) {
                form.reset();
                Ext.Msg.alert('Success', o.result.msg);
            },
            failure: function(fp, o, u){
                Ext.Msg.alert('Failure', o.result.msg);
            }
            });
        }
    }
});