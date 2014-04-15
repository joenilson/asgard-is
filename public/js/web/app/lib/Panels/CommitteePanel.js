/**
 * @class FeedViewer.FeedPanel
 * @extends Ext.panel.Panel
 *
 * Shows a list of available feeds. Also has the ability to add/remove and load feeds.
 *
 * @constructor
 * Create a new Feed Panel
 * @param {Object} config The config object
 */

Ext.define('Asgard.lib.Panels.CommitteePanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.committeepanel',
    bodyPadding: 7,
    heigth: '100%',
    flex: 1,
    autoScroll: true,
    barAddText: 'Add Member',
    barRemoveText: 'Remove Member',
    warningTitle: 'Warning',
    warningBody: 'Your submit can\'t be process, please review your data',
    initComponent: function(){
        var me = this;
        this.tbar = [{ 
            text: this.barAddText,
            scope: me,
            handler: function() {
                var window = Ext.create('Ext.window.Window',{
                    flex: 1,
                    title: this.barAddText,
                    width: '40%',
                    height: '310px',
                    layout: 'anchor'
                });
                var contentWin = Ext.create('Asgard.lib.forms.committeeNewMember');
                window.items.add(contentWin);
                window.show();
            }
        },{ 
            text: this.barRemoveText,
            scope: me,
            handler: function() {
                var dv = this.items.getAt(0);
                var selected = dv.getSelectionModel().getSelection();
                var dataItems = new Array();
                for(i=0; i<selected.length; i++){
                    dataItems[i]=selected[i].data.id;
                }
                Ext.Ajax.request({
                    url: 'ims/removesafetycommittee',
                    params: {
                        ids: Ext.encode(dataItems)
                    },
                    success: function(response, action){
                        var result = Ext.decode(response.responseText);
                        if(result.success){
                            var store = dv.getStore();
                            store.remove(selected);
                        }else{
                            Ext.Msg.alert(me.warningTitle,me.warningBody);
                        }
                    }
                });
            }
        }],
        
        this.callParent();
    }
});
