/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
Ext.define('Asgard.lib.toolbarViewer',{
    extend: 'Ext.toolbar',
    alias: 'widget.Viewer-toolbar',
    dock: 'top',
    ui: 'footer',
    initComponent: function(){
        this.items = [{
          text: 'Search',
          type: 'button',
        },{
          text: 'Refresh',
          type: 'button',
        }];
        this.callParent(arguments);
    }
});

