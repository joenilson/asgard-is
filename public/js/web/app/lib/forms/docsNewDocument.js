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

    documentClassText: 'Classif Doc',
    documentTypeText: 'Status',
    documentReviewText: 'Review',
    documentProtectionText: 'Protection',
    documentOwnerText: 'Document Owner',
    documentLocationText: 'Location',
    documentOriginText: 'Origin',
    documentRetentionText: 'Minimal Retention Time',
    documentDescText: 'Document Description',
    documentRecordText: 'Record',
    documentFileText: 'Document',
    
    documentFieldEmptyText: 'Choose a document',
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    
    documentClassField: undefined,
    documentTypeField: undefined,
    documentReviewField: undefined,
    documentProtectionField: undefined,
    documentOwnerField: undefined,
    documentLocationField: undefined,
    documentOriginField: undefined,
    documentDescField: undefined,
    documentRecordField: undefined,
    documentFileField: undefined,
    
    defaults: {
        labelWidth: 180
    },
    anchor: '100%',
    width: 540,
    initComponent: function(){

        this.documentClassField = this.documentClassField || [];
        this.documentClassField = Ext.Object.merge({
            fieldLabel: this.documentClassText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'classification' } }),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var recordField = panel.items.getAt(8).items.getAt(0);
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    //console.log(comboValue);
                    //console.log(combo.store.data.get(comboValue).data.code);
                    //console.log(opts);
                    //console.log(combo.store.getAt(combo.getValue('id')).data.code);
                    var oldValue = recordField.getValue();
                    console.log(recordField.getValue());
                    if(oldValue){
                        recordField.setValue(comboRecord.data.code+'/2');
                    }else{
                        recordField.setValue(comboRecord.data.code+'/');
                    }
                    //console.log();
                    //countriesCombo.store.load({params: {cid: combo.getValue('id')}});
                }
            }
        }, this.documentClassField);

        this.documentTypeField = this.documentTypeField || [];
        this.documentTypeField = Ext.Object.merge({
            fieldLabel: this.documentTypeText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'type' } })
        }, this.documentTypeField);
        
        this.documentReviewField = this.documentReviewField || [];
        this.documentReviewField = Ext.Object.merge({
            fieldLabel: this.documentReviewText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ autoLoad: true, params: { helper: 'review' } })
        }, this.documentReviewField);
        
        this.documentProtectionField = this.documentProtectionField || [];
        this.documentReviewField = Ext.Object.merge({
            fieldLabel: this.documentProtectionText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'protection' } })
        }, this.documentProtectionField);
        
        this.documentOwnerField = this.documentOwnerField || [];
        this.documentOwnerField = Ext.Object.merge({
            fieldLabel: this.documentOwnerText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'protection' } })
        }, this.documentOwnerField);
        
        this.documentLocationField = this.documentLocationField || [];
        this.documentLocationField = Ext.Object.merge({
            fieldLabel: this.documentLocationText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'location' } })
        }, this.documentLocationField);
        
        this.documentOriginField = this.documentOriginField || [];
        this.documentOriginField = Ext.Object.merge({
            fieldLabel: this.documentOriginText,
            xtype: 'docshelpers',
            store: new Ext.create('Asgard.store.DocsHelpers').load({ params: { helper: 'origin' } })
        }, this.documentOriginField);
        
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
            width: 280,
            allowBlank:false
        }, this.documentRecordDynamic);
        
        this.documentRecordField = this.documentRecordField || [];
        this.documentRecordField = Ext.Object.merge({
            xtype: 'textfield',
            name: 'record_1',
            flex: 1,
            allowBlank:false
        }, this.documentRecordField);
        
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
                name: 'apply',
                type: 'button',
                itemId: 'apply',
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
                handler: function() {this.form.reset();}
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
            this.documentOwnerField,
            this.documentLocationField,
            this.documentOriginField,
            this.documentDescField,
            this.innerItems,
            this.documentFileField 
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    }
});