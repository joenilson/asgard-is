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

Ext.define('Asgard.lib.grid.employees',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.gridemployees',
    itemId: 'gridEmployees',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Employees List',
    idText: 'Id',
    surnameText: 'Surname',
    lastnameText: 'Last Name',
    firstnameText: 'First Name',
    positionText: 'Position',
    organizationText: 'Organization',
    birthdayText: 'Birthday',
    officeText: 'Office',
    loadingText: 'Searching for data...',
    toolFormText: 'Employee without dependents',
    
    maritalStatusText: 'Marital Status',
    statusSingle: 'Single',
    statusMarried: 'Married',
    statusDivorced: 'Divorced',
    statusWidowed: 'Widowed',
    statusSeparated: 'Separated',

    workedText: 'Processed',
    
    falseText: 'Pending',
    trueText: 'Processed',
    
    questionTitle: 'No Dependents',
    questionText: 'Are your mark this employee without dependants?',
    
    requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*',
        'Asgard.model.Employees',
        'Asgard.model.EmployeesDependants'
    ],
    
    initComponent: function(){
        this.title = this.titleText;
        /*
        this.cellEditing = new Ext.grid.plugin.CellEditing({
            clicksToEdit: 2
        });
        this.plugins = [
            this.cellEditing
        ];
        */
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'id', filter: true},
                {text: this.surnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'surname', filter: true,
                editor: { allowBlank: false }},
                {text: this.lastnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'lastname', filter: true,
                editor: { allowBlank: true }},
                {text: this.firstnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'firstname', filter: true,
                editor: { allowBlank: false }},
                {text: this.positionText, flex: 1,sortable: true, hidden: false, dataIndex: 'position', filter: 'combo'},
                {text: this.organizationText, flex: 1,sortable: true, hidden: false, dataIndex: 'work', filter: 'combo'},
                {text: this.birthdayText, flex: 0.5,sortable: true, hidden: false, dataIndex: 'birthday', filter: true, renderer: Ext.util.Format.dateRenderer('d-m-Y'),
                editor: { xtype: 'datefield', format: 'd-m-Y' }},
                {text: this.officeText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'office', filter: true},
                {text: this.workedText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'processed', filter: 'combo', renderer: this.renderWorked},
                {
                    xtype: 'actioncolumn',
                    width: 30,
                    sortable: false,
                    menuDisabled: true,
                    items: [{
                        icon: 'images/default/delete.png',
                        tooltip: this.toolFormText,
                        scope: this,
                        handler: function(grid, rowIndex, colIndex) {
                            Ext.Msg.confirm(this.questionTitle, this.questionText, function (button) {
                                if (button === 'yes') {
                                    this.onNoDependent();

                                }
                            }, this);
                        }
                    }]
                }
            ]
        };
        this.callParent();
    },

    // override initEvents
    initEvents: function() {
        // call the superclass's initEvents implementation
        this.callParent();

        // now add application specific events
        // notice we use the selectionmodel's rowselect event rather
        // than a click event from the grid to provide key navigation
        // as well as mouse navigation
        //this.on('edit', this.onCellEdit, this);
        var gridEmployeeSM = this.getSelectionModel();
        gridEmployeeSM.on('selectionchange', this.onRowSelect, this);
    },

    renderWorked: function(value, metaData, record, rowIndex, colIndex, store){
        var valueReturn = (value === true)?this.trueText:this.falseText;
        var FieldReturn = (value === true)?'<span style="color:green;">' + valueReturn + '</span>':'<span style="color:red;">' + valueReturn + '</span>';
        return FieldReturn;
    },
    
    onNoDependent: function(obj, id, component, icon, event, record, other) {
        var gridSM = this.up('panel').getComponent('gridEmployees').getSelectionModel().getSelection()[0];
        var rec = new Asgard.model.EmployeesDependants({
            id: gridSM.get('id')
        });
        Ext.Ajax.request({
            url: 'hcm/addemployeesdependants',
            params: {
                action: 'add',
                id: gridSM.get('id'),
                id_dependant: 0,
                surname: 'NONE',
                lastname: null,
                firstname: 'NONE',
                birthday: Ext.util.Format.date(9999-12-31,'Y-m-d'),
                type: 'none',
                gender: 'none',
                user_id: null,
                date_creation: null
            },
            scope: this,
            success: function(response){
                var text = response.responseText;
                this.getStore().reload();
                // process server response here
            },
            failure: function(response){
                var text = response.responseText;
                //console.log(text);
                // 
            }
        });
    },
    
    onCellEdit: function( editor, e) {
        if( e.originalValue !== '' && e.originalValue !== e.value ){
            var record = this.getStore().getAt(e.rowIdx);
            var valueUpdated;
            if(e.field === 'birthday'){
                valueUpdated = Ext.util.Format.date(e.value,'Y-m-d');
            }else{
                valueUpdated = e.value;
            }
            var fieldName = e.field;
            Ext.Ajax.request({
            url: 'hcm/updemployees',
            params: {
                action: 'upd',
                id: record.data.id,
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
    // add a method called onRowSelect
    // This matches the method signature as defined by the 'rowselect'
    // event defined in Ext.selection.RowModel
    onRowSelect: function(sm, rs) {
        // getComponent will retrieve itemId's or id's. Note that itemId's
        // are scoped locally to this instance of a component to avoid
        // conflicts with the ComponentManager
        if (rs.length) {
            var data = rs[0].getData();
            var gridEmployeeDependants = this.up('panel').getComponent('gridEmployeeDependants');
            //console.log(rs[0].getData().id);
            gridEmployeeDependants.getStore().load({params: { uid: data.id }});
            //detailPanel.update(rs[0].getData());
        }
    },
    
    createWindow: function() {
        var windowDoc = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowDoc;
    },
    
    makeTreatment: function(obj, id, component, icon, event, record, other) {
        console.log(obj);
        console.log(id);
        console.log(component);
        console.log(icon);
        console.log(event);
        console.log(other);
        var win = this.createWindow();
        var document = Ext.create('Asgard.lib.forms.RequestTreatment', {
            flex: 1,
            baseParams: {
                country: record.data.country,
                company: record.data.company,
                location:  record.data.location,
                doc_id:  record.data.doc_id,
                doc_newid:  record.data.doc_newid
            }
        });
        win.add(document);
        win.show();
    }
    
});