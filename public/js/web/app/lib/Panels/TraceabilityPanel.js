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

Ext.define('Asgard.lib.Panels.TraceabilityPanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.traceabilitypanel',
    bodyPadding: 5,
    heigth: '100%',
    flex: 1,
    layout: 'fit',
    autoScroll: true,
    barAddText: 'Add Traceability',
    barRemoveText: 'Remove Traceability',
    warningTitle: 'Warning',
    warningBody: 'Your submit can\'t be process, please review your data',
    warningTitleBodyDelete: 'You are choosing delete this item. <br />Would you like to save your changes?',
    isAdmin: false,
    initComponent: function(){
        var me = this;
        if(this.isAdmin){
            this.tbar = [{ 
                text: this.barAddText,
                scope: me,
                handler: function() {
                    var window = Ext.create('Ext.window.Window',{
                        flex: 1,
                        title: this.barAddText,
                        width: '40%',
                        //height: '310px',
                        layout: 'anchor'
                    });
                    var dv = this.items.getAt(0);
                    var contentWin = Ext.create('Asgard.lib.forms.traceabilityNewObject', { innerPanel: dv });
                    window.items.add(contentWin);
                    window.show();
                }
            }];
        }
        this.callParent();
    }
});