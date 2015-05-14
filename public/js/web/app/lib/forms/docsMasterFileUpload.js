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
Ext.define('Asgard.lib.forms.docsMasterFileUpload',{
    extend: 'Ext.form.Panel',
    alias: 'widget.docsmasterfileupload',
    url: 'ims/massdocprocess',

    excelFileText: 'Master File',
    zipFileText: 'Zip File',
    excelFieldEmptyText: 'Choose a Excel File',    
    zipFieldEmptyText: 'Choose a Zip File',    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',

    warningTitle: 'Warning',
    warningText: 'Data incomplete!, revise your data',
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
    successText: 'Documents added succefully!',
    failureText: 'Something is wrong, please try it again',
    excelField: undefined,
    zipField: undefined,
    companiesField: undefined,
    countriesField: undefined,
    locationsField: undefined,
    languageField: undefined,
    companiesValue: '',
    countriesValue: '',
    locationsValue: '',
    typeDoc: '',
    sourceDoc: '',
    bodyPadding: '5 5 5 5',
    defaults: {
        labelWidth: 180,
        msgTarget: 'qtip'
    },
    anchor: '100%',
    width: 540,
    loadingText: 'Uploading Data',
    initComponent: function(){
        var me = this;
        
        this.excelField = this.excelField || [];
        this.excelField = Ext.Object.merge({
            fieldLabel: this.excelFileText,
            allowBlank:true,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.excelFieldEmptyText,
            name: 'excel_file',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'application/vnd.ms-excel'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'uploadexcel-icon'
            }
        }, this.excelField);        
        
        this.zipField = this.zipField || [];
        this.zipField = Ext.Object.merge({
            fieldLabel: this.zipFileText,
            allowBlank:true,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.zipFieldEmptyText,
            name: 'zip_file',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'application/x-zip-compressed'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'uploadzip-icon'
            }
        }, this.zipField);
        
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
        
        this.languageField = this.languageField || [];
        this.languageField = Ext.Object.merge({
            xtype: 'languagecombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Languages')
        }, this.languageField);

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
            this.languageField,
            this.excelField,
            (this.typeDoc !== 'REG' && this.sourceDoc === 'internal')?this.zipField:null
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
        var grid = panel.innerPanel;
        var windowDocs = this.createWindow();
        if(form.isValid()){
            form.submit({
                waitMsg: this.loadingText,
                params: {
                    module: 'imsmassdocsupload',
                    source_doc: me.sourceDoc,
                    type_doc: me.typeDoc
                },
                success: function(fp, o, m, r) {
                    console.log(fp);
                    //console.log(o.response.responseText);
                    var result = Ext.decode(o.response.responseText);
                    console.log(result);

                    windowDocs.setHeight(document.documentElement.clientHeight - 50);
                    windowDocs.setWidth(document.documentElement.clientWidth - 50);
                    //width    : document.documentElement.clientWidth - 50,
                    //height   : document.documentElement.clientHeight - 50,

                    var gridStore = Ext.create('Asgard.store.DocsUpload',{
                       data: result.file_results
                    });
                    gridContent = Ext.create('Asgard.lib.grid.documents_upload',{
                        store: gridStore
                    });
                    windowDocs.add(gridContent);
                    windowDocs.show();
                    //form.reset();
                    //var winActive = Ext.WindowManager.getActive();
                    //winActive.hide();
                    //grid.getStore().load({params: { company: companyId, country: countryId, location: locationId }});
                    //Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    console.log(fp);
                    console.log(o);
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    },
    
    createWindow: function() {
        var windowFileProcess = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowFileProcess;
    },

});