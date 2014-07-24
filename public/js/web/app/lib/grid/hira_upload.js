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
    resultTitleText: 'Success',
    resultMessageText: 'documents processed.',
    failureTitleText: 'Warning',
    failureMessageText: 'Server dont process the file, <br />please review your items.',
    //toolViewDocText: 'View File',
    buttonAcceptText: 'Save Upload',
    emptyTitleText: 'No data selected',
    emptyMessageText: 'No one items was selected to process, <br />Please select one at last...',
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
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id_danger_risk', filter: false},
                {text: this.processText, flex: 1, sortable: false, hidden: false, dataIndex: 'process_sup_desc', filter: 'combo', tdCls: 'wrapText'},
                {text: this.threadText, flex: 1, sortable: false, hidden: false, dataIndex: 'process_main_desc', filter: 'combo', tdCls: 'wrapText'},
                {text: this.activityText, flex: 2, sortable: false, hidden: false, dataIndex: 'activity_desc', filter: 'combo', tdCls: 'wrapText'},
                {text: this.dangerText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_danger', tdCls: 'wrapText'},
                {text: this.riskText, flex: 1.5, sortable: true, filter: true, dataIndex: 'desc_risk', tdCls: 'wrapText'},
                {text: this.evaluationHiraText,
                    columns: [{
                        text     : this.evaluationHiraHText,
                        width    : 50,
                        sortable : true,
                        filter: true,
                        align: 'center',
                        dataIndex: 'eval_iper_h',
                        renderer : this.riskleveler,
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }, {
                        text     : this.evaluationHiraMText,
                        width    : 50,
                        sortable : true,
                        filter: true,
                        align: 'center',
                        renderer :  this.riskleveler,
                        dataIndex: 'eval_iper_m',
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }, {
                        text     : this.evaluationHiraLText,
                        width    : 50,
                        sortable : true, 
                        filter: true,
                        align: 'center',
                        renderer : this.riskleveler,
                        dataIndex: 'eval_iper_l',
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }]
                },
            {text: this.controlMeasuresText, flex:3, sortable: true, filter: true, dataIndex: 'control_measures', 
                editor: {
                    xtype: 'textareafield', allowBlank: false
                },
                tdCls: 'wrapText'
            },
            {text: this.residualRiskText,
                columns: [{
                    text     : this.residualRiskHText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    dataIndex: 'eval_risk_h',
                    renderer : this.iskleveler,
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }, {
                    text     : this.residualRiskMText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    renderer : this.riskleveler,
                    dataIndex: 'eval_risk_m',
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }, {
                    text     : this.residualRiskLText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    renderer : this.riskleveler,
                    dataIndex: 'eval_risk_l',
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }]
            }]
        };
        
        this.callParent();
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