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
Ext.define('Asgard.lib.grid.objetives',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.objetives',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    //region: 'west',
    //collapsible: true,
    flex: 1,
    titleText: 'IMS Objetives',
    idText: 'Id',
    policyText: 'Policy',
    objetivesText: 'Objetives',
    indicatorsText: 'Indicators',
    goalText: 'Goal',
    goalcontrolText: 'Goal Control',
   
    initComponent: function(){
        this.features = [{
            id: 'group',
            ftype: 'groupingsummary',
            groupHeaderTpl: '{name}',
            hideGroupedHeader: true,
            enableGroupingMenu: true
        }];

        this.title = this.titleText;
        this.store = Ext.create('Asgard.store.HiraIncidentsDetails');
        this.columns =  {
            /*
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            */
            items: [
                {text: this.idText, flex: 1, sortable: true, dataIndex: 'id', filter: true, summaryType: 'count'},
                {text: this.policyText, flex: 4, sortable: true, filter: 'combo', dataIndex: 'policy', tdCls: 'wrapText'},
                {text: this.objetivesText, flex: 2, sortable: true, filter: 'combo', dataIndex: 'objetives', tdCls: 'wrapText'},
                {text: this.indicatorsText, flex: 2, sortable: true, filter: 'combo', dataIndex: 'indicators', tdCls: 'wrapText'},
                {text: this.goalText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'goal', tdCls: 'wrapText'},
                {text: this.goalcontrolText, flex: 4, sortable: true, filter: 'combo', dataIndex: 'goal_control', tdCls: 'wrapText'}
            ]
        };
        this.callParent();
    }

});