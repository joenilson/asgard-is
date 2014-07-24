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
Ext.define('Asgard.lib.Panels.DiagramView', {
    extend: 'Ext.view.View',
    layout: 'fit',
    diagramEmptyText: 'No process assigned',
    initComponent: function() {
        this.comps = [];
        this.emptyText = this.diagramEmptyText;
        this.callParent();
    },

    listeners: {
        beforedestroy: function(view) {
            Ext.destroy(view.comps);
        },

        beforerefresh: function(view) {
            Ext.destroy(view.comps);
        }
    },

    prepareData: function(data) {
        this.callParent(arguments);
        this.comps.push(data.button = new Ext.button.Button({ text: data.value, width: '200px', path: data.id+'/'+data.parent_id+'/'+data.type, handler: fnButton }));
        return data;
    }
});