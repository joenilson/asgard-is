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
Ext.define('Asgard.lib.Panels.IncidentCausesPanel', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.incidentcausespanel',
    flex: 1,
    //heigth: '100%',
    autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    layout: 'fit',
    //activeTab: 0,
    defaults :{
        bodyPadding: 10
    },
    MethodTitle: 'Method',
    MachineTitle: 'Machine',
    HumanFactorTitle: 'Human Factor',
    InfrastructureTitle: 'Infrastructure',
    MaterialTitle: 'Material',
    OthersTitle: 'Others',
    
    objectRegisterNameText: 'Register Name',
    objectRegisterSurnameText: 'Register Surname',
    objectRegisterLastnameText: 'Register Lastname',
    inmediateActionText: 'Inmediate Action',
    correctiveActionText: 'Corrective Action',
    
    
    
    initComponent: function(){
        var me = this;
        this.items = [{
            title: this.MethodTitle,
            html: "My content was added during construction."
        },{
            title: this.MachineTitle,
            html: "My content was added during construction."
        },{
            title: this.HumanFactorTitle,
            html: "My content was added during construction."
        },{
            title: this.InfrastructureTitle,
            html: "My content was added during construction."
        },{
            title: this.MaterialTitle,
            html: "My content was added during construction."
        },{
            title: this.OthersTitle,
            html: "My content was added during construction."
        }];
    this.callParent();
    },
    fnSubmitCauses: function(){
        
    }
});

