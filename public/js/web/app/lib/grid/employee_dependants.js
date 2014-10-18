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

Ext.define('Asgard.lib.grid.employee_dependants',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.gridemployee_dependants',
    itemId: 'gridEmployeeDependants',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    xtype: 'cell-editing',
    layout: 'fit',
    titleText: 'Employee Dependants List',
    idText: 'Id',
    surnameText: 'Surname',
    lastnameText: 'Last Name',
    firstnameText: 'First Name',
    birthdayText: 'Birthday',
    typeText: 'Type',
    genderText: 'Gender',
    loadingText: 'Searching for data...',
    
    toolRemoveText: 'Remove Dependant',
    toolAddText: 'Save Dependant',
    
    typeCouple: 'Couple',
    typeChildren: 'Children',
    
    genderMale: 'Male',
    genderFemale: 'Female',
    
    requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*',
        'Asgard.model.EmployeesDependants'
    ],
    eui: 0,
    
    //selModel: { selType: 'cellmodel' },
    selType : 'cellmodel',
    
    initComponent: function(){
        this.cellEditing = new Ext.grid.plugin.CellEditing({
            clicksToEdit: 1
        });
        this.title = this.titleText;
        this.tools = [{
          type: 'plus',
          scope: this,
          handler: this.onAddClick
        }];
        this.plugins = [
            this.cellEditing
        ],
        this.columns =  {
            plugins: [
            {
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, flex: 0.5, sortable: true, hidden: true, dataIndex: 'id_employee', filter: false},
                {text: this.idText, flex: 0.5, sortable: true, hidden: true, dataIndex: 'id_dependant', filter: false},
                {text: this.surnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'surname', filter: true,
                    editor: { allowBlank: false }},
                {text: this.lastnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'lastname', filter: true,
                    editor: { allowBlank: true }},
                {text: this.firstnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'firstname', filter: true,
                    editor: { allowBlank: false }},
                {text: this.birthdayText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'birthday', filter: true, renderer: Ext.util.Format.dateRenderer('d-m-Y'),
                    editor: { xtype: 'datefield', format: 'd-m-Y' }},
                {text: this.typeText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'type', filter: true, 
                editor: new Ext.form.field.ComboBox({
                    typeAhead: true,
                    triggerAction: 'all',
                    store: [
                        ['couple',this.typeCouple],
                        ['children',this.typeChildren]
                    ]
                })},
                {text: this.genderText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'gender', filter: true,
                editor: new Ext.form.field.ComboBox({
                    typeAhead: true,
                    triggerAction: 'all',
                    store: [
                        ['male',this.genderMale],
                        ['female',this.genderFemale]
                    ]
                })},
                {
                xtype: 'actioncolumn',
                width: 60,
                sortable: false,
                menuDisabled: true,
                items: [{
                    icon: 'images/default/delete.png',
                    tooltip: this.toolRemoveText,
                    scope: this,
                    name: 'del',
                    handler: this.trateDependant
                },'-',{
                    icon: 'images/default/save.png',
                    tooltip: this.toolAddText,
                    scope: this,
                    name: 'add',
                    handler: this.trateDependant
                }]
            }
            ]
        };
        this.callParent();
    },
    
    initEvents: function() {
        // call the superclass's initEvents implementation
        this.callParent();
        this.on('edit', this.onCellEdit, this);
    },
    
    onCellEdit: function( editor, e, a, b, c) {
        var record = this.getStore().getAt(e.rowIdx);
        if( e.originalValue !== '' && e.originalValue !== e.value && record.data.id_dependant !== 0 ){
            
            var valueUpdated;
            if(e.field === 'birthday'){
                valueUpdated = Ext.util.Format.date(e.value,'Y-m-d');
            }else{
                valueUpdated = e.value;
            }
            var fieldName = e.field;
            Ext.Ajax.request({
                url: 'hcm/addemployeesdependants',
                params: {
                    action: 'upd',
                    id: record.data.id,
                    id_dependant: record.data.id_dependant,
                    field: fieldName,
                    value: valueUpdated
                },
                scope: this,
                success: function(response){
                    var text = response.responseText;
                    this.getStore().reload();
                    // process server response here
                },
                failure: function(response){
                    var text = response.responseText;
                    console.log(text);
                    // 
                }
            });
        }
    },
    
    onAddClick: function(){
        // Create a model instance
        
        var gridSM = this.up('panel').getComponent('gridEmployees').getSelectionModel().getSelection()[0];
        var rec = new Asgard.model.EmployeesDependants({
            id: gridSM.get('id')
        });
        this.getStore().insert(0, rec);
        this.cellEditing.startEditByPosition({
            row: 0, 
            column: 0
        });
    },

    trateDependant: function(sm, rs, id, button, obj, record) {
        //console.log(button.name);
        var gridEmployees = this.up('panel').getComponent('gridEmployees');
        Ext.Ajax.request({
            url: 'hcm/addemployeesdependants',
            params: {
                action: button.name,
                id: record.data.id,
                id_dependant: record.data.id_dependant,
                surname: record.data.surname,
                lastname: record.data.lastname,
                firstname: record.data.firstname,
                birthday: Ext.util.Format.date(record.data.birthday,'Y-m-d'),
                type: record.data.type,
                gender: record.data.gender,
                user_id: record.data.user_id,
                date_creation: record.data.date_creation
            },
            scope: this,
            success: function(response){
                var text = response.responseText;
                
                this.getStore().reload();
                gridEmployees.getStore().reload();
                // process server response here
            },
            failure: function(response){
                var text = response.responseText;
                console.log(text);
                // 
            }
        });
    },
    
    createWindow: function() {
        var windowDoc = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowDoc;
    }    
});