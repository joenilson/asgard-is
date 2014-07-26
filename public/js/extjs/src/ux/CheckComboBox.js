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
/**
 * @class Ext.ux.form.plugin.CheckComboBox
 * @ptype checkcombobox
 * Plugin for ComboBoxes with multiSelect that shows checkboxes in the combobox boundlist.
 * @author makana
 * @date 2013-01-04
 */
Ext.define('Ext.ux.form.plugin.CheckComboBox', {
    alias: 'plugin.checkcombobox',
    /**
     * @cfg {String} [checkBoxCls='ux-boundlist-item-checkbox']
     * CSS-Class to apply to the checkbox element
     */
    checkBoxCls: 'ux-boundlist-item-checkbox',
    /**
     * Init
     * @private
     */
    init: function(combo)
    {
        if (!(combo instanceof Ext.form.field.ComboBox))
            Ext.Error.raise('Plugin "Ext.ux.form.plugin.CheckComboBox" can only be used on fields of type Ext.form.field.ComboBox.');

        if (combo.multiSelect)
        {
            combo.listConfig = combo.listConfig || {};
            combo.listConfig.getInnerTpl = this.getListInnerTpl(combo);
            combo.listConfig.cls = combo.listConfig.cls || '';
            combo.listConfig.cls += ' ux-form-checkcombobox-list';

            if (!combo.editable)
            {
                combo.selectOnTab = false;
                combo.on({
                    'expand': this.onComboExpand,
                    single: true,
                    scope: this
                });
            }
        }
    },
    /**
     * Return this default innerListTpl for CheckBoxCombos
     */
    getListInnerTpl: function(combo)
    {
        var me = this,
                listClass = Ext.ClassManager.getByAlias('widget.' + (combo.listConfig.xtype || 'boundlist'))
                || Ext.view.BoundList,
                origFn = combo.listConfig.getInnerTpl
                || (combo.defaultListConfig ? combo.defaultListConfig.getInnerTpl : undefined)
                || listClass.prototype.getInnerTpl;
        return function(displayField)
        {
            return '<span class="' + me.checkBoxCls + '">&nbsp;</span> ' + origFn.apply(this, arguments);
        };
    },
    /**
     * Called once on first expand of the ComboBox.
     * Adds a Key-Handler to select/deselect on space key.
     * @private
     */
    onComboExpand: function(combo)
    {
        var me = this;
        if (!combo.listKeyNav)
            combo.listKeyNav = new Ext.view.BoundListKeyNav(combo.inputEl, {
                boundList: combo.getPicker(),
                forceKeyDown: true,
                // Do not use 'tab' here, because it does a select/deselect followed by blur.
                // That can lead to deselecting a selected record and leaving
                // the field immediately afterwards.
                space: function(e) {
                    me.selectWithSpace(this, e);
                }
            });
    },
    /**
     * Selects or deselects the focused record with space key.
     * @param {Ext.view.BoundListKeyNav} keyNav
     * @param {Ext.EventObject} e KeyDown-Event
     * @private
     */
    selectWithSpace: function(keyNav, e)
    {
        var boundList = keyNav.boundList,
                selModel = boundList.getSelectionModel(),
                highlighted = boundList.highlightedItem,
                highlightedRec;

        if (highlighted)
        {
            highlightedRec = boundList.getRecord(highlighted);
            selModel.selectWithEvent(highlightedRec, e);
        }
    }
});

