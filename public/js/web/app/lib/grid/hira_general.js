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
Ext.define('Asgard.lib.grid.hira_general',{
    extend: 'Asgard.lib.GridPanel',
    autoShow: true,
    autoDestroy: true,
    border: false,
    frame: false,
    width: '100%',
    //layout: 'fit',
    titleText: 'HIRA List',
    hiraGeneralDescription: 'Description of the processes and activities',
    idText: 'Id',
    processText: 'Process',
    threadText: 'Thread',
    activityText: 'Activity',
    hiraIdentificationRiskFactors: 'Identification of risk factors',
    dangerCodeText: 'Code',
    dangerText: 'Danger',
    riskText: 'Risk',
    consequenceText: 'Consequence',
    hiraEvaluationDescription: 'Risk Assessment',
    freqencyText: 'Frequency (A)',
    severityText: 'Severity (B)',
    riskAssessmentText: 'Eval. (AxB)',
    classificationText: 'Classification',
    controlsText: 'Operational Controls',
    tracingText: 'Tracing',
    measurementText: 'Measurement',
    
    editToolText: 'Edit',
    deleteToolText: 'Delete',
    addToolText: 'Add',
    uploadToolText: 'Mass Upload',
    emptyTextText: 'No HIRA associated to this Location.',
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
    uploadMasterFiles: 'Upload template',
    
    greenVal: 'Low',
    blueVal: 'Moderate',
    yellowVal: 'Important',
    redVal: 'Critical',
    
    initComponent: function(){
        this.title = this.titleText;
        this.autoScroll = true;
        this.emptyText = this.emptyTextText;
        this.selType = 'checkboxmodel';
        this.tools = [{
            type: 'gear',
            tooltip: this.editToolText,
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
        },{
            type: 'expand',
            tooltip: this.uploadToolText,
            scope: this,
            handler: this.fnLibraryTool
        }];
    
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                { text: this.hiraGeneralDescription, 
                    columns: [
                        {text: this.idText, sortable: false, hidden: true, dataIndex: 'id', filter: false},
                        {text: this.processText, width: 160, sortable: false, hidden: false, dataIndex: 'process_main_desc', filter: false, tdCls: 'wrapText'},
                        {text: this.threadText, width: 160,  sortable: false, hidden: false, dataIndex: 'process_thread_desc', filter: false, tdCls: 'wrapText'},
                        {text: this.activityText, width: 160,  sortable: false, hidden: false, dataIndex: 'activity', filter: false, tdCls: 'wrapText'}                       
                    ]
                },
                {
                    text: this.hiraIdentificationRiskFactors,
                    columns: [
                        {text: this.dangerCodeText, width: 60,  sortable: true, filter: false, dataIndex: 'danger_code' },
                        {text: this.dangerText, width: 120,  sortable: true, filter: false, dataIndex: 'description_danger', tdCls: 'wrapText'},
                        {text: this.riskText, width: 120,  sortable: true, filter: false, dataIndex: 'description_risk', tdCls: 'wrapText'},
                        {text: this.consequenceText, width: 160, sortable: true, filter: false, dataIndex: 'description_consequence', tdCls: 'wrapText'}                       
                    ]
                },
                {
                    text: this.hiraEvaluationDescription,
                    columns: [
                        { text: this.freqencyText, width: 60, sortable: true, filter: false, dataIndex: 'danger_frequency' },
                        { text: this.severityText, width: 60, sortable: true, filter: false, dataIndex: 'danger_severity' },
                        { text: this.riskAssessmentText, width: 60, sortable: true, filter: false, dataIndex: 'danger_fxs' },
                        { text: this.classificationText, width: 80, sortable: true, filter: false, dataIndex: 'classification', renderer: this.riskLeveler }
                    ]
                },
                { text: this.controlsText, width: 180, sortable: true, filter: false, dataIndex: 'control_measures', tdCls: 'wrapText' },
                { text: this.tracingText, width: 180, sortable: true, filter: false, dataIndex: 'tracing', tdCls: 'wrapText' },
                { text: this.measurementText, width: 180, sortable: true, filter: false, dataIndex: 'measurement', tdCls: 'wrapText' }
            ]
        };
        
        this.callParent();
    },
    /**
    * Custom function used for column renderer
    * @param {Object} val
    */
    riskLeveler: function(val, meta) {
        switch(val){
            case 'low':
                meta.tdCls = 'green-column';
                val = this.greenVal;
                break;
            case 'moderate':
                meta.tdCls = 'blue-column';
                val = this.blueVal;
                break;
            case 'important':
                meta.tdCls = 'yellow-column';
                val = this.yellowVal;
                break;
            case 'critical':
                meta.tdCls = 'red-column';
                val = this.redVal;
                break;
        }
        return val;
    },
    
    fnLibraryTool: function(object, event, panel, button){
        var me = this;
        var panel = button.up('panel');
        var form = panel.up('panel').up('panel').down('form');
        var values = form.getForm().getValues();
        var companies = values['companiesCombo'];
        var countries = values['countriesCombo'];
        var locations = values['locationsCombo'];
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
                            sendData.push(selectedItems[i].data.id_danger_risk);
                        }
                        Ext.Ajax.request({
                            url: 'ims/removehiradocs',
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
            winAdd.add(Ext.create('Asgard.lib.forms.hiraNewIncident',{companiesValue: companies, countriesValue: countries, locationsValue: locations}));
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
                    this.showWrongMessage();
                }
            }
        }else if(button.type==='expand'){
            var windowDoc = this.createWindow();
            windowDoc.setTitle(this.uploadMasterFiles);
            windowDoc.setHeight(250);
            winContent = Ext.create('Asgard.lib.forms.hiraMasterFileUpload',{companiesValue: companies, countriesValue: countries, locationsValue: locations});
            windowDoc.add(winContent);
            windowDoc.show();
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