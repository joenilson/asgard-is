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
Ext.define('Asgard.lib.dataview.drillsphotos',{
    extend: 'Ext.view.View',
    alias: 'widget.drillsphotosview',
    multiSelect: true,
    //height: 310,
    flex: 1,
    trackOver: true,
    overItemCls: 'x-item-over',
    itemSelector: 'div.thumb-wrap',
    emptyTextText: 'No images to display',
    template: [
        '<tpl for=".">',
            '<div class="thumb-wrap" style="" id="{id:stripTags}">',
                '<div class="thumb"><img src="{thumbnail}" title="{fullname:htmlEncode}"></div>',
                '<span>{description:htmlEncode}</span><br />',
            '</div>',
        '</tpl>',
        '<div class="x-clear"></div>'
    ],
    initComponent: function(){
        this.tpl = this.template;
        this.emptyText = this.emptyTextText;
        this.callParent();
    }
});