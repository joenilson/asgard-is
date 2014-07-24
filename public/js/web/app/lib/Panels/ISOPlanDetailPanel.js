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
Ext.define('Asgard.lib.Panels.ISOPlanDetailPanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.isoplandetailpanel',
    layout: 'column',
    minHeight: 400,
    autoScroll: true,
    defaultType: 'container',
    requires: [ 'Asgard.store.IsoPlanDetails' ],
    ownersText: 'Owners Associated',
    iperText: 'Dangers and Risks',
    ioText: 'Input / Output',
    eaText: 'Quality Variables',
    recordsText: 'Records',
    documentsText: 'Operational Control Procedures',

    ownersGrid: undefined,
    iperGrid: undefined,
    ioGrid: undefined,
    eaGrid: undefined,
    recordsGrid: undefined,
    documentsGrid: undefined,

    companiesValue: '',
    countriesValue: '',
    locationsValue: '',

    process_id: 0,

    initComponent: function(){
        
        this.ownersGrid = this.ownersGrid || [];
        this.ownersGrid = Ext.Object.merge({
            titleText: this.ownersText,
            xtype: 'ip_detailsgrid',
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'owners', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.ownersGrid);
        
        this.iperGrid = this.iperGrid || [];
        this.iperGrid = Ext.Object.merge({
            titleText: this.iperText,
            xtype: 'ip_detailsgrid',
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'iper', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.iperGrid);
        
        this.ioGrid = this.ioGrid || [];
        this.ioGrid = Ext.Object.merge({
            titleText: this.ioText,
            xtype: 'ip_detailsgrid',
            ioStatus: false,
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'quality_vars', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.ioGrid);
        
        this.eaGrid = this.eaGrid || [];
        this.eaGrid = Ext.Object.merge({
            titleText: this.eaText,
            xtype: 'ip_detailsgrid',
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'ea', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.eaGrid);
        
        this.recordsGrid = this.recordsGrid || [];
        this.recordsGrid = Ext.Object.merge({
            titleText: this.recordsText,
            xtype: 'ip_detailsgrid',
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'record_file', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.recordsGrid);
        
        this.documentsGrid = this.documentsGrid || [];
        this.documentsGrid = Ext.Object.merge({
            titleText: this.documentsText,
            xtype: 'ip_detailsgrid',
            store: new Ext.create('Asgard.store.IsoPlanDetails').load({ params: { helper: 'doc', process: this.process_id, company: this.companiesValue, country: this.countriesValue, location: this.locationsValue }})
        }, this.documentsGrid);
        
        this.items = [
        {
            columnWidth: 1/3,
            padding: '5 0 5 5',
            items:[
                this.ownersGrid,
                this.ioGrid
            ]
        },{
            columnWidth: 1/3,
            padding: '5 0 5 5',
            items:[
                this.eaGrid,
                this.documentsGrid
            ]
        },{
            columnWidth: 1/3,
            padding: '5 0 5 5',
            items:[
                this.iperGrid,
                this.recordsGrid
            ]
        }];
        
        this.callParent();
    }
});