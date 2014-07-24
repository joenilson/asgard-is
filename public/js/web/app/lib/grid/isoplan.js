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
Ext.define('Asgard.lib.grid.isoplan',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.gridisoplan',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    typeText: 'Process',
    layout: 'fit',
    idText: 'Id',
    titleText: 'Quality, Environment, Safety and Occupational Health Plan',
    processText: 'Process',
    threadText: 'Thread',
    ownerText: 'Owner',
    docText: 'Document',
    indicatorText: 'Indicator',
    varsText: 'Variables',
    recordfileText: 'Control Registry',
    frequencyText: 'Frequency',
    fileText: 'Document',
    toolAddText: 'Add Values',
    toolUploadText: 'Upload Template',
    toolRemoveText: 'Remove Entry',
    toolChangeText: 'Change Entry',
    toolViewDocText: 'View File',
    titleNewAuditPlan: 'Add new Record',
    titleEditAuditPlan: 'Edit Record',
    loadingFileText: 'Loading Document... please wait...',
    chooseTitleText: 'Warning',
    emptyFileMessage: 'No document is linked to this record...',
    chooseTitleBodyDelete: 'You are choosing delete this item. <br />Would you like to save your changes?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    processChangeValue: 'yes',
    userRole: 0,
    initComponent: function(){
        this.tools = [{
            type: 'minus',
            tooltip: this.toolRemoveText,
            handler: this.fnLibraryTool,
            scope: this
        },{
            type: 'gear',
            tooltip: this.toolChangeText,
            handler: this.fnLibraryTool,
            scope: this
        },{
            type: 'plus',
            tooltip: this.toolAddText,
            handler: this.fnLibraryTool,
            scope: this
        }
        /*
        ,{
            type: 'expand',
            tooltip: this.toolUploadText,
            handler: this.fnLibraryTool,
            scope: this
        }
        */
        ];
        
        this.features = [{
            ftype: 'grouping',
            groupHeaderTpl: this.typeText+': {name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})',
            hideGroupedHeader: true,
            startCollapsed: true,
            id: 'typeGrouping'
        }];
        
        this.title = this.titleText;
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: true, hidden: false, dataIndex: 'id', filter: true},
                {text: this.processText, flex: 1, sortable: true, hidden: false, dataIndex: 'desc_process', filter: true},
                {text: this.threadText, flex: 1, sortable: true, hidden: false, dataIndex: 'desc_thread', filter: true},
                {text: this.ownerText, flex: 1, sortable: true, hidden: false, dataIndex: 'desc_owner', filter: true},
                
                {text: this.indicatorText, flex: 2, sortable: true, hidden: false, dataIndex: 'desc_indicator', filter: true, tdCls: 'wrapText' },
                {text: this.varsText, flex: 2, sortable: true, hidden: false, dataIndex: 'variables', filter: true, tdCls: 'wrapText' },
                {text: this.recordfileText, flex: 1, sortable: true, hidden: false, dataIndex: 'record_file', filter: true},
                {text: this.frequencyText, flex: 1, sortable: true, hidden: false, dataIndex: 'desc_frequency', filter: true},
                {xtype: 'actioncolumn', flex: 0.5, sortable: false, menuDisabled: true, header: this.docText,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: this.showDocument
                        }]
                },
            ]
        };
        
        this.callParent();
    },

    createWindow: function() {
        var windowAudit = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowAudit;
    },
    
    chooseMessage: function(type) {
        var message = "";
        if(type==='delete'){
            message = this.chooseTitleBodyDelete;
        }else if(type==='change'){
            message = this.chooseTitleBodyChange;
        }
        var chooseMsg = Ext.MessageBox.show({
           title: this.chooseTitleText,
           msg: message,
           action: type,
           buttons: Ext.MessageBox.YESNO,
           fn: this.processChange,
           icon: Ext.MessageBox.QUESTION,
           scope: this
       });
       return chooseMsg;
    },
    
    EventHandler: function (type) {
        if (this.canContinue) {
            this.canContinue = false;
            return true;
        } else {
            return true;
        }
    },
    
    processChange: function(event, e, object, tool){
        if(event!=='yes'){
            this.processChangeValue.setValue('no');
        }
    },
    
    fnLibraryTool: function(event, e, object, tool) {
        var panel = tool.up('panel');
        var gridStore = panel.getSelectionModel().getSelection();
        var form = panel.up('panel').down('form');
        var values = form.getForm().getValues();
        var companies = values['companiesCombo'];
        var countries = values['countriesCombo'];
        var locations = values['locationsCombo'];
        var winContent;
        var windowDoc = this.createWindow();
        if(companies.length !== 4){
            Ext.Msg.alert('Advertencia','Escoja primero Compañia, Pais y Ubicacion');
        }else{
            windowDoc.removeAll();
            if(tool.type==='plus'){
                windowDoc.setTitle(this.titleNewAuditPlan);
                winContent = new Ext.create('Asgard.lib.forms.isoplanNewPlan',{
                    companiesValue: companies, countriesValue: countries, locationsValue: locations,
                    flex: 1,
                    innerPanel: panel
                });
                windowDoc.add(winContent);
                windowDoc.show();
            }else if(tool.type==='minus'){
                Ext.Msg.confirm(this.chooseTitleText,
                    this.chooseTitleBodyDelete,
                    function(buttonId) {
                        if (buttonId === 'no') {
                            
                        } else {
                            var selData = panel.getSelectionModel().getSelection();
                            var sendData = Ext.encode(selData[0].data);
                            Ext.Ajax.request({
                                url: 'ims/removeisoplan',
                                params: {
                                    company: selData[0].data.company,
                                    country: selData[0].data.country,
                                    location: selData[0].data.location,
                                    id: selData[0].data.id,
                                    type: selData[0].data.id_type
                                },
                                success: function(response){
                                    var text = response.responseText;
                                }
                            });
                            panel.getStore().remove(selData[0]);
                        }
                    },
                    this
                );
            }else if(tool.type==='gear'){
                windowDoc.setTitle(this.titleEditAuditPlan);
                var selGrid = panel.getSelectionModel().getSelection();
                var AuditId = selGrid[0].data.id;
                var AuditCompany = selGrid[0].data.company;
                var AuditCountry = selGrid[0].data.country;
                var AuditLocation = selGrid[0].data.location;
                var Type = selGrid[0].data.id_type;
                var editAuditPlan = Ext.create('Asgard.lib.forms.isoplanNewPlan', { companiesValue: AuditCompany, countriesValue: AuditCountry, locationsValue: AuditLocation, innerPanel: panel, baseParams: { mtm_id: AuditId, country: AuditCountry, company: AuditCompany, location: AuditLocation, type: Type }});
                editAuditPlan.getForm().load({
                    url: 'ims/formisoplan',
                    params: { id: AuditId, country: AuditCountry, company: AuditCompany, location: AuditLocation, type: Type },
                    failure: function(form, action) {
                        Ext.Msg.alert("Fallo Inesperado", action.result.errorMessage);
                    }
                });
                windowDoc.add(editAuditPlan);
                windowDoc.show();
            }else if(tool.type === 'expand'){
                windowDoc.setTitle('Upload Master Files');
                windowDoc.setHeight(250);
                winContent = Ext.create('Asgard.lib.forms.ohrMasterFileUpload');
                windowDoc.add(winContent);
                windowDoc.show();
            }
        }  
    },
    showDocument: function(obj, id, component, icon, event, record){
        if(record.data.filename!==''){
            var windowDoc = this.createWindow();
            windowDoc.setTitle(record.data.description);
            var documentFile = Ext.create('Ext.ux.panel.PDF', {
                flex: 1,
                //layout: 'border',
                //width    : document.documentElement.clientWidth - 50,
                height   : document.documentElement.clientHeight - 50,
                pageScale: 1,                                           // Initial scaling of the PDF. 1 = 100%
                src      : record.data.filename, // URL to the PDF - Same Domain or Server with CORS Support
                loadingMessage: this.loadingFileText
            });
            windowDoc.add(documentFile);
            windowDoc.show();
        }else{
            Ext.MessageBox.alert({
                title: this.chooseTitleText,
                msg: this.emptyFileMessage,
                icon: Ext.MessageBox.WARNING,
                buttons: Ext.MessageBox.OK,
                scope: this
            });
        }
    }
});