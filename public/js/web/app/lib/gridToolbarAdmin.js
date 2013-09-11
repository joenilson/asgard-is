/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.gridToolbarAdmin',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Admin-grid-toolbar',
    dock: 'top',
    ui: 'footer',
    titleBarText: '',
    refreshButtonText: 'Refresh',
    addButtonText: 'Add Content',
    removeButtonText: 'Remove Content',
    enableButtonText: 'Enable Content',
    disableButtonText: 'Disable Content',
    exportButtonText: 'Export Content',
    refreshButton: undefined,
    addButton: undefined,
    removeButton: undefined,
    enableButton: undefined,
    disableButton: undefined,
    exportButton: undefined,
    
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
            
        this.addButton = this.addButton || [];
        this.addButton = Ext.Object.merge({
            text: this.addButtonText,
            name: 'add',
            type: 'button',
            itemId: 'add',
            scope: me,
            handler: onClick
        }, this.addButton);
        
        this.removeButton = this.removeButton || []; 
        this.removeButton = Ext.Object.merge({
                text: this.removeButtonText,
                name: 'remove',
                type: 'button',
                itemId: 'remove',
                scope: me,
                handler: onClick
            }, this.removeButton);
        
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
            
        this.exportButton = this.exportButton || []; 
        this.exportButton = Ext.Object.merge({
                text: this.exportButtonText,
                name: 'export',
                type: 'button',
                itemId: 'export',
                scope: me,
                handler: onClick
            }, this.exportButton);
            
        this.items = this.items || [];
        this.items = this.items.concat([this.titleBarText, this.addButton, this.removeButton, this.enableButton, this.disableButton, this.exportButton, '->', this.refreshButton ]);
        
        this.callParent(arguments);
    }
});