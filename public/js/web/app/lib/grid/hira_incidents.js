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
Ext.define('Asgard.lib.grid.hira_incidents',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.hiraincidents',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    titleText: 'Incidents List',
    idText: 'Id',
    nctypeText: 'Non Conformity',
    typeText: 'Type',
    descriptionText: 'Description',
    authorText: 'Author',
    processText: 'Process',
    threadText: 'Thread',
    emailText: 'Email',
    dateText: 'Date',
    statusText: 'Status',
    causesToolText: 'Incident Causes',
    closeToolText: 'Close Incident',
    validityToolText: 'Close Validity',
    deleteToolText: 'Delete Incident',
    addToolText: 'Add Incident',
    resultTitleText: 'Success',
    resultMessageText: 'incidents processed.',
    failureTitleText: 'Warning',
    failureMessageText: 'Server dont process the files, <br />please review your items.',
    buttonAcceptText: 'Save Upload',
    emptyTitleText: 'No data selected',
    emptyMessageText: 'No one items was selected to process, <br />Please select one at last...',
    wrongTitleText: 'Incorrect Status',
    wrongMessageText: 'The incident status is wrong, <br />Please review your Incident\'s Procedure...',
    chooseTitleText: 'Warning',
    chooseTitleBodyDelete: 'You are choosing delete this items. <br />Would you like to save your changes?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    titleCausesTool: 'Non Conformity Causes',
    valTreatment1: 'Open',
    valTreatment2: 'Closed',
    valTreatment4: 'Closed and Validated',
    initComponent: function(){
        var me = this;
        this.title = this.titleText;
        
        this.tools = [{
            type: 'gear',
            tooltip: this.causesToolText,
            scope: this,
            handler: this.fnLibraryTool
        },{
            type: 'save',
            tooltip: this.closeToolText,
            scope: this,
            handler: this.fnLibraryTool
        },{
            type: 'pin',
            tooltip: this.validityToolText,
            scope: this,
            handler: this.fnLibraryTool
        },{
            type: 'minus',
            tooltip: this.deleteToolText,
            scope: this,
            handler: this.fnLibraryTool
        },{
            type: 'plus',
            tooltip: this.addToolText,
            scope: this,
            handler: this.fnLibraryTool
        }];
        
        this.selType = 'checkboxmodel';
        this.columns =  {
            
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            
            items: [
                {text: this.idText, flex: 0.5, sortable: true, dataIndex: 'id_incident', filter: true },
                {text: this.nctypeText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'nonconformity_type_desc', tdCls: 'wrapText' },
                {text: this.typeText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'val_incident', tdCls: 'wrapText' },
                {text: this.descriptionText, flex: 3, sortable: true, filter: 'combo', dataIndex: 'description', tdCls: 'wrapText' },
                {text: this.authorText, flex: 2, sortable: true, filter: 'combo', dataIndex: 'owner_fullname', tdCls: 'wrapText' },
                {text: this.processText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'process_desc', tdCls: 'wrapText' },
                {text: this.threadText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'thread_desc', tdCls: 'wrapText' },
                {text: this.dateText, flex: 1, sortable: false, filter: true, dataIndex: 'date_incident', renderer : Ext.util.Format.dateRenderer('Y-m-d') }, 
                {text: this.statusText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'status', renderer: this.statusRender, tdCls: 'wrapText' }
            ]
        };
        this.callParent();
    },
    statusRender: function(val){
        if (val === 1) {
            return '<span style="color:' + 'red' + '; text-align: center;">' + this.valTreatment1 + '</span>';
        } else if (val === 2) {
            return '<span style="color:' + 'orange' + '; text-align: center;">' + this.valTreatment2 + '</span>';
        }else if (val === 4) {
            return '<span style="color:' + 'green' + '; text-align: center;">' + this.valTreatment4 + '</span>';
        }
        return val;
    },
    fnLibraryTool: function(object, event, panel, button){
        var me = this;
        //console.log(button);
        if(button.type==='minus'){
            var gridStore = this.getStore();
            var selectedItems = this.getSelectionModel().getSelection();
            
            if(selectedItems.length > 0){
                Ext.Msg.confirm(this.chooseTitleText,
                this.chooseTitleBodyDelete,
                function(buttonId) {
                    if (buttonId === 'no') {

                    } else {
                        var sendData = [];
                        for(i=0; i<selectedItems.length; i++){
                            sendData.push(selectedItems[i].data.id_incident);
                        }
                        Ext.Ajax.request({
                            url: 'ims/removeincidents',
                            params: {
                                data_ids: Ext.encode(sendData)
                            },
                            success: function(response){
                                var text = response.responseText;
                                var result = Ext.decode(text);
                                if(result.success){
                                    for(i=0; i<selectedItems.length; i++){
                                        gridStore.remove(selectedItems[i]);
                                    }
                                    me.showResultMessage(result.docs_processed);
                                }else{
                                    me.showFailureMessage();
                                }
                            }
                        }, this);
                    }
                }, this);
            }else{
                this.showEmptyMessage();
            }
            
        }else if(button.type==='plus'){
            var winAdd = Ext.create('Asgard.lib.window.windowGeneric',{
                height: document.documentElement.clientHeight - 50,
                innerPanel : this
            });
            winAdd.add(Ext.create('Asgard.lib.forms.hiraNewIncident'));
            winAdd.show();
        }else if(button.type==='gear'){
            var gridStore = this.getStore();
            var selectedItems = this.getSelectionModel().getSelection();
            if((selectedItems.length > 0) && (selectedItems[0].data.status === 1)){
                var winAdd = Ext.create('Asgard.lib.window.windowGeneric',{
                    height: document.documentElement.clientHeight - 50,
                    //width: document.documentElement.clientWidth - 450,
                    width: 550,
                    innerPanel : this
                });
                winAdd.setTitle(this.titleCausesTool);
                winAdd.add(Ext.create('Asgard.lib.forms.hiraIncidentCauses',{
                    baseParams: { incident_id: selectedItems[0].data.id_incident,
                                    company: selectedItems[0].data.company,
                                    country: selectedItems[0].data.country,
                                    location: selectedItems[0].data.location }
                }));
                winAdd.show();
            }else{
                if(selectedItems.length > 0){
                    this.showEmptyMessage();
                }else if(selectedItems[0].data.status !== 1){
                    var windowDoc = this.createWindow();
                    windowDoc.setTitle(this.titleEditAuditPlan);
                    var selGrid = panel.getSelectionModel().getSelection();
                    var IncidentId = selGrid[0].data.id;
                    var IncidentCompany = selGrid[0].data.company;
                    var IncidentCountry = selGrid[0].data.country;
                    var IncidentLocation = selGrid[0].data.location;
                    var viewIncidentCauses = Ext.create('Asgard.lib.forms.hiraIncidentCauses', { innerPanel: panel, baseParams: { incident_id: IncidentId }});
                    viewIncidentCauses.getForm().load({
                        url: 'ims/formincidentcauses',
                        params: { id: IncidentId, country: IncidentCountry, company: IncidentCompany, location: IncidentLocation },
                        failure: function(form, action) {
                            Ext.Msg.alert("Fallo Inesperado", action.result.errorMessage);
                        }
                    });
                    windowDoc.add(viewIncidentCauses);
                    windowDoc.show();
                }
            }
        }else if(button.type==='save'){
            var gridStore = this.getStore();
            var selectedItems = this.getSelectionModel().getSelection();
            if((selectedItems.length > 0) && (selectedItems[0].data.status === 1)){
                var winAdd = Ext.create('Asgard.lib.window.windowGeneric',{
                    height: document.documentElement.clientHeight - 50,
                    //width: document.documentElement.clientWidth - 450,
                    width: 450,
                    innerPanel : this
                });
                winAdd.setTitle(this.titleCloseTool);
                var CloseForm = Ext.create('Asgard.lib.forms.hiraIncidentClose',{
                    baseParams: { incident_id: selectedItems[0].data.id_incident },
                    objectIncidentValue: selectedItems[0].data.description
                });
                winAdd.add(CloseForm);
                winAdd.show();
            }else{
                if(selectedItems.length > 0){
                    this.showEmptyMessage();
                }else if(selectedItems[0].data.status !== 1){
                    this.showWrongMessage();
                }
            }
        }else if(button.type==='pin'){
            var gridStore = this.getStore();
            var selectedItems = this.getSelectionModel().getSelection();
            if((selectedItems.length > 0) && (selectedItems[0].data.status === 2)){
                var winAdd = Ext.create('Asgard.lib.window.windowGeneric',{
                    height: document.documentElement.clientHeight - 50,
                    width: 450,
                    innerPanel : this
                });
                winAdd.setTitle(this.titleValidityTool);
                var ValidityForm = Ext.create('Asgard.lib.forms.hiraIncidentValidity',{
                    baseParams: { incident_id: selectedItems[0].data.id_incident },
                    objectIncidentValue: selectedItems[0].data.description
                });
                winAdd.add(ValidityForm);
                winAdd.show();
            }else{
                if(selectedItems.length > 0){
                    this.showEmptyMessage();
                }else if(selectedItems[0].data.status !== 2){
                    this.showWrongMessage();
                }
            }
        }
    },
    
    createWindow: function() {
        var windowIncident = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowIncident;
    },
    showEmptyMessage: function(){
        var emptyMsg = Ext.MessageBox.show({
           title: this.emptyTitleText,
           msg: this.emptyMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.WARNING
        });
       return emptyMsg;

    },
    showWrongMessage: function(){
        var wrongMsg = Ext.MessageBox.show({
           title: this.wrongTitleText,
           msg: this.wrongMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.WARNING
        });
       return wrongMsg;

    },
    showResultMessage: function(items){
        var resultMsg = Ext.MessageBox.show({
           title: this.resultTitleText,
           msg: items+' '+this.resultMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.INFO
        });
       return resultMsg;
    },
    showFailureMessage: function(){
        var failureMsg = Ext.MessageBox.show({
           title: this.failureTitleText,
           msg: this.failureMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.WARNING
        });
       return failureMsg;

    }

});