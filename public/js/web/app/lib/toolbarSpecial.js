Ext.define('Asgard.lib.toolbarSpecial',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Special-toolbar',
    dock: 'top',
    ui: 'footer',
    initComponent: function(){
        this.items = [{
          text: 'Search',
          type: 'button'
        },{
          text: 'Refresh',
          type: 'button'
        }];
        this.callParent(arguments);
    }
});

