Ext.define('Asgard.lib.toolbarEditor',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Editor-toolbar',
    dock: 'top',
    ui: 'footer',
    searchButtonText: 'Search',
    refreshButtonText: 'Refresh',
    editButtonText: 'Edit Content',
    saveButtonText: 'Save Changes',
    cancelButtonText: 'Cancel Changes',
    searchButton: undefined,
    refreshButton: undefined,
    editButton: undefined,
    saveButton: undefined,
    cancelButton: undefined,
    defaults: {
        scale: 'small'
    },
    initComponent: function(){
        var me = this;
        this.searchButton = this.searchButton || []; 
        this.searchButton = Ext.Object.merge({
                text: this.searchButtonText,
                name: 'search',
                type: 'button',
                scope: me,
                handler: onClick
            }, this.searchButton);
            
        this.refreshButton = this.refreshButton || []; 
        this.refreshButton = Ext.Object.merge({
                text: this.refreshButtonText,
                name: 'refresh',
                type: 'button',
                scope: me,
                handler: onClick
            }, this.refreshButton);
        
        this.editButton = this.editButton || []; 
        this.editButton = Ext.Object.merge({
                text: this.editButtonText,
                name: 'edit',
                type: 'button',
                itemId: 'edit',
                scope: me,
                handler: onClick
            }, this.editButton);
        
        this.saveButton = this.saveButton || []; 
        this.saveButton = Ext.Object.merge({
                text: this.saveButtonText,
                name: 'save',
                type: 'button',
                itemId: 'save',
                scope: me,
                disabled: true,
                handler: onClick
            }, this.saveButton);
        
        this.cancelButton = this.cancelButton || []; 
        this.cancelButton = Ext.Object.merge({
                text: this.cancelButtonText,
                name: 'cancel',
                type: 'button',
                itemId: 'cancel',
                scope: me,
                disabled: true,
                handler: onClick
            }, this.cancelButton);
        this.items = this.items || [];
        this.items = this.items.concat([this.editButton, this.saveButton, this.cancelButton, '->', this.searchButton, this.refreshButton ]);
        
        this.callParent(arguments);
    }
});

