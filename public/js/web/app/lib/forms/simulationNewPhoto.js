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
Ext.define('Asgard.lib.forms.simulationNewPhoto',{
    extend: 'Ext.form.Panel',
    alias: 'widget.newsimulationphoto',
    url: 'ims/addalbumphotos',

    desc1Text: 'First Photo Description',
    file1Text: 'First Photo ',
    desc2Text: 'Second Photo Description',
    file2Text: 'Second Photo ',
    desc3Text: 'Third Photo Description',
    file3Text: 'Third Photo ',
    textSubmitButton: 'Send',
    textCancelButton: 'Cancel',

    warningTitle: 'Warning',
    warningText: 'Photo exists!, choose another name',
    required: '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
    successText: 'Photo loaded succefully!',
    failureText: 'Something is wrong, please try it again',
    desc1Field: undefined,
    file1Field: undefined,
    desc2Field: undefined,
    file2Field: undefined,
    desc3Field: undefined,
    file3Field: undefined,
    emptyTitleText: 'No Simulation selected',
    emptyMessageText: 'No one simulation was selected, <br />Please select one at last to include photos...',

    defaults: {
        labelWidth: 180,
        msgTarget: 'qtip',
        padding: '2px'
    },
    anchor: '100%',
    width: 540,
    flex: 1,
    initComponent: function(){
        var me = this;
        
        this.desc1Field = this.desc1Field || [];
        this.desc1Field = Ext.Object.merge({
            fieldLabel: this.desc1Text,
            xtype: 'textfield',
            name: 'description_1',
            anchor: '100%',
            allowBlank:true
        }, this.desc1Field);
        
        this.file1Field = this.file1Field || [];
        this.file1Field = Ext.Object.merge({
            fieldLabel: this.file1Text,
            allowBlank:true,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.fileFieldEmptyText,
            name: 'photo_1',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'image/jpg'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'upload-icon'
            }
        }, this.file1Field);
        
        this.desc2Field = this.desc2Field || [];
        this.desc2Field = Ext.Object.merge({
            fieldLabel: this.desc2Text,
            xtype: 'textfield',
            name: 'description_2',
            anchor: '100%',
            allowBlank:true
        }, this.desc2Field);
        
        this.file2Field = this.file2Field || [];
        this.file2Field = Ext.Object.merge({
            fieldLabel: this.file2Text,
            allowBlank:true,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.fileFieldEmptyText,
            name: 'photo_2',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'image/jpg'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'upload-icon'
            }
        }, this.file2Field);

        this.desc3Field = this.desc3Field || [];
        this.desc3Field = Ext.Object.merge({
            fieldLabel: this.desc3Text,
            xtype: 'textfield',
            name: 'description_3',
            anchor: '100%',
            allowBlank:true
        }, this.desc3Field);
        
        this.file3Field = this.file3Field || [];
        this.file3Field = Ext.Object.merge({
            fieldLabel: this.file3Text,
            allowBlank:true,
            xtype: 'filefield',
            anchor: '100%',
            emptyText: this.fileFieldEmptyText,
            name: 'photo_3',
            listeners:{
                afterrender:function(cmp){
                    cmp.fileInputEl.set({
                        accept:'image/jpg'
                    });
                }
            },
            buttonText: '',
            buttonConfig: {
                iconCls: 'upload-icon'
            }
        }, this.file3Field);
             
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
            this.desc1Field,
            this.file1Field,
            this.desc2Field,
            this.file2Field,
            this.desc3Field,
            this.file3Field
        ]);
        
        this.buttons = this.buttons || [];
        this.buttons = this.buttons.concat([ '->', this.submitButton, this.cancelButton ]);

        this.callParent();
    },
    fnSubmit: function(button, event) {
        var me = this;
        var form = button.up('panel').getForm();
        var panel = button.up('panel');
        var albumId = form.baseParams.album_id;
        var companyId = panel.items.getAt(0).getValue();
        var countryId = panel.items.getAt(1).getValue();
        var locationId = panel.items.getAt(2).getValue();
        var grid = panel.innerPanel;
        
        if(form.isValid()){
            form.submit({
                params: {
                    module: 'imssimulationsphotos'
                },
                success: function(fp, o, m, r) {
                    console.log(fp);
                    console.log(o);
                    var result = Ext.decode(o.response.responseText);
                    console.log(result);
                    form.reset();
                    var winActive = Ext.WindowManager.getActive();
                    winActive.hide();
                    grid.getStore().load({params: { album_id: albumId }});
                    Ext.Msg.alert('Success', me.successText);
                },
                failure: function(fp, o, u){
                    Ext.Msg.alert('Failure', me.failureText);
                }
            });
        }
    },
    createWindow: function() {
        var windowAuditor = Ext.create('Ext.window.Window',{
                closable: true,
                closeAction: 'hide',
                maximizable : true,
                layout: 'fit'
            });
         return windowAuditor;
    },
    showEmptyMessage: function(){
        var emptyMsg = Ext.MessageBox.show({
           title: this.emptyTitleText,
           msg: this.emptyMessageText,
           buttons: Ext.MessageBox.OK,
           icon: Ext.MessageBox.WARNING
        });
       return emptyMsg;

    }
});