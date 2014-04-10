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
Ext.define('Asgard.lib.grid.audits',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.gridaudits',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Audits List',
    idText: 'Id',
    nameText: 'Description',
    typeText: 'Type',
    dateText: 'Date',
    fileText: 'File',
    toolAddText: 'Add Values',
    toolRemoveText: 'Remove Entry',
    toolChangeText: 'Change Entry',
    toolViewDocText: 'View File',
    titleNewAudit: 'Add new Audit',
    titleEditAudit: 'Edit Audit data',
    loadingFileText: 'Loading Document.. please wait...',
    chooseTitleText: 'Warning',
    emptyFileMessage: 'No document is linked to this record...',
    chooseTitleBodyDelete: 'You are choosing delete this item. <br />Would you like to save your changes?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    
    processChangeValue: 'yes',
    
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
        }];
        this.title = this.titleText;
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, flex: 1, sortable: false, hidden: false, dataIndex: 'id', filter: true},
                {text: this.nameText, flex: 3, sortable: false, hidden: false, dataIndex: 'audit_desc', filter: true},
                {text: this.typeText, flex: 1, sortable: false, hidden: false, dataIndex: 'desc_type', filter: true},
                {text: this.dateText, flex: 1, sortable: false, hidden: false, dataIndex: 'audit_date', renderer : Ext.util.Format.dateRenderer('Y-m-d'), filter: true},
                {xtype: 'actioncolumn', flex: 1, sortable: false, menuDisabled: true,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: this.showDocument
                        }]
                }
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
                windowDoc.setTitle(this.titleNewAudit);
                winContent = new Ext.create('Asgard.lib.forms.auditsNewAudit',{
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
                                url: 'ims/removeaudit',
                                params: {
                                    company: selData[0].data.company,
                                    country: selData[0].data.country,
                                    location: selData[0].data.location,
                                    id: selData[0].data.id
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
                windowDoc.setTitle(this.titleEditAudit);
                var selGrid = panel.getSelectionModel().getSelection();
                var AuditId = selGrid[0].data.id;
                var AuditCompany = selGrid[0].data.company;
                var AuditCountry = selGrid[0].data.country;
                var AuditLocation = selGrid[0].data.location;
                var editAudit = Ext.create('Asgard.lib.forms.auditsNewAudit', { innerPanel: panel, baseParams: { audit_id: AuditId }});
                editAudit.getForm().load({
                    url: 'ims/formaudit',
                    params: { id: AuditId, country: AuditCountry, company: AuditCompany, location: AuditLocation },
                    failure: function(form, action) {
                        Ext.Msg.alert("Fallo Inesperado", action.result.errorMessage);
                    }
                });
                windowDoc.add(editAudit);
                windowDoc.show();
            }
        }  
    },
    showDocument: function(obj, id, component, icon, event, record){
        if(record.data.audit_file!==''){
            var windowDoc = this.createWindow();
            //windowDoc.removeAll();
            windowDoc.setTitle(record.data.audit_desc);
            var documentFile = Ext.create('Ext.ux.panel.PDF', {
                flex: 1,
                //layout: 'border',
                //width    : document.documentElement.clientWidth - 50,
                height   : document.documentElement.clientHeight - 50,
                pageScale: 1,                                           // Initial scaling of the PDF. 1 = 100%
                src      : '/'+record.data.audit_file, // URL to the PDF - Same Domain or Server with CORS Support
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