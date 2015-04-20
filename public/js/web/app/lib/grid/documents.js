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
Ext.define('Asgard.lib.grid.documents',{
   extend: 'Asgard.lib.GridPanel',
   autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    typeDoc: '',
    sourceDoc: '',
    userRole: '',
    petitionerAlias: '',
    petitionerEmail: '',
    historyTitle: 'Document History',
    titleText: 'Document\'s Center',
    idText: 'Id',
    classDocText: 'Doc Classif',
    documentText: 'Document',
    threadText: 'Thread',
    recordText: 'Record',
    versionText: 'Version',
    typeText: 'Status',
    statusText: 'Status',
    dateRevisionText: 'Revision Date',
    dateVersionText: 'Version Date',
    dateIncorporationText: 'Incorporation Date',
    reviewText: 'Review',
    protectionText: 'Protection',
    ownerText: 'Owner',
    locationText: 'Location',
    originText: 'Origin',
    retentionText: 'Retention Time',
    toolViewDocText: 'View File',
    toolRequestText: 'Change Request',
    toolHistoryText: 'View Old Documents',
    toolAddText: 'Add Values',
    toolRemoveText: 'Remove Entry',
    toolChangeText: 'View Change Requests Queue',
    toolMassText: 'Upload Master File',
    titleNewDocument: 'Add new Document',
    titleEditDocument: 'Edit Document data',
    loadingFileText: 'Loading Document.. please wait...',
    chooseTitleText: 'Warning',
    regLocationText: 'Electronic or Physical Location',
    regReferenceText: 'Reference Document',
    emptyFileMessage: 'No document is linked to this record...',
    chooseTitleBodyDelete: 'You are choosing delete this item. <br />Would you like to save your changes?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    warningTitle: 'Warning!',
    emptyCCLText: 'Please fill the Company, Country and Locations items',
    emptyTitleText: 'No data selected',
    emptyMessageText: 'No one items was selected to process, <br />Please select one at last...',
    finalDisposeText:'Pasive File (PF) / Destruction (D)',
    minimalTimeText: 'Minimum Additional Conservation',
    toolsEnabled: true,
    
    initComponent: function(){
        this.title = this.titleText;
        if(this.toolsEnabled) {
            this.tools = [{
                type: 'history',
                tooltip: this.toolHistoryText,
                scope: this,
                handler: this.fnLibraryTool,
                hidden: (this.typeDoc==='REG' || this.sourceDoc === 'external' || this.userRole === 'Viewer')?true:false
            },{
                type: 'minus',
                tooltip: this.toolRemoveText,
                scope: this,
                handler: this.fnLibraryTool,
                hidden: (this.userRole === 'Viewer')?true:false
            },{
                type: 'gear',
                tooltip: this.toolChangeText,
                scope: this,
                handler: this.fnLibraryTool,
                hidden: (this.typeDoc==='REG' || this.sourceDoc === 'external' || this.userRole === 'Viewer')?true:false
            },{
                type: 'plus',
                tooltip: this.toolAddText,
                scope: this,
                handler: this.fnLibraryTool,
                hidden: (this.userRole === 'Viewer')?true:false
            },{
                type: 'expand',
                tooltip: this.toolMassText,
                scope: this,
                handler: this.fnLibraryTool,
                hidden: (this.userRole === 'Viewer')?true:false
            }];
        }
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, flex: 0.5, hidden: false, dataIndex: 'doc_id', filter: true},
                {text: this.classDocText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_classification', tdCls: 'wrapText', hidden: (this.typeDoc==='DOC' && this.sourceDoc !== 'external')?false:true},
                {text: this.threadText, flex: 1.5, sortable: true, filter: true, dataIndex: 'desc_thread', tdCls: 'wrapText', hidden: (this.typeDoc==='DOC' && this.sourceDoc !== 'external')?false:true},
                {text: this.recordText, flex: 1.5, sortable: true, filter: true, dataIndex: 'doc_record', tdCls: 'wrapText'},
                {text: this.documentText, flex: 3, sortable: true, filter: true, dataIndex: 'doc_desc', tdCls: 'wrapText'},
                {text: this.regReferenceText, flex: 1, sortable: true, filter: true, dataIndex: 'reg_reference', tdCls: 'wrapText', hidden: (this.typeDoc==='REG')?false:true },
                {text: this.retentionText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'desc_retention', tdCls: 'wrapText', hidden: (this.typeDoc==='REG')?false:true },
                {text: this.typeText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_type', tdCls: 'wrapText', hidden: (this.typeDoc==='DOC' && this.sourceDoc !== 'external')?false:true},
                {text: this.versionText, flex: 0.5, sortable: true, filter: true, dataIndex: 'doc_version_number', tdCls: 'wrapText', hidden: (this.typeDoc==='DOC' && this.sourceDoc !== 'external')?false:true},
                //{text: this.dateVersionText, width: 80,  sortable: true, filter: true, dataIndex: 'doc_date_creation', tdCls: 'wrapText', xtype: 'datecolumn', format:'Y-m-d' },
                //{text: this.statusText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_status_general', tdCls: 'wrapText'},
                {text: this.dateRevisionText, flex: 1,  sortable: true, filter: true, dataIndex: 'doc_date_revision_next', tdCls: 'wrapText',  xtype: 'datecolumn', format:'Y-m-d', hidden: (this.typeDoc==='DOC' && this.sourceDoc !== 'external')?false:true },
                {text: this.dateIncorporationText, flex: 1,  sortable: true, filter: true, dataIndex: 'doc_date_revision_actual', tdCls: 'wrapText',  xtype: 'datecolumn', format:'Y-m-d', hidden: (this.typeDoc==='DOC' && this.sourceDoc === 'external')?false:true },                
                //{text: this.reviewText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_review', tdCls: 'wrapText'},
                //{text: this.protectionText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_protection', tdCls: 'wrapText'},
                //{text: this.ownerText, flex: 2, sortable: true, filter: 'combo', dataIndex: 'desc_owner', tdCls: 'wrapText'},
                //{text: this.originText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_origin', tdCls: 'wrapText'},
                {text: this.regLocationText, flex: 1,  sortable: true, filter: true, dataIndex: 'reg_location', tdCls: 'wrapText', hidden: (this.typeDoc==='REG')?false:true },
                {text: this.finalDisposeText, flex: 1,  sortable: true, filter: 'combo', dataIndex: 'desc_dispose', tdCls: 'wrapText', hidden: (this.typeDoc==='REG')?false:true },
                {text: this.minimalTimeText, flex: 1,  sortable: true, filter: 'combo', dataIndex: 'desc_regretention', tdCls: 'wrapText', hidden: (this.typeDoc==='REG')?false:true },
                {xtype: 'actioncolumn', flex: 1, sortable: false, menuDisabled: true, hidden: (this.typeDoc==='DOC' && this.sourceDoc !=='external')?false:true, 
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: this.showDocument
                        }, '-',
                        {
                            icon: 'images/default/edit.png',
                            tooltip: this.toolRequestText,
                            scope: this,
                            handler: showRequest
                        }
                    ]
                }
            ]
        };
        
        this.callParent();
    },
    fnLibraryTool: function(me, e, object, tool) {
        var me = this;
        var panel = tool.up('panel');
        var form = panel.up('panel').down('form');
        var values = form.getForm().getValues();
        var companies = values['companiesCombo'];
        var countries = values['countriesCombo'];
        var locations = values['locationsCombo'];
        var process_id = values['processCombo'];
        var winContent;
        if(companies.length !== 4){
            Ext.Msg.alert(me.warningTitle,me.emptyCCLText);
        }else{
            if(tool.type==='history'){
                var windowDoc = this.createWindow();
                windowDoc.setTitle(this.toolHistoryText);
                windowDoc.setWidth(document.documentElement.clientWidth - 50);
                windowDoc.setHeight(document.documentElement.clientHeight - 50);
                
                var DocsHistoryStore = Ext.create('Asgard.store.DocsLibrary');
                DocsHistoryStore.load({ params: { module: 'history', company: companies, country: countries, location: locations, process: process_id}});
                winContent = new Ext.create('Asgard.lib.grid.documents',{
                    store: DocsHistoryStore,
                    toolsEnabled: false,
                    titleText: this.historyTitle,
                    flex: 1
                });
                windowDoc.add(winContent);
                windowDoc.show();

            }else if(tool.type==='plus'){
                var windowDoc = this.createWindow();
                windowDoc.setTitle(this.toolAddText);
                //windowDoc.setHeight(200);
                winContent = new Ext.create('Asgard.lib.forms.docsNewDocument',{
                    sourceDoc: this.sourceDoc,
                    company: companies, country: countries, location: locations, 
                    flex: 1,
                    typeDoc: this.typeDoc,
                    autoScroll: true
                });
                windowDoc.add(winContent);
                windowDoc.show();

            }else if(tool.type==='gear'){
                var windowDoc = this.createWindow();
                windowDoc.setTitle(this.toolChangeText);
                windowDoc.setWidth(document.documentElement.clientWidth - 400);
                windowDoc.setHeight(document.documentElement.clientHeight - 50);
                innerStore.load({ params: { module: 'master', company: companies, country: countries, location: locations } });
                var grid = new Ext.create('Asgard.lib.grid.changeRequestQueue',{
                        store: innerStore,
                        flex: 1,
                        region: 'north'
                    });
                var detailPanel = this.detailPanel();
                winContent = Ext.create('Ext.Panel', {
                    frame: false,
                    width: 580,
                    flex: 1,
                    layout: 'border',
                    items: [
                        grid, detailPanel ]
                });
                
                grid.getSelectionModel().on('selectionchange', function(sm, selectedRecord) {
                    if (selectedRecord.length) {
                        detailPanel.update(Ext.htmlDecode(selectedRecord[0].data.desc_request));
                    }
                });
                windowDoc.add(winContent);
                windowDoc.show();

            }else if(tool.type==='expand') {
                var windowDoc = this.createWindow();
                windowDoc.setTitle(this.toolMassText);
                //console.log(me.typeDoc);
                //console.log(me.sourceDoc);
                winContent = Ext.create('Asgard.lib.forms.docsMasterFileUpload', { flex: 1, typeDoc: me.typeDoc, sourceDoc: me.sourceDoc });
                windowDoc.add(winContent);
                windowDoc.show();
            }else if(tool.type==='minus'){
                var selData = panel.getSelectionModel().getSelection();
                if(selData.length>0){
                    Ext.Msg.confirm(this.chooseTitleText,
                        this.chooseTitleBodyDelete,
                        function(buttonId) {
                            //console.log(buttonId);
                            if (buttonId === 'no') {

                            } else {
                                Ext.Ajax.request({
                                    url: 'ims/removedocument',
                                    params: {
                                        company: selData[0].data.company,
                                        country: selData[0].data.country,
                                        location: selData[0].data.location,
                                        id: selData[0].data.doc_id
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
                }else{
                    this.showEmptyMessage();
                }
            }
        }
    },
    showDocument: function(obj, id, component, icon, event, record){
        var windowDoc = this.createWindow();
        windowDoc.setTitle(record.data.doc_desc);
        var documentFile = Ext.create('Ext.ux.panel.PDF', {
            flex: 1,
            //layout: 'border',
            //width: '100%',
            width    : document.documentElement.clientWidth - 400,
            height   : document.documentElement.clientHeight - 50,
            pageScale: 1,                                           // Initial scaling of the PDF. 1 = 100%
            src      : record.data.doc_file, // URL to the PDF - Same Domain or Server with CORS Support
            loadingMessage: 'Cargando Documento'
        });
        //windowDoc.alignTo(Ext.getBody(), "tr-tr", [-10, 10]);
        windowDoc.add(documentFile);
        windowDoc.show();
    },
    detailPanel: function() {
        var detailsPanel = Ext.create('Ext.panel.Panel',{
            region: 'center',
            bodyPadding: 7,
            bodyStyle: "background: #ffffff;",
            html: 'Please Select a request to see the details.'
        });
         return detailsPanel;
    },
    createWindow: function() {
        var windowDocs = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'destroy',
                maximizable : true,
                layout: 'fit',
                flex: 1
            });
         return windowDocs;
    },
    showRequest: function(obj, id, component, icon, event, record){
        var windowDoc = this.createWindow();
        windowDoc.removeAll();
        windowDoc.setTitle('Change Request');
        var formRequest = new Ext.create('Asgard.lib.forms.docsChangeRequest',{
            flex: 1,
            baseParams: { doc_id: record.data.doc_id },
            petitionerFieldValue: this.petitionerAlias,
            emailFieldValue: this.petitionerEmail
        });

        windowDoc.add(formRequest);
        windowDoc.show();
    },
    showEmptyMessage: function(){
        var emptyMsg = Ext.MessageBox.show({
           title: this.emptyTitleText,
           msg: this.emptyMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.WARNING
        });
       return emptyMsg;

    }
});