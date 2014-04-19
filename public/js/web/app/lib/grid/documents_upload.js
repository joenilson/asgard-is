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
Ext.define('Asgard.lib.grid.documents_upload',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.documentsupload',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'Document\'s Mass Upload',
    idText: 'Id',
    classDocText: 'Doc Classif',
    typeText: 'Type',
    documentText: 'Document',
    recordText: 'Record',
    versionText: 'Version',
    statusText: 'Status',
    dateRevisionText: 'Revision Date',
    dateVersionText: 'Version Date',
    reviewText: 'Review',
    protectionText: 'Protection',
    ownerText: 'Owner',
    locationText: 'Location',
    originText: 'Origin',
    retentionText: 'Retention Time',
    fileText: 'File',
    //toolViewDocText: 'View File',
    
    initComponent: function(){
        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: true, dataIndex: 'doc_id', filter: true},
                {text: this.classDocText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'classification_desc', tdCls: 'wrapText'},
                {text: this.typeText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'type_desc', tdCls: 'wrapText'},
                {text: this.documentText, flex: 3, sortable: true, filter: true, dataIndex: 'description', tdCls: 'wrapText'},
                {text: this.recordText, flex: 1.5, sortable: true, filter: true, dataIndex: 'doc_record', tdCls: 'wrapText'},
                {text: this.versionText, flex: 1, sortable: true, filter: true, dataIndex: 'version_number', tdCls: 'wrapText'},
                {text: this.dateVersionText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'version_date', tdCls: 'wrapText', 
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                {text: this.statusText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_status_general', tdCls: 'wrapText'},
                {text: this.dateRevisionText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'revision_date', tdCls: 'wrapText', 
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                {text: this.reviewText, flex: 1, sortable: true, filter: true, dataIndex: 'review_desc', tdCls: 'wrapText'},
                {text: this.protectionText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'protection_desc', tdCls: 'wrapText'},
                {text: this.ownerText, flex: 1, sortable: true, filter: true, dataIndex: 'owner_desc', tdCls: 'wrapText'},
                {text: this.locationText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'location_desc', tdCls: 'wrapText'},
                {text: this.originText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'origin_desc', tdCls: 'wrapText'},
                {text: this.retentionText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'retention_desc', tdCls: 'wrapText'},
                {text: this.fileText, flex: 2, sortable: true, filter: true, dataIndex: 'filename', tdCls: 'wrapText'}
            ]
        };
        
        this.callParent();
    }
});