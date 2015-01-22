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

Ext.define('Asgard.lib.Panels.BrigadePanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.brigadepanel',
    bodyPadding: 5,
    heigth: '100%',
    flex: 1,
    //layout: 'fit',
    autoScroll: true,
    barAddText: 'Add Member',
    barRemoveText: 'Remove Member',
    warningTitle: 'Warning',
    warningBody: 'Your submit can\'t be process, please review your data',
    warningTitleBodyDelete: 'You are choosing delete this member. <br />Would you like to save your changes?',
    
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
                var dv = this.items.getAt(0);
                var contentWin = Ext.create('Asgard.lib.forms.brigadeNewMember', { innerPanel: dv });
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
                Ext.Msg.confirm(this.warningTitle,
                    this.warningTitleBodyDelete,
                    function(buttonId) {
                        if (buttonId === 'no') {
                            
                        } else {
                            Ext.Ajax.request({
                                url: 'ims/removesimulationsbrigade',
                                params: {
                                    ids: Ext.encode(dataItems),
                                    company: selected[0].data.company,
                                    country: selected[0].data.country,
                                    location: selected[0].data.location
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
                    },
                    this
                );
            }
        }],
        
        this.callParent();
    }
});