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
Ext.define('Asgard.lib.grid.dndgrid', {
    extend: 'Ext.container.Container',
    
    requires: [
        'Ext.grid.*'
    ],    
    xtype: 'dd-grid-to-grid',
    width: 650,
    height: 300,
    layout: {
        type: 'hbox',
        align: 'stretch',
        padding: 5
    },
    idText: 'Id',
    activityText: 'Activity',
    firstGridText: 'Available Activities',
    secondGridText: 'Asigned Activities',
   
    initComponent: function(){
        var group1 = this.id + 'available',
            group2 = this.id + 'asigned',
            columns = [{
                text: this.idText, 
                flex: 1, 
                sortable: true, 
                dataIndex: 'name'
            }, {
                text: this.activityText, 
                width: 80, 
                sortable: true, 
                dataIndex: 'value'
            }];
            
        this.items = [{
            itemId: 'grid1',
            flex: 1,
            xtype: 'grid',
            multiSelect: true,
                viewConfig: {
                plugins: {
                    ptype: 'gridviewdragdrop',
                    dragGroup: group1,
                    dropGroup: group2
                },
                listeners: {
                    drop: function(node, data, dropRec, dropPosition) {
                        var dropOn = dropRec ? ' ' + dropPosition + ' ' + dropRec.get('value') : ' on empty view';
                        console.log(dropOn);
                    }
                }
            },
            columns: columns,
            stripeRows: true,
            title: this.firstGridText,
            tools: [{
                type: 'refresh',
                tooltip: 'Reset both grids',
                scope: this,
                handler: this.onResetClick
            }],
            margins: '0 5 0 0'
        }, {
            itemId: 'grid2',
            flex: 1,
            xtype: 'grid',
            viewConfig: {
                plugins: {
                    ptype: 'gridviewdragdrop',
                    dragGroup: group2,
                    dropGroup: group1
                },
                listeners: {
                    drop: function(node, data, dropRec, dropPosition) {
                        var dropOn = dropRec ? ' ' + dropPosition + ' ' + dropRec.get('name') : ' on empty view';
                        Ext.example.msg('Drag from left to right', 'Dropped ' + data.records[0].get('name') + dropOn);
                    }
                }
            },
            /*
            store: new Ext.data.Store({
                model: KitchenSink.model.dd.Simple
            }),
            */
            columns: columns,
            stripeRows: true,
            title: this.secondGridText
        }];

        this.callParent();
    },
    
    onResetClick: function(){
        //refresh source grid
        this.down('#grid1').getStore().loadData(this.myData);

        //purge destination grid
        this.down('#grid2').getStore().removeAll();
    }
});