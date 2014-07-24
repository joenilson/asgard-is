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
Ext.define('Asgard.lib.grid.changeRequestQueue',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.changerequestqueue',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    width: 600,
    height: 490,
    //titleText: 'Change Request',
    idText: 'Id',
    docAffectedText: 'Doc Affected',
    descriptionText: 'Description',
    userText: 'User',
    dateText: 'Request Date',
    statusText: 'Status',
    
    toolViewDocText: 'View Request',
    toolViewOriginalText: 'View Original',
    toolRequestText: 'Treat requirement',

    initComponent: function(){
        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'doc_newid', filter: false},
                {text: this.docAffectedText, flex: 1.5, sortable: true, filter: true, dataIndex: 'doc_id'},
                {text: this.descriptionText, flex: 3, sortable: true, filter: true, dataIndex: 'doc_file', tdCls: 'wrapText'},
                {text: this.userText, flex: 1.5, sortable: true, filter: true, dataIndex: 'name_request'},
                {text: this.dateText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'date_request', 
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                {text: this.statusText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'status'},
                {xtype: 'actioncolumn', flex: 2, sortable: false, menuDisabled: true,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            handler: this.showDocument
                        },'-',
                        {
                            icon: 'images/default/16x16/view_blue.png',
                            tooltip: this.toolViewOriginalText,
                            scope: this,
                            handler: this.showOriginal
                        },'-',
                        {
                            icon: 'images/default/edit.png',
                            tooltip: this.toolRequestText,
                            scope: this,
                            handler: this.makeTreatment
                        }
                    ]
                }
            ]
        };
        
        this.callParent();
    },
    createWindow: function() {
        var windowDoc = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowDoc;
    },
    showDocument: function(obj, id, component, icon, event, record) {
        var win = this.createWindow();
        var document = Ext.create('Ext.ux.panel.PDF', {
            flex: 1,
            //width    : 450,
            height   : 500,
            pageScale: 1,                                           // Initial scaling of the PDF. 1 = 100%
            src      : record.data.doc_file // URL to the PDF - Same Domain or Server with CORS Support
        });
        win.add(document);
        win.show();
    },
    
    showOriginal: function(obj, id, component, icon, event, record) {
        var win = this.createWindow();
        var document = Ext.create('Ext.ux.panel.PDF', {
            flex: 1,
            //width    : 450,
            height   : 500,
            pageScale: 1,                                           // Initial scaling of the PDF. 1 = 100%
            src      : record.data.doc_original // URL to the PDF - Same Domain or Server with CORS Support
        });
        win.add(document);
        win.show();
    },
    
    makeTreatment: function(obj, id, component, icon, event, record, other) {
        var win = this.createWindow();
        var document = Ext.create('Asgard.lib.forms.RequestTreatment', {
            companiesValue: record.data.company, countriesValue: record.data.country, locationsValue: record.data.location,
            flex: 1,
            //innerItem: obj,
            baseParams: {
                country: record.data.country,
                company: record.data.company,
                location:  record.data.location,
                doc_id:  record.data.doc_id,
                doc_newid:  record.data.doc_newid
            }
        });
        win.add(document);
        win.show();
    }
    
});