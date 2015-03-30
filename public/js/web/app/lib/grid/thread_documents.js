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
Ext.define('Asgard.lib.grid.thread_documents',{
    extend: 'Asgard.lib.GridPanel',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    
    titleText: 'Related Documents',
    idText: 'Id',
    classDocText: 'Doc Classif',
    documentText: 'Document',
    recordText: 'Record',
    versionText: 'Version',
    statusText: 'Status',
    dateRevisionText: 'Revision Date',
    dateVersionText: 'Version Date',
    reviewText: 'Review',
    protectionText: 'Protection',
    locationText: 'Location',
    originText: 'Origin',
    retentionText: 'Retention Time',
    typeText: 'Status',
    toolViewDocText: 'View File',
    loadText: 'Loading document... please wait...',
    
    initComponent: function(){
        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'doc_id', filter: false},
                {text: this.classDocText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_classification', tdCls: 'wrapText'},
                {text: this.recordText, flex: 1.5, sortable: true, filter: true, dataIndex: 'doc_record', tdCls: 'wrapText'},
                {text: this.documentText, flex: 3, sortable: true, filter: true, dataIndex: 'doc_desc', tdCls: 'wrapText'},
                {text: this.typeText, flex: 1.5, sortable: true, filter: true, dataIndex: 'desc_type', tdCls: 'wrapText'},
                {text: this.versionText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_version_number', tdCls: 'wrapText'},
                //{text: this.dateVersionText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'doc_date_creation', tdCls: 'wrapText', xtype: 'datecolumn', format:'Y-m-d' },
                {text: this.dateRevisionText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'doc_date_revision_next', tdCls: 'wrapText', 
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                //{text: this.reviewText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_review', tdCls: 'wrapText'},
                //{text: this.protectionText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_protection', tdCls: 'wrapText'},
                //{text: this.locationText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_location', tdCls: 'wrapText'},
                //{text: this.originText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_origin', tdCls: 'wrapText'},
                //{text: this.retentionText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'desc_retention', tdCls: 'wrapText'},
                {xtype: 'actioncolumn', flex: 0.5, sortable: false, menuDisabled: true,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: this.showDocument
                        }
                    ]
                }
            ]
        };
        
        this.callParent();
    },
    createWindow: function(){
      var wDoc = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
        return wDoc;  
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
            loadingMessage: this.loadText
        });
        //windowDoc.alignTo(Ext.getBody(), "tr-tr", [-10, 10]);
        windowDoc.add(documentFile);
        windowDoc.show();
    }
});