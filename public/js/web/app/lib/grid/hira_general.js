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
    flex: 1,
    //layout: 'fit',
    titleText: 'HIRA List',
    idText: 'Id',
    processText: 'Process',
    threadText: 'Thread',
    activityText: 'Activity',
    dangerText: 'Danger',
    riskText: 'Risk',
    evaluationHiraText: 'HIRA Evaluation',
    evaluationHiraHText: 'H',
    evaluationHiraMText: 'M',
    evaluationHiraLText: 'L',
    controlMeasuresText: 'Measures to be implemented',
    residualRiskText: 'Residual Risk Assessment',
    residualRiskHText: 'H',
    residualRiskMText: 'M',
    residualRiskLText: 'L',
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
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id_danger_risk', filter: false},
                {text: this.processText, flex: 1, sortable: false, hidden: false, dataIndex: 'process_sup_desc', filter: true, tdCls: 'wrapText'},
                {text: this.threadText, flex: 1, sortable: false, hidden: false, dataIndex: 'process_main_desc', filter: true, tdCls: 'wrapText'},
                {text: this.activityText, flex: 2, sortable: false, hidden: false, dataIndex: 'activity_desc', filter: true, tdCls: 'wrapText'},
                {text: this.dangerText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_danger', tdCls: 'wrapText'},
                {text: this.riskText, flex: 1.5, sortable: true, filter: true, dataIndex: 'desc_risk', tdCls: 'wrapText'},
                {text: this.evaluationHiraText,
                    columns: [{
                        text     : this.evaluationHiraHText,
                        width    : 50, sortable : true, filter: true,
                        align: 'center', dataIndex: 'eval_iper_h', renderer : this.riskleveler
                    }, {
                        text     : this.evaluationHiraMText,
                        width    : 50, sortable : true, filter: true,
                        align: 'center', renderer : this.riskleveler, dataIndex: 'eval_iper_m'
                    }, {
                        text     : this.evaluationHiraLText,
                        width    : 50, sortable : true, filter: true,
                        align: 'center', renderer : this.riskleveler, dataIndex: 'eval_iper_l'
                    }]
                },
            {text: this.controlMeasuresText, flex:3, sortable: true, filter: true, dataIndex: 'control_measures', tdCls: 'wrapText' },
            {text: this.residualRiskText,
                columns: [{
                    text     : this.residualRiskHText,
                    width    : 50, sortable : true, filter: true,
                    align: 'center', dataIndex: 'eval_risk_h', renderer : this.iskleveler
                }, {
                    text     : this.residualRiskMText,
                    width    : 50, sortable : true, filter: true,
                    align: 'center', renderer : this.riskleveler, dataIndex: 'eval_risk_m'
                }, {
                    text     : this.residualRiskLText,
                    width    : 50, sortable : true, filter: true,
                    align: 'center', renderer : this.riskleveler, dataIndex: 'eval_risk_l'
                }]
            }]
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
                    this.showWrongMessage();
                }
            }
        }else if(button.type==='expand'){
            var windowDoc = this.createWindow();
            windowDoc.setTitle('Upload Master Files');
            windowDoc.setHeight(250);
            winContent = Ext.create('Asgard.lib.forms.hiraMasterFileUpload');
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