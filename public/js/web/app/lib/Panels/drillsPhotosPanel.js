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

Ext.define('Asgard.lib.Panels.drillsPhotosPanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.drillsphotospanel',
    bodyPadding: 5,
    heigth: '100%',
    flex: 1,
    layout: 'fit',
    autoScroll: true,
    albumId: '',
    barAddText: 'Add Image',
    barRemoveText: 'Remove Image',
    
    warningTitle: 'Warning',
    warningBody: 'Your submit can\'t be process, please review your data',
    warningTitleBodyDelete: 'You are choosing delete this member. <br />Would you like to save your changes?',
    emptyTitleText: 'No Simulation selected',
    emptyMessageText: 'No one simulation was selected, <br />Please select one at last to include photos...',
    
    initComponent: function(){
        var me = this;
        
        this.tbar = [{ 
            text: this.barAddText,
            scope: me,
            handler: function() {
                console.log(me.albumId);
                console.log(this.albumId);
                if(me.albumId > 0){
                var window = Ext.create('Ext.window.Window',{
                    flex: 1,
                    title: this.barAddText,
                    width: '40%',
                    //height: '310px',
                    layout: 'fit'
                });
                var dv = this.items.getAt(0);   
                var contentWin = Ext.create('Asgard.lib.forms.simulationNewPhoto', { baseParams: { album_id: me.albumId}, innerPanel: dv });
                window.items.add(contentWin);
                window.show();
                }else{
                    this.showEmptyMessage();
                }
            }
        },{ 
            text: this.barRemoveText,
            scope: me,
            handler: function() {
                var dv = this.items.getAt(0);
                var selected = dv.getSelectionModel().getSelection();
                var dataItems = new Array();
                var albumId = selected[0].data.id_album;
                for(i=0; i<selected.length; i++){
                    dataItems[i]=selected[i].data.id;
                }
                Ext.Msg.confirm(this.warningTitle,
                    this.warningTitleBodyDelete,
                    function(buttonId) {
                        if (buttonId === 'no') {
                            
                        } else {
                            Ext.Ajax.request({
                                url: 'ims/removealbumphotos',
                                params: {
                                    ids: Ext.encode(dataItems),
                                    album_id: albumId
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
        }];
        this.callParent();
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