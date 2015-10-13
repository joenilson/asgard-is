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
Ext.define('Asgard.lib.grid.users',{
   extend: 'Asgard.lib.GridPanel',
   autoShow: true,
    autoDestroy: true,
    autoScroll: true,
    border: false,
    frame: false,
    flex: 1,
    layout: 'fit',
    titleText: 'User\'s Center',
    idText: 'Id',
    usernameText: 'Username',
    realnameText: 'Realname',
    roleText: 'Role',
    dateCreationText: 'Date Creation',
    dateLastLoginText: 'Last Login',
    countryText: 'Country',
    companyText: 'Company',
    locationText: 'Location',
    adminText: 'Is Admin',
    statusText: 'Status',
    typeText: 'Type User',
    accountTypeText: 'Account Type',
    
    toolViewDocText: 'View Profile',
    toolRequestText: 'Modify Profile',
    
    msgTitleText: 'Warning! User Status Change',
    msgTitleBodyDelete: 'Confirm that you will change this user status?',
    
    emptyTitleText: 'No data selected',
    emptyMessageText: 'No one items was selected to process, <br />Please select one at last...',
    emptyTextText: 'No users found in this location',
    
    initComponent: function(){
        this.emptyText = this.emptyTextText;
        this.tbar = [{
            text: 'Cambiar Clave',
             scope: this,
            handler: this.changePassword
        },{
            text: 'Desactivar Usuario',
            scope: this,
            handler: this.changeStatus
        },{
            text: 'Activar Usuario',
            scope: this,
            handler: this.changeStatus
        }];
        
        this.title = this.titleText;
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, flex: 0.5, sortable: true, dataIndex: 'id', filter: true},
                {text: this.usernameText, flex: 1.5, sortable: true, filter: true, dataIndex: 'username', tdCls: 'wrapText'},
                {text: this.realnameText, flex: 2, sortable: true, filter: true, dataIndex: 'realname', tdCls: 'wrapText'},
                {text: this.roleText, flex: 1, sortable: true, filter: true, dataIndex: 'role', tdCls: 'wrapText'},
                {text: this.dateCreationText, flex: 1.5, sortable: true, filter: true, dataIndex: 'date_created', tdCls: 'wrapText',
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                {text: this.dateLastLoginText, flex: 1.5,  sortable: true, filter: true, dataIndex: 'date_lastlogin', tdCls: 'wrapText', 
                    xtype: 'datecolumn', format:'Y-m-d'
                },
                {text: this.countryText, flex: 2, sortable: true, filter: 'combo', dataIndex: 'country_desc', tdCls: 'wrapText'},
                {text: this.companyText, flex: 3,  sortable: true, filter: 'combo', dataIndex: 'company_desc', tdCls: 'wrapText'},
                {text: this.locationText, flex: 3, sortable: true, filter: 'combo', dataIndex: 'location_desc', tdCls: 'wrapText'},
                {text: this.adminText, flex: 1, sortable: true, filter: true, dataIndex: 'admin', tdCls: 'wrapText'},
                {text: this.statusText, flex: 1, sortable: true, filter: true, dataIndex: 'status', tdCls: 'wrapText'},
                {text: this.typeText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'type', tdCls: 'wrapText'},
                {text: this.accountTypeText, flex: 1, sortable: true, filter: 'combo', dataIndex: 'account_type', tdCls: 'wrapText'},
                {xtype: 'actioncolumn', flex: 1.5, sortable: false, menuDisabled: true,
                    items: [
                        {
                            icon: 'images/default/16x16/view.png',
                            tooltip: this.toolViewDocText,
                            scope: this,
                            //handler: showDocument
                        }, '-',
                        {
                            icon: 'images/default/edit.png',
                            tooltip: this.toolRequestText,
                            scope: this,
                            //handler: showRequest
                        }
                    ]
                }
            ]
        };
        
        this.callParent();
    },

    changePassword: function(button, form, store) {
        var record = button.up('panel').getSelectionModel().getSelection();
        var win = Ext.create('Ext.window.Window',{
            closable: true,
            closeAction: 'hide',
            maximizable : true,
            layout: 'fit'
        });
        win.setTitle('Usuario '+record[0].data.username);
        var content = Ext.create('Asgard.lib.forms.change_password', {
            baseParams: { uid: record[0].data.id, country: record[0].data.country }
        });
        win.add(content);
        win.show();
    },
    
     changeStatus: function(button, form, store) {
        var me = this;
        var record = button.up('panel').getSelectionModel().getSelection();
        if(record.length>0){
            Ext.MessageBox.confirm(me.msgTitleText,
                me.msgTitleBodyDelete,
                function(buttonId) {
                    if (buttonId === 'no') {

                    } else {
                        Ext.Ajax.request({
                            url: 'admin/users/change',
                            params: {
                                uid: record[0].data.id, 
                                status: record[0].data.status,
                                module: 'uadmin'
                            },
                            success: function(response){
                                var text = response.responseText;
                            }
                        });
                        me.getStore().removeAll();
                        me.getStore().load({ params: { company: record[0].data.company, country: record[0].data.country, location: record[0].data.location }});
                    }
                },
                this
            );
        }else{
            this.showEmptyMessage();
        }
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