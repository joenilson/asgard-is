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
Ext.define('Asgard.lib.grid.hira_helpers',{
    extend: 'Asgard.lib.GridPanel',
    alias: 'widget.hiraHelpers',
    
    //titleText: 'Incident Types',
    
    idText: 'Id',
    typeHelperText: 'Type',
    descriptionDangerText: 'Danger',
    descriptionRiskText: 'Risk',
    descriptionConsequenceText: 'Consequence',
    getDataList: 'Get Values',
    addNewValue: 'Add Danger Code',
    successText: 'Success',
    failureText: 'Failure',
    MessageText: { 'update': 'Update Correct' ,  'insert': 'Data Insert Correct' },
    selModel: {
        selType: 'rowmodel'
    },
    initComponent: function(){
        var me = this;
        this.rowEditing = new Ext.grid.plugin.RowEditing({
            clicksToEdit: 2,
            clicksToMoveEditor: 1
        });
        this.lang_helpers = Ext.getCmp('languagecombo');
        this.plugins =  [ this.rowEditing ];
        this.title = this.titleText;
        this.tbar = [
            {
                labelStyle: 'font-weight: bold;',
                xtype: 'languagecombo',
                id: 'languagecombo',
                store: new Ext.create('Asgard.store.Languages')
            },{
                xtype: 'button',
                text: this.getDataList,
                handler: this.getHelpersList
            },
            '->',
            {
                xtype: 'button',
                id: 'hh-add-button',
                text: this.addNewValue,
                handler: this.addNewDanger,
                disabled: true
            }
        ];

        this.store = Ext.create('Asgard.store.HiraHelpers');
        this.storeHelpers = Ext.create('Asgard.store.HiraHelpers');
        this.columns =  {
            plugins: [ { ptype: 'gridautoresizer' } ],
            items: [
                { text: this.typeHelperText, width: 120, sortable: true, dataIndex: 'id_type_desc', filter: true, editor: {
                        xtype: 'hirahelperscombo',
                        hideLabel: true,
                        forceSelection: true,
                        //editable: false,
                        //triggerAction: 'all',
                        allowBlank: false,
                        store: this.storeHelpers
                    }
                },
                {text: this.idText, width: 60, sortable: true, dataIndex: 'id', filter: 'combo', editor: { allowBlank: false } },
                {text: this.descriptionDangerText, flex: 1, sortable: true, filter: true, dataIndex: 'description_danger', tdCls: 'wrapText', editor: { xtype: 'textarea', allowBlank: true } },
                {text: this.descriptionRiskText, flex: 1, sortable: true, filter: true, dataIndex: 'description_risk', tdCls: 'wrapText', editor: { xtype: 'textarea', allowBlank: true } },
                {text: this.descriptionConsequenceText, flex: 1, sortable: true, filter: true, dataIndex: 'description_consequence', tdCls: 'wrapText', editor: { xtype: 'textarea', allowBlank: true } }
            ]
        };
        this.listeners = {
            'edit': this.updateData,
            'beforeEdit': function(event, f){
                var lang_helpers = Ext.getCmp('languagecombo');
                this.storeHelpers.load({ params: {type: 'type_danger', lang: lang_helpers.getValue() } });
            }
        };
        this.callParent();
    },
    
    getHelpersList: function(button, event) {
        var me = this;
        var lang_helpers = Ext.getCmp('languagecombo');
        this.up('panel').getStore().load({ params: {type: 'dangers', lang: lang_helpers.getValue() } });
        var addButton = Ext.getCmp('hh-add-button');
        addButton.setDisabled(false);

    },
    
    helperRenderer: function() {
        
    },
    
    addNewDanger: function(button, event){
        var lang_helpers = Ext.getCmp('languagecombo');
        var newItem = Ext.create('Asgard.model.HiraHelpers', {
            helper: 'dangers',
            lang: lang_helpers.getValue(),
            id_type: '',
            id: '',
            description: '',
            description_danger: '',
            description_risk: '',
            description_consequence: ''
        });
        this.up('panel').getStore().insert(0,newItem);
        this.up('panel').plugins[0].startEdit(0, 0);
    },
    
    refreshData: function(){
        var lang_helpers = Ext.getCmp('languagecombo');
        //console.log(this);
        this.getStore().load({ params: {type: 'dangers', lang: lang_helpers.getValue() } });
    },
    
    updateData: function(view, records) {
        var me = this;
        Ext.Ajax.request({
            url: 'ims/saveHiraHelpers',
            params: { data:  Ext.encode(records.record.getChanges()), id: records.record.data.id, lang: records.record.data.lang, helper: records.record.data.helper  },
             success: function(response){
                var text = Ext.decode(response.responseText);
                if(text.success){
                    Ext.Msg.alert(me.successText,me.MessageText[text.message]);
                    me.refreshData();
                }else{
                    Ext.Msg.alert(me.failureText,me.MessageText[text.message]);
                }
            }
        });
    }

});