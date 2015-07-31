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
Ext.define('Asgard.lib.forms.comboOfficesHR', { 
    extend: 'Ext.form.Panel',
    border: false,
    plain: false,
    fieldDefaults: {
        labelAlign: 'top',
        msgTarget: 'side'
    },
    defaults: {
        border: false,
        xtype: 'panel',
        flex: 1,
        layout: 'anchor'
    },
    
    layout: 'hbox',
    
    typeCouple: 'Couple',
    typeChildren: 'Children',
    textOfficesField: 'Choose your office',
    textDependantField: 'Type of dependant',
    textAgeField: 'Age Range',
    textBetweenField: 'and',
    textSubmitButton: 'Search',
    
    officesField: undefined,
    dependantField: undefined,
    ageField: undefined,
    beginAgeField: undefined,
    betweenField: undefined,
    endAgeField: undefined,
    submitButton: undefined,

    initComponent: function(){
        
        this.officesField = this.officesField || [];
        this.officesField = Ext.Object.merge({
            xtype: 'checkcombo',
            store: new Ext.create('Asgard.store.EmployeeOffices'),
            valueField: 'id',
            displayField: 'description',
            addAllSelector: true,
            width: 280,
            name: 'officesCombo'
        }, this.officesField);
        
        this.dependantField = this.dependantField || [];
        this.dependantField = Ext.Object.merge({
            xtype: 'combo',
            store: [
                        ['couple',this.typeCouple],
                        ['children',this.typeChildren]
                    ],
            width: 200,
            name: 'dependantCombo',
            emptyText: this.textDependantField
        }, this.dependantField);
        
        this.ageField = this.ageField || [];
        this.ageField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'age',
            value: this.textAgeField
        }, this.ageField);
        
        this.beginAgeField = this.beginAgeField || [];
        this.beginAgeField = Ext.Object.merge({
            xtype: 'numberfield',
            name: 'age_begin',
            width: 50,
            allowBlank: true
        }, this.beginAgeField);
        
        this.endAgeField = this.endAgeField || [];
        this.endAgeField = Ext.Object.merge({
            xtype: 'numberfield',
            name: 'age_end',
            width: 50,
            allowBlank: true
        }, this.endAgeField);
        
        this.betweenField = this.betweenField || [];
        this.betweenField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'between',
            value: this.textBetweenField
        }, this.betweenField);
        
        this.innerItems = Ext.Object.merge({
            name: 'innerItems',
            items: [
                this.beginAgeField,
                this.endAgeField
            ]
        },this.innerItems);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'search',
                type: 'button',
                scope: me,
                handler: fnOProcess
            }, this.submitButton);

        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ this.officesField , this.dependantField, this.ageField, this.beginAgeField, this.betweenField, this.endAgeField, '->', this.submitButton ]);
        
        this.callParent();
    }
});