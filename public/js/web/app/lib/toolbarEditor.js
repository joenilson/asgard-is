/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
Ext.define('Asgard.lib.toolbarEditor',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Editor-toolbar',
    dock: 'top',
    ui: 'footer',
    initComponent: function(){
        this.items = [{
          text: 'Search',
          type: 'button',
        },{
          text: 'Refresh',
          type: 'button',
        },{
          text: 'Edit Content',
          type: 'button',
        },{
          text: 'Save Changes',
          type: 'button',
        }];
        this.callParent(arguments);
    }
});

