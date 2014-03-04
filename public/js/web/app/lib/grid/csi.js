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
Ext.define('Asgard.lib.grid.csi',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.csi',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: true,
    frame: false,
    flex: 1,
    layout: 'fit',
    //width: 600,
    //height: 490,
    titleText: 'Customer Satisfaction Index',
    idText: 'Id',
    indicatorText: 'Indicator',
    weightText: 'Weight',
    formulaText: 'Calculation Method',
    scoreText: 'Score',
    indexText: 'Index',
    rankText: 'Final Calculation',
    
    toolAddText: 'Add Values',
    toolRemoveText: 'Remove Month Entry',
    toolChangeText: 'Change Item Values',

    initComponent: function(){
        
        this.tbar = [
            {
                text: 'Customer Satisfaction Index'
            }
        ];
        
        this.title = this.titleText,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id', filter: false},
                {text: this.indicatorText, sortable: false, hidden: true, dataIndex: 'description', filter: false},
                {text: this.weightText, sortable: false, hidden: true, dataIndex: 'weight', filter: false},
                {text: this.formulatText, flex: 1.5, sortable: true, filter: false, dataIndex: 'cs_formula', tdCls: 'wrapText'},
                {text: this.scoreText, flex: 1, sortable: true, filter: true, dataIndex: 'cs_score'},
                {text: this.indexText, flex: 1, sortable: true, filter: true, dataIndex: 'cs_scale'},
                {text: this.rankText, flex: 1,  sortable: true, filter: true, dataIndex: 'date_rank'}
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
        console.log(record.data.doc_original);
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
        console.log(obj);
        console.log(id);
        console.log(component);
        console.log(icon);
        console.log(event);
        console.log(other);
        var win = this.createWindow();
        var document = Ext.create('Asgard.lib.forms.RequestTreatment', {
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