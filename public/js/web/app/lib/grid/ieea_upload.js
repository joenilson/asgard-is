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
    //height: 300,
    //width: 1700,
    titleText: 'IEEA List',
    idText: 'Id',
    IdTypeText: 'Type',
    IdCycleText: 'Cycle',
    IdProcessText: 'Process',
    IdThreadText: 'Thread',
    IdEaText: 'Environmental Aspects',
    IdEiText: 'Environmental Impact',
    QuantityText: 'Quantity',
    UnitMeasureText: 'Unit M',
    InfluenceText: 'Influence',
    MagnitudeText: 'Magnitude',
    FrequencyText: 'Frequency',
    EImpactText: 'E Impact',
    SaveText: 'Savings',
    TNormalCText: 'Total Normal Condition',
    LegalReqText: 'Legal Requirements',
    CorporativeReqText: 'Corporative Requirements',
    VoluntaryReqText: 'Voluntary Requirements',
    TotalReqText: 'Total Normal Condition',
    AbnormalHaAText: 'a',
    AbnormalHaBText: 'b',
    AbnormalHaCText: 'c',
    AbnormalHaDText: 'd',
    AbnormalImEText: 'e',
    AbnormalImFText: 'f',
    AbnormalSuGText: 'g',
    AbnormalConditionsText: 'Abnormal Conditions',
    AbnormalFactorText: 'Abnormal Factor',
    AbnormalTableText: 'Abnormal Table',
    RankingText: 'Ranking',
    StatusText: 'Status',
    haText: 'Human Aspects',
    imText: 'Instructions and Machines',
    suText: 'Sustance Nature',
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
                {text: this.IdTypeText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_type', filter: true, tdCls: 'wrapText'},
                {text: this.IdCycleText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_cycle', filter: true, tdCls: 'wrapText'},
                {text: this.IdProcessText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_process', filter: true, tdCls: 'wrapText'},
                {text: this.IdThreadText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_thread', filter: true, tdCls: 'wrapText'},
                {text: this.IdEaText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_ea', filter: true, tdCls: 'wrapText'},
                {text: this.IdEiText, width: 150, sortable: false, hidden: false, dataIndex: 'desc_ei', filter: true, tdCls: 'wrapText'},
                {text: this.QuantityText, width: 50, sortable: false, hidden: false, dataIndex: 'quantity', filter: true, tdCls: 'wrapText'},
                {text: this.UnitMeasureText, width: 50, sortable: false, hidden: false, dataIndex: 'desc_unit_measure', filter: true, tdCls: 'wrapText'},
                {text: this.InfluenceText, width: 50, sortable: false, hidden: false, dataIndex: 'influence', filter: true, tdCls: 'wrapText'},
                {text: this.MagnitudeText, width: 50, sortable: false, hidden: false, dataIndex: 'magnitude', filter: true, tdCls: 'wrapText'},
                {text: this.FrequencyText, width: 50, sortable: false, hidden: false, dataIndex: 'frequency', filter: true, tdCls: 'wrapText'},
                {text: this.EImpactText, width: 50, sortable: false, hidden: false, dataIndex: 'e_impact', filter: true, tdCls: 'wrapText'},
                {text: this.SaveText, width: 50, sortable: false, hidden: false, dataIndex: 'save', filter: true, tdCls: 'wrapText'},
                {text: this.TNormalCText, width: 50, sortable: false, hidden: false, dataIndex: 't_normal_c', filter: true, tdCls: 'wrapText'},
                {text: this.LegalReqText, width: 50, sortable: false, hidden: false, dataIndex: 'legal_req', filter: true, tdCls: 'wrapText'},
                {text: this.CorporativeReqText, width: 50, sortable: false, hidden: false, dataIndex: 'corporative_req', filter: true, tdCls: 'wrapText'},
                {text: this.VoluntaryReqText, width: 50, sortable: false, hidden: false, dataIndex: 'voluntary_req', filter: true, tdCls: 'wrapText'},
                {text: this.TotalReqText, width: 50, sortable: false, hidden: false, dataIndex: 'total_req', filter: true, tdCls: 'wrapText'},
                {text: this.AbnormalConditionsText,
                    columns: [
                        {
                            text: this.haText,
                            columns: [{
                                text     : this.AbnormalHaAText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_ha_a'
                            },{
                                text     : this.AbnormalHaBText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_ha_b'
                            },{
                                text     : this.AbnormalHaCText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_ha_c'
                            },{
                                text     : this.AbnormalHaDText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_ha_d'
                            }]
                        },{
                            text: this.imText,
                            columns: [{
                                text     : this.AbnormalImEText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_im_e'
                            },{
                                text     : this.AbnormalImFText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_im_f'
                            }]
                        },{
                            text: this.suText,
                            columns: [{
                                text     : this.AbnormalSuGText,
                                width    : 50, sortable : true, filter: true,
                                align: 'center', dataIndex: 'abnormal_su_g'
                            }]
                        }
                    ]
                },
                {text: this.AbnormalFactorText, width: 50, sortable: true, filter: true, dataIndex: 'abnormal_factor', tdCls: 'wrapText'},
                {text: this.AbnormalTableText, width: 50, sortable: true, filter: true, dataIndex: 'abnormal_table', tdCls: 'wrapText'},
                {text: this.RankingText, width: 50, sortable: true, filter: true, dataIndex: 'ranking', tdCls: 'wrapText'}
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