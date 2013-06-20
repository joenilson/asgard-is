Ext.define('Asgard.lib.toolbarViewer',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Viewer-toolbar',
    dock: 'top',
    ui: 'footer',
    searchButtonText: 'Search',
    refreshButtonText: 'Refresh',
    searchButton: undefined,
    refreshButton: undefined,
    initComponent: function(){
        var me = this;
        this.searchButton = this.searchButton || []; 
        this.searchButton = Ext.Object.merge({
                text: this.searchButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.searchButton);
            
        this.refreshButton = this.refreshButton || []; 
        this.refreshButton = Ext.Object.merge({
                text: this.refreshButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.refreshButton);
            
        
        this.items = this.items || [];
        this.items = this.items.concat([ '->', this.searchButton, this.refreshButton ]);

        this.callParent(arguments);
    },
});


