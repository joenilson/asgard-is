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
Ext.define('Asgard.lib.forms.hiraIncidentCauses',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newincidentcauses',
    url: 'ims/addincidentcauses',

    objectRegisterNameText: 'Register Name',
    objectRegisterSurnameText: 'Register Surname',
    objectRegisterLastnameText: 'Register Lastname',
    objectIncidentIAText: 'Inmediate Action',
    objectIncidentCAText: 'Corrective Action',
    baseParams: { module: 'incidentcauses' },
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',

    successText: 'Causes saved succefully!',
    failureText: 'Something is wrong, please try it again',
    
    me_objectRegisterNameField: undefined,
    me_objectRegisterSurnameField: undefined,
    me_objectRegisterLastnameField: undefined,
    me_objectIncidentTypeField: undefined,
    me_objectIncidentIAField: undefined,
    me_objectIncidentCAField: undefined,
    
    ma_objectRegisterNameField: undefined,
    ma_objectRegisterSurnameField: undefined,
    ma_objectRegisterLastnameField: undefined,
    ma_objectIncidentTypeField: undefined,
    ma_objectIncidentIAField: undefined,
    ma_objectIncidentCAField: undefined,
    
    hf_objectRegisterNameField: undefined,
    hf_objectRegisterSurnameField: undefined,
    hf_objectRegisterLastnameField: undefined,
    hf_objectIncidentTypeField: undefined,
    hf_objectIncidentIAField: undefined,
    hf_objectIncidentCAField: undefined,
    
    in_objectRegisterNameField: undefined,
    in_objectRegisterSurnameField: undefined,
    in_objectRegisterLastnameField: undefined,
    in_objectIncidentTypeField: undefined,
    in_objectIncidentIAField: undefined,
    in_objectIncidentCAField: undefined,
    
    mt_objectRegisterNameField: undefined,
    mt_objectRegisterSurnameField: undefined,
    mt_objectRegisterLastnameField: undefined,
    mt_objectIncidentTypeField: undefined,
    mt_objectIncidentIAField: undefined,
    mt_objectIncidentCAField: undefined,
    
    ot_objectRegisterNameField: undefined,
    ot_objectRegisterSurnameField: undefined,
    ot_objectRegisterLastnameField: undefined,
    ot_objectIncidentTypeField: undefined,
    ot_objectIncidentIAField: undefined,
    ot_objectIncidentCAField: undefined,
    
    flex: 1,
    autoScroll: true,
    anchor: '100%',
    MethodTitle: 'Method',
    MachineTitle: 'Machine',
    HumanFactorTitle: 'Human Factor',
    InfrastructureTitle: 'Infrastructure',
    MaterialTitle: 'Material',
    OthersTitle: 'Others',
    initComponent: function(){
        var me = this;
       
        this.me_objectRegisterNameField = this.me_objectRegisterNameField || [];
        this.me_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'me_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectRegisterNameField);
        
        this.me_objectRegisterSurnameField = this.me_objectRegisterSurnameField || [];
        this.me_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'me_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectRegisterSurnameField);
        
        this.me_objectRegisterLastnameField = this.me_objectRegisterLastnameField || [];
        this.me_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'me_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectRegisterLastnameField);
        
        this.me_objectIncidentTypeField = this.me_objectIncidentTypeField || [];
        this.me_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.MethodTitle,
            xtype: 'textareafield',
            name: 'me_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectIncidentTypeField);
        
        this.me_objectIncidentIAField = this.me_objectIncidentIAField || [];
        this.me_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'me_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectIncidentIAField);
        
        this.me_objectIncidentCAField = this.me_objectIncidentCAField || [];
        this.me_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'me_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.me_objectIncidentCAField);
        
        this.itemsMethod = this.itemsMethod || [];
        this.itemsMethod =  Ext.Object.merge({
            title: this.MethodTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.me_objectIncidentTypeField,
                this.me_objectIncidentIAField,
                this.me_objectIncidentCAField,
                this.me_objectRegisterNameField,
                this.me_objectRegisterSurnameField,
                this.me_objectRegisterLastnameField
            ]
        },this.itemsMethod);
        
        this.ma_objectRegisterNameField = this.ma_objectRegisterNameField || [];
        this.ma_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'ma_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectRegisterNameField);
        
        this.ma_objectRegisterSurnameField = this.ma_objectRegisterSurnameField || [];
        this.ma_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'ma_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectRegisterSurnameField);
        
        this.ma_objectRegisterLastnameField = this.ma_objectRegisterLastnameField || [];
        this.ma_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'ma_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectRegisterLastnameField);
        
        this.ma_objectIncidentTypeField = this.ma_objectIncidentTypeField || [];
        this.ma_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.MachineTitle,
            xtype: 'textareafield',
            name: 'ma_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectIncidentTypeField);
        
        this.ma_objectIncidentIAField = this.ma_objectIncidentIAField || [];
        this.ma_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'ma_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectIncidentIAField);
        
        this.ma_objectIncidentCAField = this.ma_objectIncidentCAField || [];
        this.ma_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'ma_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.ma_objectIncidentCAField);
        
        this.itemsMachine = this.itemsMachine || [];
        this.itemsMachine =  Ext.Object.merge({
            title: this.MachineTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.ma_objectIncidentTypeField,
                this.ma_objectIncidentIAField,
                this.ma_objectIncidentCAField,
                this.ma_objectRegisterNameField,
                this.ma_objectRegisterSurnameField,
                this.ma_objectRegisterLastnameField
            ]
        },this.itemsMachine);
        
        this.hf_objectRegisterNameField = this.hf_objectRegisterNameField || [];
        this.hf_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'hf_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectRegisterNameField);
        
        this.hf_objectRegisterSurnameField = this.hf_objectRegisterSurnameField || [];
        this.hf_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'hf_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectRegisterSurnameField);
        
        this.hf_objectRegisterLastnameField = this.hf_objectRegisterLastnameField || [];
        this.hf_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'hf_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectRegisterLastnameField);
        
        this.hf_objectIncidentTypeField = this.hf_objectIncidentTypeField || [];
        this.hf_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.HumanFactorTitle,
            xtype: 'textareafield',
            name: 'hf_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectIncidentTypeField);
        
        this.hf_objectIncidentIAField = this.hf_objectIncidentIAField || [];
        this.hf_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'hf_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectIncidentIAField);
        
        this.hf_objectIncidentCAField = this.hf_objectIncidentCAField || [];
        this.hf_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'hf_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.hf_objectIncidentCAField);
        
        this.itemsHumanFactor = this.itemsHumanFactor || [];
        this.itemsHumanFactor =  Ext.Object.merge({
            title: this.HumanFactorTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.hf_objectIncidentTypeField,
                this.hf_objectIncidentIAField,
                this.hf_objectIncidentCAField,
                this.hf_objectRegisterNameField,
                this.hf_objectRegisterSurnameField,
                this.hf_objectRegisterLastnameField
            ]
        },this.itemsHumanFactor);
        
        this.in_objectRegisterNameField = this.in_objectRegisterNameField || [];
        this.in_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'in_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectRegisterNameField);
        
        this.in_objectRegisterSurnameField = this.in_objectRegisterSurnameField || [];
        this.in_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'in_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectRegisterSurnameField);
        
        this.in_objectRegisterLastnameField = this.in_objectRegisterLastnameField || [];
        this.in_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'in_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectRegisterLastnameField);
        
        this.in_objectIncidentTypeField = this.in_objectIncidentTypeField || [];
        this.in_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.InfrastructureTitle,
            xtype: 'textareafield',
            name: 'in_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectIncidentTypeField);
        
        this.in_objectIncidentIAField = this.in_objectIncidentIAField || [];
        this.in_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'in_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectIncidentIAField);
        
        this.in_objectIncidentCAField = this.in_objectIncidentCAField || [];
        this.in_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'in_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.in_objectIncidentCAField);
        
        this.itemsInfrastructure = this.itemsInfrastructure || [];
        this.itemsInfrastructure =  Ext.Object.merge({
            title: this.InfrastructureTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.in_objectIncidentTypeField,
                this.in_objectIncidentIAField,
                this.in_objectIncidentCAField,
                this.in_objectRegisterNameField,
                this.in_objectRegisterSurnameField,
                this.in_objectRegisterLastnameField
            ]
        },this.itemsInfrastructure);
        
        this.mt_objectRegisterNameField = this.mt_objectRegisterNameField || [];
        this.mt_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'mt_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectRegisterNameField);
        
        this.mt_objectRegisterSurnameField = this.mt_objectRegisterSurnameField || [];
        this.mt_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'mt_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectRegisterSurnameField);
        
        this.mt_objectRegisterLastnameField = this.mt_objectRegisterLastnameField || [];
        this.mt_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'mt_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectRegisterLastnameField);
        
        this.mt_objectIncidentTypeField = this.mt_objectIncidentTypeField || [];
        this.mt_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.MaterialTitle,
            xtype: 'textareafield',
            name: 'mt_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectIncidentTypeField);
        
        this.mt_objectIncidentIAField = this.mt_objectIncidentIAField || [];
        this.mt_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'mt_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectIncidentIAField);
        
        this.mt_objectIncidentCAField = this.mt_objectIncidentCAField || [];
        this.mt_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'mt_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.mt_objectIncidentCAField);
        
        this.itemsMaterial = this.itemsMaterial || [];
        this.itemsMaterial =  Ext.Object.merge({
            title: this.MaterialTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.mt_objectIncidentTypeField,
                this.mt_objectIncidentIAField,
                this.mt_objectIncidentCAField,
                this.mt_objectRegisterNameField,
                this.mt_objectRegisterSurnameField,
                this.mt_objectRegisterLastnameField
            ]
        },this.itemsMaterial);
        
        this.ot_objectRegisterNameField = this.ot_objectRegisterNameField || [];
        this.ot_objectRegisterNameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterNameText,
            xtype: 'textfield',
            name: 'ot_registerName',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectRegisterNameField);
        
        this.ot_objectRegisterSurnameField = this.ot_objectRegisterSurnameField || [];
        this.ot_objectRegisterSurnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterSurnameText,
            xtype: 'textfield',
            name: 'ot_registerSurname',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectRegisterSurnameField);
        
        this.ot_objectRegisterLastnameField = this.ot_objectRegisterLastnameField || [];
        this.ot_objectRegisterLastnameField = Ext.Object.merge({
            fieldLabel: this.objectRegisterLastnameText,
            xtype: 'textfield',
            name: 'ot_registerLastname',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectRegisterLastnameField);
        
        this.ot_objectIncidentTypeField = this.ot_objectIncidentTypeField || [];
        this.ot_objectIncidentTypeField = Ext.Object.merge({
            fieldLabel: this.OthersTitle,
            xtype: 'textareafield',
            name: 'ot_IncidentType',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectIncidentTypeField);
        
        this.ot_objectIncidentIAField = this.ot_objectIncidentIAField || [];
        this.ot_objectIncidentIAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentIAText,
            xtype: 'textareafield',
            name: 'ot_IncidentIA',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectIncidentIAField);
        
        this.ot_objectIncidentCAField = this.ot_objectIncidentCAField || [];
        this.ot_objectIncidentCAField = Ext.Object.merge({
            fieldLabel: this.objectIncidentCAText,
            xtype: 'textareafield',
            name: 'ot_IncidentCA',
            anchor: '100%',
            allowBlank:true
        }, this.ot_objectIncidentCAField);
        
        this.itemsOthers = this.itemsOthers || [];
        this.itemsOthers =  Ext.Object.merge({
            title: this.OthersTitle,
            layout: 'anchor',
            defaults: {
                labelWidth: 180
            },
            items: [
                this.ot_objectIncidentTypeField,
                this.ot_objectIncidentIAField,
                this.ot_objectIncidentCAField,
                this.ot_objectRegisterNameField,
                this.ot_objectRegisterSurnameField,
                this.ot_objectRegisterLastnameField
            ]
        },this.itemsOthers);
        
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
        
        this.items = Ext.Object.merge({
            layout: 'anchor',
            //flex: 1,
            //anchor: '100%',
            defaults :{
                bodyPadding: 10
            },
            width: '100%',
            xtype: 'tabpanel',
            items: [
                this.itemsMethod,
                this.itemsMachine,
                this.itemsHumanFactor,
                this.itemsInfrastructure,
                this.itemsMaterial,
                this.itemsOthers
            ]
        },this.items);
        
        /*
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
        */
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(button, event) {
        var me = this;
        var form = button.up('panel').getForm();
        var panel = button.up('panel');
        var grid = panel.innerPanel;
        console.log(grid);
        if(form.isValid()){
            form.submit({
                success: function(fp, o, m, r) {
                    console.log(fp);
                    console.log(0);
                    form.reset();
                    var winActive = Ext.WindowManager.getActive();
                    winActive.hide();
                    //grid.getStore().load({params: { company: companyId, country: countryId, location: locationId, monthfield: yearmonth }});
                    Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    console.log(o);
                    console.log(u);
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    }
});