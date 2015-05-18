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
Ext.define('Asgard.lib.grid.ieea_upload',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.ieeaupload',
    autoShow: true,
    autoDestroy: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    width: 600,
    titleText: 'IEEA List',
    idText: 'Id',
    processText: 'Process',
    threadText: 'Thread',
    evalDateText: 'Eval Date',
    evalTeamText: 'Eval Team',
    aspectCodeText: 'Aspect Code',
    enviromentalAspectText: 'Enviromental Aspect',
    enviromentalImpactText: 'Enviromental Impact',
    labelConditionText: 'Condition',
    normalConditionText: 'Normal',
    abnormalConditionText: 'Abnormal',
    emergencyConditionText: 'Emergency',
    labelQuantificationText: 'Quantification',
    emergencyCondition: 'Emergency',
    magnitudeText: 'Magnitude',
    severityText: 'Severity',
    consequenceText: 'Consequence',
    probabilityText: 'Probability',
    significanceText: 'Significance',
    labelAssessmentText: 'Assessment',
    significantText: 'Significant',
    legalRequirementText: 'Legal Requirement',
    labelControlMeasuresText: 'Control Measures',
    operationalControlText: 'Operational Control',
    goalText: 'Goal',
    emergencyPlan: 'Emergency',
    tracingText: 'Tracing',
    measurementText: 'Measurement',
    
    editToolText: 'Edit',
    deleteToolText: 'Delete',
    addToolText: 'Add',
    uploadToolText: 'Mass Upload',
    emptyTextText: 'No IEEA associated to this Location.',
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
    viewConfig: {
        stripeRows: true
    },

    initComponent: function(){
        var me = this;
        this.title = this.titleText;
        this.autoScroll = true;
        this.emptyText = this.emptyTextText;
        this.selType = 'checkboxmodel';
        this.columnLines = true;
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
                            url: 'ims/processmassieea',
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
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id', filter: false},
                {text: this.processText, width: 120, sortable: false, hidden: false, dataIndex: 'desc_process', filter: 'combo', tdCls: 'wrapText'},
                {text: this.threadText, width: 100, sortable: false, hidden: false, dataIndex: 'desc_thread', filter: 'combo', tdCls: 'wrapText'},
                {text: this.enviromentalAspectText, width: 100, sortable: false, hidden: false, dataIndex: 'description', filter: 'combo', tdCls: 'wrapText'},
                {text: this.enviromentalImpactText, width: 120, sortable: false, hidden: false, dataIndex: 'description_impact', filter: true, tdCls: 'wrapText'},
                {text: this.labelConditionText, 
                    columns: [
                        {text: this.normalConditionText, flex: 1, sortable: false, hidden: false, dataIndex: 'normal_condition', filter: true},
                        {text: this.abnormalConditionText, sortable: false, hidden: false, dataIndex: 'abnormal_condition', filter: true},
                        {text: this.emergencyConditionText, sortable: false, hidden: false, dataIndex: 'emergency_condition', filter: true}
                    ]
                },
                {text: this.labelQuantificationText, 
                    columns: [
                        {text: this.magnitudeText, sortable: false, hidden: false, dataIndex: 'magnitude', filter: true},
                        {text: this.severityText, sortable: false, hidden: false, dataIndex: 'severity', filter: true},
                        {text: this.consequenceText, sortable: false, hidden: false, dataIndex: 'consequence', filter: true},
                        {text: this.probabilityText, sortable: false, hidden: false, dataIndex: 'probability', filter: true},
                        {text: this.significanceText, sortable: false, hidden: false, dataIndex: 'significance', filter: true}
                    ]
                },
                {text: this.labelAssessmentText, 
                    columns: [
                        {text: this.significantText, sortable: false, hidden: false, dataIndex: 'significant', filter: true},
                        {text: this.legalRequirementText, sortable: false, hidden: false, dataIndex: 'legal_requirement', filter: true}
                    ]
                },
                {text: this.labelControlMeasuresText, 
                    columns: [
                        {text: this.operationalControlText, sortable: false, hidden: false, dataIndex: 'operational_control', filter: true},
                        {text: this.goalText, sortable: false, hidden: false, dataIndex: 'goal', filter: true},
                        {text: this.emergencyPlan, sortable: false, hidden: false, dataIndex: 'emergency_plan', filter: true}
                    ]
                },
                {text: this.tracingText, width: 50, sortable: false, hidden: false, dataIndex: 'tracing', filter: true, tdCls: 'wrapText'},
                {text: this.measurementText, width: 50, sortable: false, hidden: false, dataIndex: 'measurement', filter: 'combo', tdCls: 'wrapText'}
            ]
        };
        
        this.callParent();
    },
    /**
    * Custom function used for column renderer
    * @param {Object} val
    */
    riskleveler: function(val, meta) {
        if (val < 9 && val > 0) {
            meta.tdCls = 'red-column';
        } else if (val < 16 && val > 8) {
            meta.tdCls = 'yellow-column';
        } else if (val > 15) {
            meta.tdCls = 'green-column';
        }
        return val;
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