/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
Ext.define('Asgard.lib.toolbarAdmin',{
    extend: 'Ext.toolbar',
    alias: 'widget.Admin-toolbar',
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
          text: 'Add Content',
          type: 'button',
        },{
          text: 'Remove Content',
          type: 'button',
        },{
          text: 'Save Changes',
          type: 'button',
        }];
        this.callParent(arguments);
    }
});

