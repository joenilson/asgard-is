/* 
 * Copyright (C) 2014 Joe Nilson <joenilson@gmail.com>
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
Ext.define('Asgard.lib.charts.Pie', {
    extend: 'Ext.chart.Chart',
    alias: 'widget.charts-pie',
    xtype: 'chart-pie',
    animate: true,
    shadow: true,
    legend: {
        position: 'right'
    },
    insetPadding: 60,
    theme: 'Base:gradients',
    initComponent: function () {
        var me = this;
        this.series = [{
            type: 'pie',
            field: 'number',
            showInLegend: true,
            donut: false,
            tips: {
                trackMouse: true,
                width: 200,
                height: 28,
                renderer: function (storeItem, item) {
                    //calculate percentage.
                    var total = 0;
                    me.getStore().each(function (rec) {
                        total += rec.get('number');
                    });
                    this.setTitle(storeItem.get('name') + ': ' + Math.round(storeItem.get('number') / total * 100) + '%');
                }
            },
            highlight: {
                segment: {
                    margin: 20
                }
            },
            label: {
                field: 'name',
                display: 'rotate',
                contrast: true,
                font: '12px Arial',
                renderer: function(item) {
                    var storeItem = me.getStore().findRecord('name', item);
                    return storeItem.get('name') + '\n ' + storeItem.get('number');
                }
            }
        }];

        this.callParent();
    }
});