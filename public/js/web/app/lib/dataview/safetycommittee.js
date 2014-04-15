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
Ext.define('Asgard.lib.dataview.safetycommittee',{
    extend: 'Ext.view.View',
    alias: 'widget.safetycommitteeview',
    multiSelect: true,
    //height: 310,
    flex: 1,
    trackOver: true,
    overItemCls: 'x-item-over',
    itemSelector: '.thumb-wrap',
    emptyTextText: 'No images to display',
    tpl: [
        '<tpl for=".">',
            '<div class="thumb-wrap" style="float: left; padding: 5px; width: 200px; height: 200px;" id="{id:stripTags}">',
                '<div class="thumb"><img src="{thumbnail}" title="{fullname:htmlEncode}"></div>',
                '<span>{fullname:htmlEncode}</span><br />',
                '<span>{description:htmlEncode}</span><br />',
                '<span>{email:htmlEncode}</span><br />',
                '<span>{phone:htmlEncode}</span>',
            '</div>',
        '</tpl>',
        '<div class="x-clear"></div>'
    ],
    initComponent: function(){
        
        this.emptyText = this.emptyTextText;
        this.callParent();
    }
});