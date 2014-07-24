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
Ext.define('Asgard.lib.grid.requirements_upload',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.requirementsupload',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Requirements\'s Mass Upload',
    idText: 'Id',
    classDocText: 'Doc Classif',
    typeText: 'Type',
    documentText: 'Document',
    recordText: 'Code',
    statusText: 'Status',
    dateBeginText: 'Valid Begin',
    dateEndText: 'Valid Until',
    reviewText: 'Review',
    fileText: 'File',
    resultTitleText: 'Success',
    resultMessageText: 'requirements processed.',
    failureTitleText: 'Warning',
    failureMessageText: 'Server dont process the files, <br />please review your items.',
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
                            url: 'ims/processmassreqs',
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
                {text: this.idText, sortable: true,flex: 0.5, dataIndex: 'req_id', filter: true},
                {text: this.classDocText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'class_desc', tdCls: 'wrapText'},
                {text: this.typeText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'type_desc', tdCls: 'wrapText'},
                {text: this.documentText, flex: 3, sortable: true, filter: true, dataIndex: 'description', tdCls: 'wrapText', 
                    editor: { allowBlank: false }
                },
                {text: this.recordText, flex: 1.5, sortable: true, filter: true, dataIndex: 'code_req', tdCls: 'wrapText',
                    editor: { allowBlank: true }
                },
                {text: this.dateBeginText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'valid_begin', tdCls: 'wrapText', 
                    editor: { allowBlank: true }                },
                {text: this.dateEndText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'valid_end', tdCls: 'wrapText', 
                    editor: { allowBlank: true }
                },
                {text: this.fileText, flex: 2, sortable: true, filter: true, dataIndex: 'filename', tdCls: 'wrapText'}
            ]
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