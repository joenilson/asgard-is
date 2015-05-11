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
Ext.define('Asgard.lib.grid.hira_upload',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.hiraupload',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'HIRA\'s Mass Upload',
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
    
    evaluationHiraText: 'HIRA Evaluation',
    resultTitleText: 'Success',
    resultMessageText: 'documents processed.',
    failureTitleText: 'Warning',
    failureMessageText: 'Server dont process the file, <br />please review your items.',
    buttonAcceptText: 'Save Upload',
    emptyTitleText: 'No data selected',
    emptyMessageText: 'No one items was selected to process, <br />Please select one at last...',
    
    greenVal: 'Low',
    blueVal: 'Moderate',
    yellowVal: 'Important',
    redVal: 'Critical',
    
    initComponent: function(){
        var me = this;
        this.selType = 'checkboxmodel';
        this.cellEditing = new Ext.grid.plugin.CellEditing({
            clicksToEdit: 1
        });
        this.plugins =  [this.cellEditing],
        this.dockedItems = [{
            xtype: 'toolbar',
            ui: 'footer',
            dock: 'bottom',
            items: ['->', {
                text: this.buttonAcceptText,
                scope: this,
                handler: function(){
                    var gridStore = this.getStore();
                    var gridSel = this.getSelectionModel().getSelection();
                    if(gridSel.length > 0){
                        var sendData = [];
                        for(i=0; i<gridSel.length; i++){
                            sendData.push(gridSel[i].data);
                        }
                        Ext.Ajax.request({
                            url: 'ims/processmasshira',
                            params: {
                                data: Ext.encode(sendData)
                            },
                            success: function(response){
                                var text = response.responseText;
                                var result = Ext.decode(text);
                                if(result.success){
                                    for(i=0; i<gridSel.length; i++){
                                        gridStore.remove(gridSel[i]);
                                    }
                                    me.showResultMessage(result.docs_processed);
                                }else{
                                    me.showFailureMessage();
                                }
                            }
                        }, this);
                    }else{
                        this.showEmptyMessage();
                    }
                }
            }]
        }];

        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
        
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id', filter: false},
                { text: this.hiraGeneralDescription, 
                    columns: [
                        {text: this.processText, width: 160, sortable: false, hidden: false, dataIndex: 'process_main_desc', renderer: this.emptyVal, filter: true },
                        {text: this.threadText, width: 120, sortable: false, hidden: false, dataIndex: 'process_thread_desc', renderer: this.emptyVal, filter: true },
                        {text: this.activityText, width: 120, sortable: false, hidden: false, dataIndex: 'activity', renderer: this.emptyVal, filter: true }                       
                    ]
                },
                {
                    text: this.hiraIdentificationRiskFactors, 
                    columns: [
                        {text: this.dangerCodeText, width: 60, sortable: true, filter: 'combo', renderer: this.emptyVal, dataIndex: 'danger_code' },
                        {text: this.dangerText, width: 160, sortable: true, filter: true, dataIndex: 'description_danger', tdCls: 'wrapText'},
                        {text: this.riskText, width: 160, sortable: true, filter: true, dataIndex: 'description_risk', tdCls: 'wrapText'},
                        {text: this.consequenceText, width: 180, sortable: true, filter: true, dataIndex: 'description_consequence', tdCls: 'wrapText'}                       
                    ]
                },
                {
                    text: this.hiraEvaluationDescription, 
                    columns: [
                        { text: this.freqencyText, width: 60, sortable: true, filter: true, renderer : this.emptyVal, dataIndex: 'danger_frequency' },
                        { text: this.severityText, width: 60, sortable: true, filter: true, renderer : this.emptyVal, dataIndex: 'danger_severity' },
                        { text: this.riskAssessmentText, width: 60, sortable: true, filter: true, renderer : this.emptyVal, dataIndex: 'danger_fxs' },
                        { text: this.classificationText, flex: 1, sortable: true, filter: true, dataIndex: 'classification', renderer: this.riskLeveler }
                    ]
                },
                { text: this.controlsText, flex: 0.5, sortable: true, filter: true, dataIndex: 'control_measures', tdCls: 'wrapText' },
                { text: this.tracingText, flex: 1, sortable: true, filter: true, dataIndex: 'tracing', tdCls: 'wrapText' },
                { text: this.measurementText, flex: 1, sortable: true, filter: true, dataIndex: 'measurement', tdCls: 'wrapText' }
            ]
        };
        
        this.callParent();
    },
    
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
    
    emptyVal: function(val, meta) {
        if (val === null || val === '') {
            meta.tdCls = 'red-column';
        }
        return val;
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