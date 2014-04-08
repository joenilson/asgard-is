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
//var CompaniesStore = new Ext.create('Asgard.store.Companies');
Ext.define('Asgard.lib.forms.AuditTypeCombo',{
    extend: 'Ext.form.ComboBox',
    alias: 'widget.audittypecombo',
    fieldLabelText: 'Audit Type',
    store: Ext.create('Asgard.store.AuditType'),
    queryMode: 'local',
    displayField: 'description',
    valueField: 'id',
    anchor: '33%',
    name: 'audittypeCombo',
    forceSelection: true,
    emptyTextText: 'No values at this time',
    initComponent: function() {
        this.fieldLabel = this.fieldLabelText;
        this.emptyText = this.emptyTextText;
        this.callParent();
    }
});