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
Ext.define('Asgard.lib.forms.objdocumentNewObjDocument',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newobjdocument',
    url: 'ims/addobjdocument',

    descriptionText: 'Description',
    fileText: 'Document in PDF',
    fileFieldEmptyText: 'Choose a pdf file',    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',

    warningTitle: 'Warning',
    warningText: 'Document exists!, please remove the old one first',
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
    successText: 'Document added succefully!',
    failureText: 'Something is wrong, please try it again',
    descriptionField: undefined,
    fileField: undefined,
    companiesField: undefined,
    countriesField: undefined,
    locationsField: undefined,
    processField: undefined,
    dateField: undefined,
    companiesValue: '',
    countriesValue: '',
    locationsValue: '',

    typeDocument: '',

    defaults: {
        labelWidth: 180,
        msgTarget: 'qtip'
    },
    anchor: '100%',
    width: 540,
    flex: 1,
    //layout: 'fit',
    initComponent: function(){
        var me = this;
        this.descriptionField = this.descriptionField || [];
        this.descriptionField = Ext.Object.merge({
            fieldLabel: this.descriptionText,
            afterLabelTextTpl: this.required,
            xtype: 'textfield',
            name: 'description',
            anchor: '100%',
            allowBlank:false
        }, this.descriptionField);
       
        this.fileField = this.fileField || [];
        this.fileField = Ext.Object.merge({
            fieldLabel: this.fileText,
            allowBlank:false,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.fileFieldEmptyText,
            name: 'objdocument',
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
        }, this.fileField);        
        
        this.companiesField = this.companiesField || [];
        this.companiesField = Ext.Object.merge({
            xtype: 'companiescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Companies',{ autoLoad: true}),
            listeners:{
                change: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var countriesCombo = panel.items.getAt(1);
                    countriesCombo.store.load({params: {cid: combo.getValue('id')}});
                    if(me.countriesValue !== ''){
                        countriesCombo.setValue(me.countriesValue);
                    }
                }
            }
        }, this.companiesField);
        
        this.countriesField = this.countriesField || [];
        this.countriesField = Ext.Object.merge({
            xtype: 'countriescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Countries'),
            listeners:{
                change: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var locationsCombo = panel.items.getAt(2);
                    var comboValue = combo.getValue();
                    locationsCombo.store.load({params: {cid: combo.getValue('id')}});
                    if(me.locationsValue !== ''){
                        locationsCombo.setValue(me.locationsValue);
                    }
                }
            }
        }, this.countriesField);
        
        this.locationsField = this.locationsField || [];
        this.locationsField = Ext.Object.merge({
            xtype: 'locationscombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Locations')
        }, this.locationsField);
        if(this.typeDocument === 'indicators' || this.typeDocument === 'ieea' || this.typeDocument === 'csi'){
            this.processField = this.processField || [];
            this.processField = Ext.Object.merge({
                xtype: 'processcombo',
                store: new Ext.create('Asgard.store.Process')
            }, this.processField);
        }
        
        if(this.typeDocument !== 'indicators' && this.typeDocument !== 'csi'){
            this.dateField = this.dateField || [];
            this.dateField = Ext.Object.merge({
                xtype: 'yearscombo',
                anchor: '60%'
            }, this.dateField);
        }else{
            this.dateField = this.dateField || [];
            this.dateField = Ext.Object.merge({
                xtype: 'vmonthdatefield',
                anchor: '60%'
            }, this.dateField);
        }
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
            ((this.typeDocument === 'indicators') || (this.typeDocument === 'ieea'))?this.processField:null,
            (this.typeDocument !== 'ieea')?this.dateField:null,
            (this.typeDocument !== 'ieea')?this.descriptionField:null,
            this.fileField
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(button, event) {
        var me = this;
        var form = button.up('panel').getForm();
        var panel = button.up('panel');
        var companyId = panel.items.getAt(0).getValue();
        var countryId = panel.items.getAt(1).getValue();
        var locationId = panel.items.getAt(2).getValue();
        var processId = panel.items.getAt(3).getValue();
        var date = panel.items.getAt(4).getValue();
        
        var view = panel.innerPanel;
        if(form.isValid()){
            form.submit({
                params: {
                    module: 'imsobjdocument',
                    typedoc: me.typeDocument
                },
                success: function(fp, o, m, r) {
                    form.reset();
                    
                    var winActive = Ext.WindowManager.getActive();
                    winActive.hide();
                    view.getStore().load({params: { company: companyId, country: countryId, location: locationId, process: processId, year: date }});
                    Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    }
});