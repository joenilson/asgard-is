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
Ext.define('Asgard.lib.Panels.ISOPlanPanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.isoplanpanel',
    store: undefined,
    attentive: true,
    companiesValue: '',
    countriesValue: '',
    locationsValue: '',
    store: '',
    initComponent: function() {
        var me = this;
        me.store = this.store;
        me.layout = { // don't set objects directly in class definitions
            type: 'accordion',
            align: 'stretch'
        };
        me.layoutConfig = { // dont set objects directly in class definitions
            titleCollapse: false,
            animate: true,
            activeOnTop: false
        };
        me.callParent();
    },
    buildContent: function() {
        var me = this;
        function addItem(rec) {
            me.add({
                xtype: 'isoplandetailpanel',
                title: rec.get('value')
            });
        };

        me.store.each(addItem);
    },
    onRebuildContent: function() {
        var me = this;
        me.removeAll();
        me.buildContent();
    }   
});