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
Ext.define('Asgard.lib.forms.comboOffices', { 
    extend: 'Ext.form.Panel',
    border: false,
    plain: false,
    fieldDefaults: {
        labelAlign: 'top',
        msgTarget: 'side'
    },
    //bodyStyle: 'padding:5px 5px 5px',
    defaults: {
        border: false,
        xtype: 'panel',
        flex: 1,
        layout: 'anchor'
    },
    
    layout: 'hbox',
    
    textSubmitButton: 'Search',
    
    officesField: undefined,
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
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'search',
                type: 'button',
                scope: me,
                handler: fnOProcess
            }, this.submitButton);
        /*
        this.items = this.items || [];
        this.items = this.items.concat([ this.officesField ]);
        */
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ this.officesField , '->', this.submitButton ]);
        
        this.callParent();
    }
});