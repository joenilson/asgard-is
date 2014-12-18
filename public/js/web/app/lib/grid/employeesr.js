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

Ext.define('Asgard.lib.grid.employeesr',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.gridemployeesr',
    itemId: 'gridEmployeesr',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Employees Report',
    idText: 'Id',
    surnameText: 'Surname',
    lastnameText: 'Last Name',
    firstnameText: 'First Name',
    positionText: 'Position',
    organizationText: 'Organization',
    birthdayText: 'Birthday',
    ageText: 'Age',
    loadingText: 'Searching for data...',
    toolFormText: 'Export Report',
    maritalStatusText: 'Couple',
    childrenMaleText: 'Children Male',
    childrenFemaleText: 'Children Female',
    workedText: 'Processed',
    isAdmin: false,
    yesText: 'Yes',
    noText: 'No',
    falseText: 'Pending',
    trueText: 'Processed',
    
    questionTitle: 'No Dependents',
    questionText: 'Do you want to mark this employee without dependants?',

    textTitle: 'Confirm Download',
    textMessage: 'Would you like to download the chart as an image?',
    textButtonDownload: 'Save Chart',
    textButtonDownloadData: 'Download Data',
    textButtonResumeDependents: 'Dependents Resume',
    textButtonCoupleRange: 'Couple age range',
    textButtonChildrenRange: 'Children age range',
    
    requires: [
        'Ext.selection.CellModel',
        'Ext.grid.*',
        'Ext.data.*',
        'Ext.util.*',
        'Ext.form.*',
        'Asgard.view.override.Grid',
        'Asgard.model.Employeesr'
    ],
    
    initComponent: function(){
        var me = this;
        this.dockedItems = [{
            xtype: 'toolbar',
            dock: 'top',
            items: [{
                xtype: 'button',
                text: this.textButtonDownloadData,
                disabled: (!this.isAdmin)?true:false,
                handler: function(b, e) {
                    b.up('grid').downloadExcelXml();
                }
            },{
                xtype: 'button',
                text: this.textButtonResumeDependents,
                type: 'type',
                scope: this,
                handler: me.onShowReport
            },{
                xtype: 'button',
                text: this.textButtonCoupleRange,
                type: 'couple',
                scope: this,
                handler: me.onShowReport
            },{
                xtype: 'button',
                type: 'children',
                text: this.textButtonChildrenRange,
                scope: this,
                handler: me.onShowReport
            }]
        }];
        
        this.title = this.titleText;
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'id', filter: true},
                {text: this.surnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'surname', filter: true},
                {text: this.lastnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'lastname', filter: true},
                {text: this.firstnameText, flex: 1, sortable: true, hidden: false, dataIndex: 'firstname', filter: true},
                {text: this.positionText, flex: 1,sortable: true, hidden: false, dataIndex: 'position', filter: 'combo'},
                {text: this.organizationText, flex: 1,sortable: true, hidden: false, dataIndex: 'work', filter: 'combo'},
                {text: this.birthdayText, flex: 0.5,sortable: true, hidden: false, dataIndex: 'birthday', filter: true },
                {text: this.ageText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'age', filter: true },
                {text: this.workedText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'processed', filter: 'combo', renderer: this.renderWorked },
                {text: this.maritalStatusText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'marital_status', filter: 'combo', renderer: this.renderYesNo },
                {text: this.childrenMaleText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'children_male', filter: true },
                {text: this.childrenFemaleText, flex: 0.5, sortable: true, hidden: false, dataIndex: 'children_female', filter: true }
            ]
        };
        this.callParent();
    },

    renderWorked: function(value, metaData, record, rowIndex, colIndex, store){
        var valueReturn = (value === true)?this.trueText:this.falseText;
        var FieldReturn = (value === true)?'<span style="color:green;">' + valueReturn + '</span>':'<span style="color:red;">' + valueReturn + '</span>';
        return FieldReturn;
    },
    
    renderYesNo: function(value, metaData, record, rowIndex, colIndex, store){
        var valueReturn = (value === 'yes')?this.yesText:this.noText;
        var FieldReturn = (value === 'yes')?'<span style="color:green;">' + valueReturn + '</span>':'<span style="color:red;">' + valueReturn + '</span>';
        return FieldReturn;
    },
    
    createWindow: function() {
        var me = this;
        var windowDoc = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'destroy',
                maximizable : true,
                layout: 'fit',
                width: 640,
                height: 480,
                tbar: [{
                    text: this.textButtonDownload,
                    handler: function() {
                        Ext.MessageBox.confirm(me.textTitle, me.textMessage, function(choice){
                            if(choice === 'yes'){
                                Ext.getCmp('remployees-chart').save({
                                    type: 'image/png'
                                });
                            }
                        });
                    }
                }]
            });
         return windowDoc;
    },
    
    onShowReport: function(button){
        var me = this;
        //console.log(button);
        var values = button.up('panel').up('panel').items.getAt(0).getForm().getValues();
        var offices_values = values['officesCombo'];
        var win = this.createWindow();
        var storeChart = Ext.create('Asgard.store.rEmployeesGrouped').load({ params: { type: button.type, offices: offices_values } });
        var chart = Ext.create('Asgard.lib.charts.Pie', {
            flex: 1,
            id: 'remployees-chart',
            store: storeChart
        });
        win.add(chart);
        win.show();
    }    
});