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
Ext.define('Asgard.lib.grid.inspectionprogram',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.gridinspectionprogram',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Inspection Program',
    idText: 'Id',
    nameText: 'Name',
    fileText: 'File',
    toolViewDocText: 'View File',
    toolAddText: 'Add Values',
    toolRemoveText: 'Remove Entry',
    toolChangeText: 'Change Entry',
    
    titleNewAuditor: 'Add new Inspection Program',
    titleEditAuditor: 'Edit Inspection Program data',
    loadingFileText: 'Loading Document.. please wait...',
    emptyFileMessage: 'No document is linked to this record...',
    
    chooseTitleText: 'Warning',
    chooseTitleBodyDelete: 'You are choosing delete this item. <br />Would you like to save your changes?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    
    processChangeValue: 'yes',
    
    initComponent: function(){
        var me = this;
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
                {text: this.nameText, flex: 3, sortable: false, hidden: false, dataIndex: 'description', filter: true},
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
        var windowAuditor = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowAuditor;
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
    
    processChange: function(event, e, object, tool){
        if(event!=='yes'){
            this.processChangeValue.setValue('no');
        }
    },
    
    fnLibraryTool: function(event, e, object, tool) {
        var me = this;
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
                windowDoc.setTitle(this.titleNewAuditor);
                winContent = new Ext.create('Asgard.lib.forms.ipNewInspectionProgram',{
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
                                url: 'ims/removeinspectionprogram',
                                params: {
                                    company: selData[0].data.company,
                                    country: selData[0].data.country,
                                    location: selData[0].data.location,
                                    year: selData[0].data.year_date,
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
                windowDoc.setTitle(this.titleEditAuditor);
                var selGrid = panel.getSelectionModel().getSelection();
                var AuditorId = selGrid[0].data.id;
                var AuditorCompany = selGrid[0].data.company;
                var AuditorCountry = selGrid[0].data.country;
                var AuditorLocation = selGrid[0].data.location;
                var AuditorYear = selGrid[0].data.year_date;
                var editAuditor = Ext.create('Asgard.lib.forms.ipNewInspectionProgram', { companiesValue: AuditorCompany, countriesValue: AuditorCountry, locationsValue: AuditorLocation, innerPanel: panel, baseParams: { ip_id: AuditorId }});
                editAuditor.getForm().load({
                    url: 'ims/forminspectionprogram',
                    params: { id: AuditorId, country: AuditorCountry, company: AuditorCompany, location: AuditorLocation, year: AuditorYear },
                    failure: function(form, action) {
                        Ext.Msg.alert(me.warningTitle, action.result.errorMessage);
                    }
                });
                windowDoc.add(editAuditor);
                windowDoc.show();
            }
        }  
    },
    
    showDocument: function(obj, id, component, icon, event, record){
        if(record.data.filename!==''){
            var windowDoc = this.createWindow();
            //windowDoc.removeAll();
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