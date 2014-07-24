/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.gridToolbarEditor',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Editor-grid-toolbar',
    dock: 'top',
    ui: 'footer',
    titleBarText: '',
    refreshButtonText: 'Refresh',
    enableButtonText: 'Enable Content',
    disableButtonText: 'Disable Content',
    refreshButton: undefined,
    enableButton: undefined,
    disableButton: undefined,
    
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
        
        this.enableButton = this.enableButton || []; 
        this.enableButton = Ext.Object.merge({
                text: this.enableButtonText,
                name: 'enable',
                type: 'button',
                itemId: 'enable',
                scope: me,
                handler: onClick
            }, this.enableButton);
        
        this.disableButton = this.disableButton || []; 
        this.disableButton = Ext.Object.merge({
                text: this.disableButtonText,
                name: 'disable',
                type: 'button',
                itemId: 'disable',
                scope: me,
                handler: onClick
            }, this.disableButton);
            
        this.items = this.items || [];
        this.items = this.items.concat([this.titleBarText, this.enableButton, this.disableButton, '->', this.refreshButton ]);
        
        this.callParent(arguments);
    }
});