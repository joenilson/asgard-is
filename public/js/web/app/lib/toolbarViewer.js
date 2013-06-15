Ext.define('Asgard.lib.toolbarViewer',{
    extend: 'Ext.Toolbar',
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

