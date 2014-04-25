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
Ext.define('Asgard.lib.forms.hiraIncidentClose',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newincidentclose',
    url: 'ims/addincidentclose',

    objectIncidentText: 'Incident',
    objectIncidentValue: '',
    objectCloseDescriptionText: 'Close Description',
    baseParams: { module: 'incidentclose' },
    
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',

    successText: 'Close saved succefully!',
    failureText: 'Something is wrong, please try it again',
    
    objectIncidentField: undefined,
    objectCloseDescriptionField: undefined,
    
    flex: 1,
    autoScroll: true,
    anchor: '100%',

    initComponent: function(){
        var me = this;
        
        this.objectIncidentField = this.objectIncidentField || [];
        this.objectIncidentField = Ext.Object.merge({
            fieldLabel: this.objectIncidentText,
            xtype: 'textareafield',
            name: 'incident_desc',
            anchor: '100%',
            readOnly: true,
            height: 180,
            value: this.objectIncidentValue,
            allowBlank:false
        }, this.objectIncidentField);
        
        this.objectCloseDescriptionField = this.objectCloseDescriptionField || [];
        this.objectCloseDescriptionField = Ext.Object.merge({
            fieldLabel: this.objectCloseDescriptionText,
            xtype: 'textareafield',
            name: 'close_description',
            anchor: '100%',
            height: 150,
            allowBlank:false
        }, this.objectCloseDescriptionField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'add',
                type: 'button',
                itemId: 'add',
                scope: me,
                handler: this.fnSubmit
            }, this.submitButton);

        this.cancelButton = this.cancelButton || [];
        this.cancelButton = Ext.Object.merge({
                text: this.textCancelButton,
                name: 'cancel',
                type: 'button',
                itemId: 'cancel',
                scope: me,
                handler: function(button) { button.up('panel').getForm().reset(); }
            }, this.cancelButton);

        this.items = this.items || [];
        this.items = this.items.concat([
            this.objectIncidentField,
            this.objectCloseDescriptionField
        ]);

        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    
    fnSubmit: function(button, event) {
        var me = this;
        var form = button.up('panel').getForm();
        var panel = button.up('panel');
        var grid = panel.innerPanel;
        console.log(grid);
        if(form.isValid()){
            form.submit({
                success: function(fp, o, m, r) {
                    form.reset();
                    var winActive = Ext.WindowManager.getActive();
                    winActive.hide();
                    //grid.getStore().load({params: { company: companyId, country: countryId, location: locationId, monthfield: yearmonth }});
                    Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    console.log(o);
                    console.log(u);
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    }
});