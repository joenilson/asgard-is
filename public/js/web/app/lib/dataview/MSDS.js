/* 
 * Copyright (C) 2014 Joe Nilson <joenilson at gmail.com>
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
Ext.define('Asgard.lib.dataview.MSDS',{
    extend: 'Ext.view.View',
    alias: 'widget.msdsview',
    multiSelect: true,
    flex: 1,
    layout: 'fit',
    trackOver: false,
    itemSelector: 'object',
    overItemCls: 'x-item-over',
    emptyTextText: 'No MSDS to display',
    template: [
        '<tpl for=".">',
        '<object data="{filename}#toolbar=1&amp;navpanes=0&amp;scrollbar=1&amp;page=1&amp;view=FitH"',
        'type="application/pdf"',
        'width="100%"',
        'height="100%">',
        '</tpl>',
        '<div class="x-clear"></div>'
    ],
    initComponent: function(){
        this.tpl = this.template;
        this.emptyText = this.emptyTextText;
        this.callParent();
    }
});