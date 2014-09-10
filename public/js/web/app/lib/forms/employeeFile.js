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
Ext.define('Asgard.lib.forms.employeeFile',{
    extend: 'Ext.form.Panel',
    alias: 'widget.employeeefile',
    url: 'hcm/employeefile',
    
    baseParams: { module: 'hcmef' },
    idEmployee: 0,
    officeEmployee: '',

    employeeText: 'Employee',
    idText: 'Id',
    surnameText: 'Surname',
    lastnameText: 'Last Name',
    firstnameText: 'First Name',
    positionText: 'Position',
    organization: 'Organization',
    birthdayText: 'Birthday',
    ageText: 'Age',
    officeText: 'Office',
    maritalStatusText: 'Marital Status',
    
    coupleText: 'Couple',
    coupleSurnameText: 'Surname',
    coupleLastnameText: 'Last Name',
    coupleFirstnameText: 'First Name',
    coupleBirthdayText: 'Birthday',
    coupleAgeText: 'Age',
    coupleGenderText: 'Gender',
    
    childrenText: 'Children',
    childrenSurnameText: 'Surname',
    childrenLastnameText: 'Last Name',
    childrenFirstnameText: 'First Name',
    childrenBirthdayText: 'Birthday',
    childrenAgeText: 'Age',
    childrenGenderText: 'Gender',
    
    genderText: 'Gender',
    genderMale: 'Male',
    genderFemale: 'Female',
    
    statusText: 'Marital Status',
    statusSingle: 'Single',
    statusMarried: 'Married',
    statusDivorced: 'Divorced',
    statusWidowed: 'Widowed',
    statusSeparated: 'Separated',
    
    textAddButton: 'Add Children',
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    
    idField: undefined,
    surnameField: undefined,
    lastnameField: undefined,
    firstnameField: undefined,
    positionField: undefined,
    organizationField: undefined,
    birthdayField: undefined,
    ageField: undefined,
    officeField: undefined,
    maritalStatusField: undefined,
    
    coupleSurnameField: undefined,
    coupleLastnameField: undefined,
    coupleFirstnameField: undefined,
    coupleBirthdayField: undefined,
    coupleAgeField: undefined,
    coupleGenderField: undefined,
    
    childrenSurnameField: undefined,
    childrenLastnameField: undefined,
    childrenFirstnameField: undefined,
    childrenBirthdayField: undefined,
    childrenAgeField: undefined,
    childrenGenderField: undefined,
    
    addButton: undefined,
    submitButton: undefined,
    cancelButton: undefined,
    
    fieldDefaults: {
        labelAlign: 'right',
        labelWidth: 90,
        msgTarget: 'qtip'
    },
    defaults: {
        labelWidth: 100,
        bodpyStyle: 'padding: 5px;'
    },
    anchor: '100%',
    width: 640,
    flex: 1,
    children: 0,
    autoScroll: true,
    initComponent: function(){
        var me = this;
        this.idField = this.idField || [];
        this.idField = Ext.Object.merge({
            fieldLabel: this.idText,
            xtype: 'numberfield',
            name: 'id',
            //anchor: '30%',
            width: 200,
            value: this.idEmployee,
            hideTrigger: true,
            readOnly: true,
            allowBlank:false
        }, this.idField);
        
        this.officeField = this.officeField || [];
        this.officeField = Ext.Object.merge({
            fieldLabel: this.officeText,
            xtype: 'textfield',
            name: 'office',
            width: 170,
            value: this.officeEmployee,
            readOnly: true,
            allowBlank:false
        }, this.officeField);
        
        this.surnameField = this.surnameField || [];
        this.surnameField = Ext.Object.merge({
            fieldLabel: this.surnameText,
            xtype: 'textfield',
            name: 'surname',
            anchor: '50%',
            allowBlank:false
        }, this.surnameField);
        
        this.lastnameField = this.lastnameField || [];
        this.lastnameField = Ext.Object.merge({
            fieldLabel: this.lastnameText,
            xtype: 'textfield',
            name: 'lastname',
            anchor: '50%',
            allowBlank:false
        }, this.lastnameField);
        
        this.firstnameField = this.firstnameField || [];
        this.firstnameField = Ext.Object.merge({
            fieldLabel: this.firstnameText,
            xtype: 'textfield',
            name: 'firstname',
            anchor: '50%',
            allowBlank:false
        }, this.firstnameField);
        
        this.birthdayField = this.birthdayField || [];
        this.birthdayField = Ext.Object.merge({
            fieldLabel: this.birthdayText,
            xtype: 'datefield',
            name: 'birthday',
            format: 'd-m-Y',
            width: 200,
            allowBlank:false
        }, this.birthdayField);
        
        this.ageField = this.ageField || [];
        this.ageField = Ext.Object.merge({
            fieldLabel: this.ageText,
            xtype: 'numberfield',
            name: 'age',
            width: 150,
            hideTrigger: true,
            allowBlank:false
        }, this.ageField);
        
        this.genderField = this.genderField || [];
        this.genderField = Ext.Object.merge({
            fieldLabel: this.genderText,
            xtype: 'radiogroup',
            //name: 'gender',
            width: 250,
            defaults: {
                name: 'gender',
                margin: '0 5 0 0'
            },
            items: [{
                inputValue: 'male',
                boxLabel: this.genderMale
            }, {
                inputValue: 'female',
                boxLabel: this.genderFemale
            }],
            allowBlank:false
        }, this.genderField);
        
        this.maritalStatusField = this.maritalStatusField || [];
        this.maritalStatusField = Ext.Object.merge({
            fieldLabel: this.maritalStatusText,
            xtype: 'radiogroup',
            //name: 'marital_status',
            //anchor: '100%',
            width: '100%',
            defaults: {
                name: 'marital_status',
                margin: '0 5 0 0'
            },
            items: [{
                inputValue: 'single',
                boxLabel: this.statusSingle
            }, {
                inputValue: 'married',
                boxLabel: this.statusMarried
            }, {
                inputValue: 'divorced',
                boxLabel: this.statusDivorced
            }, {
                inputValue: 'widowed',
                boxLabel: this.statusWidowed
            }, {
                inputValue: 'separated',
                boxLabel: this.statusSeparated
            }],
            allowBlank:false
        }, this.maritalStatusField);
       
        this.personItems = this.personItems || [];
        this.personItems = Ext.Object.merge({
            xtype: 'fieldset',
            title: this.employeeText,
            layout: 'anchor',
            items: [{
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.idField,
                        this.officeField
                    ]
                },
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.surnameField,
                        this.lastnameField
                    ]
                },
                this.firstnameField,
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.birthdayField,
                        this.ageField,
                        this.genderField
                    ]
                },
                this.maritalStatusField
            ]
        },this.personItems);
        
        this.coupleSurnameField = this.coupleSurnameField || [];
        this.coupleSurnameField = Ext.Object.merge({
            fieldLabel: this.coupleSurnameText,
            xtype: 'textfield',
            name: 'couple_surname',
            anchor: '50%',
            allowBlank:false
        }, this.coupleSurnameField);
        
        this.coupleLastnameField = this.coupleLastnameField || [];
        this.coupleLastnameField = Ext.Object.merge({
            fieldLabel: this.coupleLastnameText,
            xtype: 'textfield',
            name: 'couple_lastname',
            anchor: '50%',
            allowBlank:false
        }, this.coupleLastnameField);
        
        this.coupleFirstnameField = this.coupleFirstnameField || [];
        this.coupleFirstnameField = Ext.Object.merge({
            fieldLabel: this.coupleFirstnameText,
            xtype: 'textfield',
            name: 'couple_firstname',
            anchor: '50%',
            allowBlank:false
        }, this.coupleFirstnameField);
        
        this.coupleBirthdayField = this.coupleBirthdayField || [];
        this.coupleBirthdayField = Ext.Object.merge({
            fieldLabel: this.coupleBirthdayText,
            xtype: 'datefield',
            name: 'couple_birthday',
            format: 'd-m-Y',
            width: 200,
            allowBlank:false
        }, this.coupleBirthdayField);
        
        this.coupleAgeField = this.coupleAgeField || [];
        this.coupleAgeField = Ext.Object.merge({
            fieldLabel: this.coupleAgeText,
            xtype: 'numberfield',
            name: 'couple_age',
            width: 150,
            hideTrigger: true,
            allowBlank:false
        }, this.coupleAgeField);
        
        this.coupleGenderField = this.coupleGenderField || [];
        this.coupleGenderField = Ext.Object.merge({
            fieldLabel: this.coupleGenderText,
            xtype: 'radiogroup',
            name: 'couple_gender',
            width: 250,
            items: [{
                inputValue: 'male',
                boxLabel: this.genderMale
            }, {
                inputValue: 'female',
                boxLabel: this.genderFemale
            }],
            allowBlank:false
        }, this.coupleGenderField);
                
        this.coupleItems = this.coupleItems || [];
        this.coupleItems = Ext.Object.merge({
            xtype: 'fieldset',
            title: this.coupleText,
            layout: 'anchor',
            defaults: {
                anchor: '100%'
            },
            items: [
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.coupleSurnameField,
                        this.coupleLastnameField
                    ]
                },
                this.coupleFirstnameField,
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.coupleBirthdayField,
                        this.coupleAgeField,
                        this.coupleGenderField
                    ]
                }
            ]
        },this.coupleItems);
        
        this.items = this.items || [];
        this.items = this.items.concat([
            this.personItems,
            this.coupleItems 
        ]);
        
        this.addButton = this.addButton || []; 
        this.addButton = Ext.Object.merge({
            text: this.textAddButton,
            name: 'addchild',
            type: 'button',
            itemId: 'addchild',
            scope: me,
            handler: this.addChildren
        }, this.addButton);
        
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
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ this.addButton, '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    
    addChildren: function(button, obj, form) {
        var me = this;
        console.log('button');
        console.log(button);
        console.log('form');
        console.log(form);
        console.log('children join');
        console.log(me.children);
        var fieldsetText = this.childrenText+' '+this.childrenNumber();
       
        this.childrenSurnameField = this.childrenSurnameField || [];
        this.childrenSurnameField = Ext.Object.merge({
            fieldLabel: this.childrenSurnameText,
            xtype: 'textfield',
            name: 'child_surname[]',
            anchor: '50%',
            allowBlank:false
        }, this.childrenSurnameField);
        
        this.childrenLastnameField = this.childrenLastnameField || [];
        this.childrenLastnameField = Ext.Object.merge({
            fieldLabel: this.childrenLastnameText,
            xtype: 'textfield',
            name: 'child_lastname[]',
            anchor: '50%',
            allowBlank:false
        }, this.childrenLastnameField);
        
        this.childrenFirstnameField = this.childrenFirstnameField || [];
        this.childrenFirstnameField = Ext.Object.merge({
            fieldLabel: this.childrenFirstnameText,
            xtype: 'textfield',
            name: 'child_firstname[]',
            anchor: '50%',
            allowBlank:false
        }, this.childrenFirstnameField);
        
        this.childrenBirthdayField = this.childrenBirthdayField || [];
        this.childrenBirthdayField = Ext.Object.merge({
            fieldLabel: this.childrenBirthdayText,
            xtype: 'datefield',
            name: 'child_birthday[]',
            format: 'd-m-Y',
            width: 200,
            allowBlank:false
        }, this.childrenBirthdayField);
        
        this.childrenAgeField = this.childrenAgeField || [];
        this.childrenAgeField = Ext.Object.merge({
            fieldLabel: this.childrenAgeText,
            xtype: 'numberfield',
            name: 'age[]',
            width: 150,
            hideTrigger: true,
            allowBlank:false
        }, this.childrenAgeField);
        
        this.childrenGenderField = this.childrenGenderField || [];
        this.childrenGenderField = Ext.Object.merge({
            fieldLabel: this.childrenGenderText,
            xtype: 'radiogroup',
            name: 'gender[]',
            width: 250,
            items: [{
                inputValue: 'male',
                boxLabel: this.genderMale
            }, {
                inputValue: 'female',
                boxLabel: this.genderFemale
            }],
            allowBlank:false
        }, this.childrenGenderField);
        
        this.childItems = this.childItems || [];
        this.childItems = Ext.Object.merge({
            xtype: 'fieldset',
            title: fieldsetText,
            layout: 'anchor',
            defaults: {
                anchor: '100%'
            },
            items: [
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                        this.childrenSurnameField,
                        this.childrenLastnameField
                    ]
                },
                this.childrenFirstnameField,
                {
                    xtype: 'container',
                    layout: 'hbox',
                    margin: '0 0 5 0',
                    items: [
                this.childrenBirthdayField,
                this.childrenAgeField,
                this.childrenGenderField
                    ]
                }
            ]
        },this.childItems);
        this.add(this.childItems);
        console.log(this.childItems);
    },
    
    childrenNumber: function(){
        this.children++;
        return this.children;
    },
    /*
    fnSubmit: function(button, form, obj, records) {
        console.log(button);
        console.log(form);
        console.log(obj);
        console.log(records);
        this.submit();
    }
    */
    fnSubmit: function(button, event) {
        var me = this;
        var form = button.up('panel').getForm();
        console.log(form);
        if(form.isValid()){
            form.submit({
                params: {
                    module: 'hcmemployees'
                },
                success: function(fp, o, m, r) {
                    console.log(fp);
                    console.log(o);
                    console.log(m);
                    console.log(r);
                    form.reset();
                    var winActive = Ext.WindowManager.getActive();
                    winActive.hide();
                    Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    }
});