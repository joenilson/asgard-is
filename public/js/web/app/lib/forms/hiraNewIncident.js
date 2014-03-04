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
Ext.define('Asgard.lib.forms.hiraNewIncident',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newincident',
    url: 'ims/newincident',
    objectRegisterCodeText: 'Register Code',
    objectOwnerText: 'Document Owner',
    objectIncidentTypeText: 'Incident Type',
    objectRegisterNameText: 'Register Name',
    objectRegisterSurnameText: 'Register Surname',
    objectRegisterLastnameText: 'Register Lastname',
    objectRegisterEmailText: 'Register Email',
    objectIncidentDescText: 'Incident Description',
    objectIncidentDateText: 'Date Incident',
    baseParams: { module: 'imsnc' },
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    
    objectRegisterCodeField: undefined,
    objectCompanyField: undefined,
    objectCountryField: undefined,
    objectLocationField: undefined,
    objectNonConformityField: undefined,
    objectProcessTypeField: undefined,
    objectProcessField: undefined,
    objectThreadField: undefined,
    objectOwnerField: undefined,
    objectIncidentTypeField: undefined,
    objectRegisterNameField: undefined,
    objectRegisterSurnameField: undefined,
    objectRegisterLastnameField: undefined,
    objectRegisterEmailField: undefined,
    objectIncidentDescField: undefined,
    objectIncidentDateField: undefined,
    
    defaults: {
        labelWidth: 180
    },
    anchor: '100%',
    width: 540,
    flex: 1,
    autoScroll: true,
    bodyStyle: 'padding: 10px;',
    initComponent: function(){
        
        this.objectRegisterCodeField = this.objectRegisterCodeField || [];
        this.objectRegisterCodeField = Ext.Object.merge({
            fieldLabel: this.objectRegisterCodeText,
            xtype: 'textfield',
            name: 'registerCode',
            anchor: '100%',
            readOnly: false,
            allowBlank:false
        }, this.objectRegisterCodeField);
        
        
        this.objectCompanyField = this.objectCompanyField || [];
        this.objectCompanyField = Ext.Object.merge({
            xtype: 'companiescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Companies',{ autoLoad: true}),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var countriesCombo = panel.getForm().findField('countriesCombo');
                    countriesCombo.store.load({params: {cid: combo.getValue('id')}});
                }
            }
        }, this.objectCompanyField);
        
        this.objectCountryField = this.objectCountryField || [];
        this.objectCountryField = Ext.Object.merge({
            xtype: 'countriescombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Countries'),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var locationsCombo = panel.getForm().findField('locationsCombo');
                    var languageField = panel.items.getAt(8);
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    locationsCombo.store.load({params: {cid: combo.getValue('id')}});
                    languageField.setValue(comboRecord.data.locale);
                }
            }
        }, this.objectCountryField);
        
        this.objectLocationField = this.objectLocationField || [];
        this.objectLocationField = Ext.Object.merge({
            xtype: 'locationscombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.Locations')
        }, this.objectLocationField);

        this.objectNonConformityField = this.objectNonConformityField || [];
        this.objectNonConformityField = Ext.Object.merge({
            xtype: 'nonconformitycombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.HiraNCType'),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var recordField = panel.getForm().findField('registerCode');
                    var comboValue = combo.getValue();
                    var comboRecord = combo.store.data.get(comboValue);
                    recordField.setValue(comboRecord.data.code);
                }
            }
        }, this.objectNonConformityField);


        this.objectProcessField = this.objectProcessField || [];
        this.objectProcessField = Ext.Object.merge({
            fieldLabel: this.objectProcessText,
            xtype: 'processcombo',
            name: 'doc_process',
            store: new Ext.create('Asgard.store.Process'),
            listeners:{
                select: function(combo, records, opts) {
                    var panel = combo.up('panel');
                    var companyCombo = panel.getForm().findField('companiesCombo').getValue();
                    var countryCombo = panel.getForm().findField('countriesCombo').getValue();
                    var locationCombo = panel.getForm().findField('locationsCombo').getValue();
                    var threadCombo = panel.getForm().findField('threadsCombo');
                    threadCombo.store.load({params: {pid: combo.getValue('id'), company: companyCombo, country: countryCombo, location: locationCombo }});
                }
            }
            
        }, this.objectProcessField);


        this.objectThreadField = this.objectThreadField || [];
        this.objectThreadField = Ext.Object.merge({
            fieldLabel: this.objectThreadText,
            xtype: 'threadcombo',
            //name: 'doc_thread',
            store: new Ext.create('Asgard.store.ProcessThread')
        }, this.objectThreadField);
        
        this.objectOwnerField = this.objectOwnerField || [];
        this.objectOwnerField = Ext.Object.merge({
            fieldLabel: this.objectOwnerText,
            xtype: 'ownerscombo',
            name: 'doc_owner',
            store: new Ext.create('Asgard.store.ProcessOwner')
        }, this.objectOwnerField);
        
        this.objectIncidentTypeField = this.objectIncidentTypeField || [];
        this.objectIncidentTypeField = Ext.Object.merge({
            xtype: 'incidenttypecombo',
            anchor: '100%',
            store: new Ext.create('Asgard.store.HiraIncidentsType',{ autoLoad: true })
        }, this.objectIncidentTypeField);
       
        this.objectRegisterNameField = this.objectRegisterNameField || [];
        this.objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'registerName',
            anchor: '100%',
            allowBlank:false
        }, this.objectRegisterNameField);

        this.objectRegisterSurnameField = this.objectRegisterSurnameField || [];
        this.objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'registerSurname',
            anchor: '100%',
            allowBlank:false
        }, this.objectRegisterSurnameField);
        
        this.objectRegisterLastnameField = this.objectRegisterLastnameField || [];
        this.objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'registerLastname',
            anchor: '100%',
            allowBlank:false
        }, this.objectRegisterLastnameField);
        
        this.objectRegisterEmailField = this.objectRegisterEmailField || [];
        this.objectRegisterEmailField = Ext.Object.merge({
            fieldLabel: this.objectRegisterEmailText,
            xtype: 'textfield',
            name: 'registerEmail',
            vtype: 'email',
            anchor: '100%',
            allowBlank:false
        }, this.objectRegisterEmailField);

        this.objectIncidentDescField = this.objectIncidentDescField || [];
        this.objectIncidentDescField = Ext.Object.merge({
            fieldLabel: this.objectIncidentDescText,
            xtype: 'htmleditor',
            name: 'IncidentDesc',
            anchor: '100%',
            allowBlank:false
        }, this.objectIncidentDescField);
        
        this.objectIncidentDateField = this.objectIncidentDateField || [];
        this.objectIncidentDateField = Ext.Object.merge({
            fieldLabel: this.objectIncidentDateText,
            xtype: 'datefield',
            name: 'IncidentDate',
            anchor: '100%',
            format: 'Y-m-d',
            allowBlank:false
        }, this.objectIncidentDateField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'add',
                type: 'button',
                itemId: 'add',
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
        
        /*
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
        */
       
        this.items = this.items || [];
        this.items = this.items.concat([
            this.objectRegisterCodeField,
            this.objectCompanyField,
            this.objectCountryField,
            this.objectLocationField,
            this.objectNonConformityField,
            this.objectProcessTypeField,
            this.objectProcessField,
            this.objectThreadField,
            this.objectOwnerField,
            this.objectIncidentTypeField,
            this.objectRegisterNameField,
            this.objectRegisterSurnameField,
            this.objectRegisterLastnameField,
            this.objectRegisterEmailField,
            this.objectIncidentDescField,
            this.objectIncidentDateField
        ]);
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(){
        console.log('submit here!');
    }
});