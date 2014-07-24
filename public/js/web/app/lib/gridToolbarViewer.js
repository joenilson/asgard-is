/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.gridToolbarViewer',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Viewer-grid-toolbar',
    dock: 'top',
    ui: 'footer',
    titleBarText: '',
    refreshButtonText: 'Refresh',
    refreshButton: undefined,
    
    defaults: {
        scale: 'small'
    },
    
    initComponent: function(){
        var me = this;
      
        this.refreshButton = this.refreshButton || []; 
        this.refreshButton = Ext.Object.merge({
                text: this.refreshButtonText,
                name: 'refresh',
                type: 'button',
                itemId: 'refresh',
                scope: me,
                handler: onClick
            }, this.refreshButton);
            
        this.items = this.items || [];
        this.items = this.items.concat([this.titleBarText, '->', this.refreshButton ]);
        
        this.callParent(arguments);
    }
});