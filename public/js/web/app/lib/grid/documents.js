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
    
    titleText: 'Document\'s Center',
    idText: 'Id',
    classDocText: 'Doc Classif',
    documentText: 'Document',
    recordText: 'Record',
    versionText: 'Version',
    statusText: 'Status',
    dateActiveText: 'Date',
    reviewText: 'Review',
    protectionText: 'Protection',
    ownerText: 'Owner',
    locationText: 'Location',
    originText: 'Origin',
    retentionText: 'Retention Time',
    toolViewDocText: 'View File',
    toolRequestText: 'Change Request',
    
    
    initComponent: function(){
        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'doc_id', filter: false},
                {text: this.classDocText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_classification', tdCls: 'wrapText'},
                {text: this.documentText, flex: 3, sortable: true, filter: true, dataIndex: 'doc_desc', tdCls: 'wrapText'},
                {text: this.recordText, flex: 1.5, sortable: true, filter: true, dataIndex: 'doc_record', tdCls: 'wrapText'},
                {text: this.versionText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_version_number', tdCls: 'wrapText'},
                {text: this.statusText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_status_general', tdCls: 'wrapText'},
                {text: this.dateActiveText, flex: 1,  sortable: true, filter: true, dataIndex: 'doc_date_creation', tdCls: 'wrapText', 
                    xtype: 'datecolumn', format:'Y-m-d'
                    //renderer: Ext.util.Format.dateRenderer('d/m/Y') 
                },
                {text: this.reviewText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_review', tdCls: 'wrapText'},
                {text: this.protectionText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_protection', tdCls: 'wrapText'},
                {text: this.ownerText, flex: 1, sortable: true, filter: true, dataIndex: 'doc_owner', tdCls: 'wrapText'},
                {text: this.locationText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_location', tdCls: 'wrapText'},
                {text: this.originText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_origin', tdCls: 'wrapText'},
                {text: this.retentionText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'desc_retention', tdCls: 'wrapText'},
                {xtype: 'actioncolumn', flex: 1, sortable: false, menuDisabled: true,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: showDocument
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
    
});