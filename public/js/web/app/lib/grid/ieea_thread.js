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
Ext.define('Asgard.lib.grid.ieea_thread',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.ieeathread',
    autoShow: true,
    autoDestroy: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    width: 600,
    //height: 300,
    //width: 1700,
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
    
    trueText: 'Yes',
    falseText: 'No',
    
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
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id', filter: false},
                {text: this.enviromentalAspectText, width: 180, dataIndex: 'description', filter: true, tdCls: 'wrapText'},
                {text: this.enviromentalImpactText, width: 180, dataIndex: 'description_impact', filter: true, tdCls: 'wrapText'},
                {text: this.labelConditionText, 
                    columns: [
                        { text: this.normalConditionText, flex: 1, dataIndex: 'normal_condition', filter: true, renderer: this.conditionValue },
                        { text: this.abnormalConditionText, dataIndex: 'abnormal_condition', filter: true, renderer: this.conditionValue },
                        { text: this.emergencyConditionText, dataIndex: 'emergency_condition', filter: true, renderer: this.conditionValue }
                    ]
                },
                {text: this.labelQuantificationText, 
                    columns: [
                        {text: this.magnitudeText, dataIndex: 'magnitude', filter: true},
                        {text: this.severityText, dataIndex: 'severity', filter: true},
                        {text: this.consequenceText, dataIndex: 'consequence', filter: true},
                        {text: this.probabilityText, dataIndex: 'probability', filter: true},
                        {text: this.significanceText, dataIndex: 'significance', filter: true}
                    ]
                },
                {text: this.labelAssessmentText, 
                    columns: [
                        {text: this.significantText, dataIndex: 'significant', filter: true, renderer: this.yesnoRenderer },
                        {text: this.legalRequirementText, dataIndex: 'legal_requirement', filter: true, renderer: this.yesnoRenderer }
                    ]
                },
                {text: this.labelControlMeasuresText, 
                    columns: [
                        {text: this.operationalControlText, dataIndex: 'operational_control', filter: true},
                        {text: this.goalText, dataIndex: 'goal', filter: true},
                        {text: this.emergencyPlan, dataIndex: 'emergency_plan', filter: true}
                    ]
                },
                {text: this.tracingText, width: 220, dataIndex: 'tracing', filter: true, tdCls: 'wrapText'},
                {text: this.measurementText, width: 220, dataIndex: 'measurement', filter: true, tdCls: 'wrapText'}
            ]
        };
        
        this.callParent();
    },
    conditionValue: function(val) {
        var NewVal;
        if (val){
            NewVal = 'X';
        }else {
            NewVal = '';
        }
        return NewVal;
    },
    yesnoRenderer: function(val){
        var NewVal;
        if (val){
            NewVal = this.trueText;
            meta.tdCls = 'red-column';
        }else {
            NewVal = this.falseText;
            meta.tdCls = 'green-column';
        }
        return NewVal;
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
                            sendData.push(selectedItems[i].data.id_danger_risk);
                        }
                        Ext.Ajax.request({
                            url: 'ims/removeieea',
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
            winAdd.add(Ext.create('Asgard.lib.forms.ieeaNewEval'));
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
                winAdd.add(Ext.create('Asgard.lib.forms.ieeaIncidentCauses',{
                    baseParams: { incident_id: selectedItems[0].data.id,
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
            windowDoc.setTitle('Upload Master Files');
            windowDoc.setHeight(250);
            winContent = Ext.create('Asgard.lib.forms.ieeaMasterFileUpload');
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