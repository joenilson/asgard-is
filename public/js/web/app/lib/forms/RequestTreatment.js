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
Ext.define('Asgard.lib.forms.RequestTreatment',{
    extend: 'Ext.form.Panel',
    alias: 'widget.requestthreatment',
    url: 'ims/requesttreatment',

    treatmentText: 'Acceptance',
    reasonText: 'Reason',
    treatmentYesText: 'Yes',
    treatmentNoText: 'No',
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',
    warningTitle: 'Warning',
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
    bodyPadding: '10 10 10 0',
    threatmentField: undefined,
    reasonField: undefined,
    defaults: {
        labelWidth: 100,
        msgTarget: 'qtip'
    },
    anchor: '100%',
    width: 360,
    //height: 360,
    initComponent: function(){
        this.treatmentField = this.treatmentField || [];
        this.treatmentField = Ext.Object.merge({
            fieldLabel: this.treatmentText,
            afterLabelTextTpl: this.required,
            xtype: 'radiogroup',
            name: 'treatment',
            anchor: '100%',
            columns: 1,
            items: [
                {boxLabel: this.treatmentYesText, name: 'ack', inputValue: 1},
                {boxLabel: this.treatmentNoText, name: 'ack', inputValue: 0, checked: true},
            ]
        }, this.treatmentField);
        
        this.reasonField = this.reasonField || [];
        this.reasonField = Ext.Object.merge({
            fieldLabel: this.reasonText,
            xtype: 'htmleditor',
            name: 'reason',
            anchor: '100%',
            allowBlank:false
        }, this.reasonField);
        
        this.submitButton = this.submitButton || []; 
        this.submitButton = Ext.Object.merge({
                text: this.textSubmitButton,
                name: 'apply',
                type: 'button',
                itemId: 'apply',
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
            this.treatmentField, this.reasonField
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(button, event) {
       
        var form = button.up('panel').getForm();
        var grid = form.innerData;
        
        if(form.isValid()){
            form.submit({
                params: {
                    module: 'requestt'
                },
                success: function(fp, o, m, r) {
                form.reset();
                
                grid.suspendEvents();
                grid.getStore().reload();
                gird.resumeEvents();
                var winActive = Ext.WindowManager.getActive();
                winActive.hide();
                Ext.Msg.alert('Success', o.result.msg);
            },
            failure: function(fp, o, u){
                Ext.Msg.alert('Failure', o.result.msg);
            }
            });
        }
    }
});