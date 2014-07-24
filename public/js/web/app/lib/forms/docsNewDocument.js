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
Ext.define('Asgard.lib.forms.docsNewDocument',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newdocument',
    url: 'ims/newdocument',
    documentClassText: 'Classif Doc',
    documentTypeText: 'Status',
    documentReviewText: 'Review',
    documentProtectionText: 'Protection',
    documentProcessText: 'Process',
    documentThreadText: 'Thread',
    documentOwnerText: 'Document Owner',
    documentLocationText: 'Location',
    documentOriginText: 'Origin',
    documentRetentionText: 'Minimal Retention Time',
    documentDescText: 'Document Description',
    documentRecordText: 'Record',
    documentDVText: 'Date Version',
    documentDRText: 'Date Revision',
    documentFileText: 'Document',
    baseParams: { module: 'imsnd' },
    documentFieldEmptyText: 'Choose a document',
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    
    documentClassField: undefined,
    documentTypeField: undefined,
    documentReviewField: undefined,
    documentProtectionField: undefined,
    documentProcessField: undefined,
    documentOwnerField: undefined,
    documentLocationField: undefined,
    documentOriginField: undefined,
    documentRetentionField: undefined,
    documentDescField: undefined,
    documentRecordField: undefined,
    documentDVField: undefined,
    documentDRField: undefined,
    documentFileField: undefined,
    
    defaults: {
        labelWidth: 180
    },
    anchor: '100%',
    width: 540,
    initComponent: function(){
        var me = this;
        this.documentClassField = this.documentClassField || [];
        this.documentClassField = Ext.Object.merge({
            fieldLabel: this.documentClassText,
            xtype: 'docshelpers',
            name: 'doc_class',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'classification' } }),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var recordField = panel.items.getAt(10).items.getAt(0);
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    var oldValue = recordField.getValue();
                    var newValue = '';
                    if(oldValue){
                        if (comboRecord.data.code){
                            var comboRecordSplit = comboRecord.data.code.split('/');
                            var partsValue = oldValue.split('/');
                            partsValue[0]=comboRecordSplit[0];
                            partsValue[1]=comboRecordSplit[1];
                            var newValue = "";
                            for (var i=0;i<partsValue.length;i++)
                            {
                                var lastLine = ( i+1 === partsValue.length ? "" : "/" );
                                newValue = newValue.concat(partsValue[i],lastLine);
                            }
                        }
                        recordField.setValue(newValue);
                        
                    }else{
                        recordField.setValue(comboRecord.data.code);
                    }
                }
            }
        }, this.documentClassField);

        this.documentTypeField = this.documentTypeField || [];
        this.documentTypeField = Ext.Object.merge({
            fieldLabel: this.documentTypeText,
            xtype: 'docshelpers',
            name: 'doc_type',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'type' } })
        }, this.documentTypeField);
        
        this.documentReviewField = this.documentReviewField || [];
        this.documentReviewField = Ext.Object.merge({
            fieldLabel: this.documentReviewText,
            xtype: 'docshelpers',
            name: 'doc_review',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ autoLoad: true, params: { helper: 'review' } })
        }, this.documentReviewField);
        
        this.documentProtectionField = this.documentProtectionField || [];
        this.documentProtectionField = Ext.Object.merge({
            fieldLabel: this.documentProtectionText,
            xtype: 'docshelpers',
            name: 'doc_protection',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'protection' } })
        }, this.documentProtectionField);

        this.documentProcessField = this.documentProcessField || [];
        this.documentProcessField = Ext.Object.merge({
            fieldLabel: this.documentProcessText,
            xtype: 'processcombo',
            name: 'doc_process',
            store: new Ext.create('Asgard.store.Process'),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var recordField = panel.items.getAt(10).items.getAt(0);
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    var oldValue = recordField.getValue();
                    var newValue = '';
                    if(oldValue){
                        var partsValue = oldValue.split('/');
                        if (comboRecord.data.code){
                            partsValue[2]=comboRecord.data.code;
                        }else{
                            partsValue.splice(2,1);
                        }
                        var newValue = "";
                        for (var i=0;i<partsValue.length;i++)
                        {
                            var lastLine = ( i+1 === partsValue.length ? "" : "/" );
                            newValue = newValue.concat(partsValue[i],lastLine);
                        }
                        recordField.setValue(newValue);
                    }
                }
            }
        }, this.documentProcessField);
        
        this.documentOwnerField = this.documentOwnerField || [];
        this.documentOwnerField = Ext.Object.merge({
            fieldLabel: this.documentOwnerText,
            xtype: 'ownerscombo',
            name: 'doc_owner',
            store: new Ext.create('Asgard.store.ProcessOwner')
        }, this.documentOwnerField);
        
        this.documentLocationField = this.documentLocationField || [];
        this.documentLocationField = Ext.Object.merge({
            fieldLabel: this.documentLocationText,
            xtype: 'docshelpers',
            name: 'doc_location',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'location' } })
        }, this.documentLocationField);
        
        this.documentOriginField = this.documentOriginField || [];
        this.documentOriginField = Ext.Object.merge({
            fieldLabel: this.documentOriginText,
            xtype: 'docshelpers',
            name: 'doc_origin',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'origin' } })
        }, this.documentOriginField);

        this.documentRetentionField = this.documentRetentionField || [];
        this.documentRetentionField = Ext.Object.merge({
            fieldLabel: this.documentRetentionText,
            xtype: 'docshelpers',
            name: 'doc_retention',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'retention' } })
        }, this.documentRetentionField);

        
        this.documentDescField = this.documentDescField || [];
        this.documentDescField = Ext.Object.merge({
            fieldLabel: this.documentDescText,
            xtype: 'textfield',
            name: 'description',
            anchor: '100%',
            allowBlank:false
        }, this.documentDescField);
        
        this.documentRecordDynamic = this.documentRecordDynamic || [];
        this.documentRecordDynamic = Ext.Object.merge({
            fieldLabel: this.documentRecordText,
            xtype: 'textfield',
            name: 'record_0',
            readOnly: true,
            width: 350,
            allowBlank:true
        }, this.documentRecordDynamic);
        
        this.documentRecordField = this.documentRecordField || [];
        this.documentRecordField = Ext.Object.merge({
            xtype: 'textfield',
            name: 'record_1',
            flex: 1,
            allowBlank:false
        }, this.documentRecordField);
        
        this.documentDVField = this.documentDVField || [];
        this.documentDVField = Ext.Object.merge({
            fieldLabel: this.documentDVText,
            xtype: 'vdatefield',
            name: 'date_version',
            width: 350,
            allowBlank:false
        }, this.documentDVField);
        
        this.documentDRField = this.documentDRField || [];
        this.documentDRField = Ext.Object.merge({
            fieldLabel: this.documentDRText,
            xtype: 'vdatefield',
            name: 'date_revision',
            width: 350,
            allowBlank:true
        }, this.documentDRField);
        
        this.documentFileField = this.documentFileField || [];
        this.documentFileField = Ext.Object.merge({
            fieldLabel: this.documentFileText,
            allowBlank:false,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.documentFieldEmptyText,
            name: 'new_doc',
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
        }, this.documentFileField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'add',
                type: 'button',
                itemId: 'add',
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
        
        this.innerItems = Ext.Object.merge({
            layout: 'hbox',
            flex: 1,
            anchor: '100%',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.documentRecordDynamic,
                this.documentRecordField
            ]
        },this.innerItems);
        
        this.items = this.items || [];
        this.items = this.items.concat([
            this.documentClassField,
            this.documentTypeField, 
            this.documentReviewField, 
            this.documentProtectionField,
            this.documentProcessField,
            this.documentOwnerField,
            this.documentLocationField,
            this.documentOriginField,
            this.documentRetentionField,
            this.documentDescField,
            this.innerItems,
            this.documentDVField,
            this.documentDRField,
            this.documentFileField 
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    }
});