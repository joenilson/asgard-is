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
Ext.define('Asgard.lib.forms.docsChangeRequest',{
    extend: 'Ext.form.Panel',
    method: 'post',
    frame: false,
    url: 'ims/requestchange',
    bodyPadding: '5 5 0',
    width: 450,
    baseParams: { module: 'imscr' },
    fieldDefaults: { 
        msgTarget: 'side',
        labelWidth: 150,
        labelAlign: 'top'
    },
    defaults: {
        anchor: '100%'
    },
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
    petitionerFieldText: 'Petitioner\'s Name' ,
    emailFieldText: 'Email',
    documentFieldText: 'Proposed Document',
    documentFieldEmptyText: 'Choose a document',
    requestFieldText: 'Change Reason',
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    
    petitionerFieldValue: '' ,
    emailFieldValue: '',
    documentFieldValue: '',
    requestFieldValue: '',
    
    petitionerField: undefined,
    emailField: undefined,
    documentField: undefined,
    requestField: undefined,
    
    submitButton: undefined,
    cancelButton: undefined,
    
    initComponent: function(){
        var me = this;
        this.petitionerField = this.petitionerField || [];
        this.petitionerField = Ext.Object.merge({
            fieldLabel: this.petitionerFieldText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'petitioner',
            anchor: '100%',
            allowBlank:false,
            value: this.petitionerFieldValue
        }, this.petitionerField);
        
        this.emailField = this.emailField || [];
        this.emailField = Ext.Object.merge({
            fieldLabel: this.emailFieldText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'email',
            vtype: 'email',
            anchor: '100%',
            allowBlank:false,
            value: this.emailFieldValue
        }, this.emailField);
        
        this.documentField = this.documentField || [];
        this.documentField = Ext.Object.merge({
            fieldLabel: this.documentFieldText,
            afterLabelTextTpl: this.required,
            allowBlank:false,
            xtype: 'filefield',
            emptyText: this.documentFieldEmptyText,
            name: 'change_doc',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'application/pdf'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'upload-icon'
            }
        }, this.documentField);
        
        this.requestField = this.requestField || [];
        this.requestField = Ext.Object.merge({
            fieldLabel: this.requestFieldText,
            afterLabelTextTpl: this.required,
            xtype: 'htmleditor',
            name: 'request_info',
            anchor: '100%',
            allowBlank:false,
            height: 200,
        }, this.requestField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'request',
                type: 'button',
                itemId: 'request',
                scope: me,
                handler: fnSubmit
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
        this.items = this.items.concat([this.petitionerField, this.emailField, this.documentField, this.requestField]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);
        
        this.callParent();
    }
});