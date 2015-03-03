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
Ext.define('Asgard.lib.grid.output',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.ouputlist',
    layout: 'fit',
    border: false,
    frame: false,
    columnLines: true,
    emptyText: 'No content added yet.',
    viewConfig: {
          stripeRows: true
    },
    plugins: [{
            ptype: 'filterbar',
            renderHidden: false,
            showShowHideButton: false,
            showClearAllButton: false
        },
        Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 2
        })
    ],
    company: '',
    country: '',
    location: '',
    thread: '',
    lang: '',
    
    descriptionText: 'Description',
    idText: 'Id',
    role: 'Viewer',
    toolAddText: 'Add Values',
    toolRemoveText: 'Remove Entry',
    toolChangeText: 'Change Entry',
    titleTextOutput: 'Output',
    
    type_io: 'output',

    titleAlert: 'Warning',
    msgAlert: 'Choose some item',    

    selModel: {
        selType: 'checkboxmodel',
        mode: 'SINGLE',
        checkOnly: true
    },
    
    initComponent: function(){
        this.cellEditing = new Ext.grid.plugin.CellEditing({
            clicksToEdit: 2
        });
        
        this.plugins = [{
                ptype: 'filterbar',
                renderHidden: false,
                showShowHideButton: false,
                showClearAllButton: false
            },
            this.cellEditing
        ];

        this.tools = [{
            type: 'plus',
            tooltip: this.toolAddText,
            handler: this.onAddClick,
            scope: this,
            hidden: (this.role==='Admin'||this.role==='Edit')?false:true
        },{
            type: 'minus',
            tooltip: this.toolRemoveText,
            handler: this.onDelClick,
            scope: this,
            hidden: (this.role==='Admin'||this.role==='Edit')?false:true
        }];
    
        this.title = this.titleTextOutput;
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: true, hidden: true, dataIndex: 'id', filter: true},
                {text: this.descriptionText, flex: 2, sortable: true, hidden: false, dataIndex: 'description', filter: true, tdCls: 'wrapText', editor: { xtype: 'textfield', allowBlank: false } }
            ]
        };
        this.callParent();
    },
    
    initEvents: function() {
        // call the superclass's initEvents implementation
        this.callParent();
        this.on('edit', this.onCellEdit, this);
    },
    
    onCellEdit: function( editor, e, a, b, c) {
        //console.log('si estamos aqui');
        var record = this.getStore().getAt(e.rowIdx);
        if( e.originalValue !== e.value ){
            var valueUpdated = e.value;
            Ext.Ajax.request({
                url: 'ims/addprocessio',
                params: {
                    action: 'upd',
                    company: record.data.company,
                    country: record.data.country,
                    location: record.data.location,
                    process: record.data.process,
                    thread: record.data.thread,
                    id: record.data.id,
                    type_io: record.data.type_io,
                    status: 'A',
                    field: 'description',
                    value: valueUpdated
                },
                scope: this,
                success: function(response){
                    var text = response.responseText;
                    this.getStore().reload();
                    // process server response here
                },
                failure: function(response){
                    var text = response.responseText;
                    // 
                }
            });
        }
    },
    
    onDelClick: function(f, e, b, c) {
        var me = this; 
        var gridSM = me.getSelectionModel().getSelection()[0];
        var record = this.getStore().getAt(e.rowIdx);
        if(gridSM !== undefined){
            Ext.Ajax.request({
                url: 'ims/addprocessio',
                params: {
                    action: 'del',
                    company: gridSM.get('company'),
                    country: gridSM.get('country'),
                    location: gridSM.get('location'),
                    process: gridSM.get('process'),
                    thread: gridSM.get('thread'),
                    id: gridSM.get('id'),
                    type_io: gridSM.get('type_io'),
                    field: 'description',
                    status: 'X',
                    value: gridSM.get('description')
                },
                scope: this,
                success: function(response){
                    var text = response.responseText;
                    this.getStore().reload();
                    // process server response here
                },
                failure: function(response){
                    var text = response.responseText;
                    // 
                }
            });
        }else{
            Ext.Msg.alert(me.titleAlert,me.msgAlert);
        }
    },
    
    onAddClick: function(){
        var me = this; 
        var rec = new Asgard.model.process_io({
            company: this.company,
            country: this.country,
            location: this.location,
            process: this.process,
            thread: this.thread,
            type_io: this.type_io
        });
        me.getStore().insert(0, rec);
        me.cellEditing.startEditByPosition({
            row: 0, 
            column: 1
        });
    }
});