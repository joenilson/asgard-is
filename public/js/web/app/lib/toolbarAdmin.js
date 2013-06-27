Ext.define('Asgard.lib.toolbarAdmin',{
    extend: 'Ext.Toolbar',
    alias: 'widget.Admin-toolbar',
    dock: 'top',
    ui: 'footer',
    searchButtonText: 'Search',
    refreshButtonText: 'Refresh',
    editButtonText: 'Edit Content',
    saveButtonText: 'Save Changes',
    addButtonText: 'Add Content',
    removeButtonText: 'Remove Content',
    cancelButtonText: 'Cancel Changes',
    searchButton: undefined,
    refreshButton: undefined,
    editButton: undefined,
    saveButton: undefined,
    addButton: undefined,
    removeButton: undefined,
    cancelButton: undefined,
    initComponent: function(){
        var me = this;
        this.searchButton = this.searchButton || []; 
        this.searchButton = Ext.Object.merge({
                text: this.searchButtonText,
                name: 'search',
                type: 'button',
                itemId: 'search',
                scope: me,
                handler: onClick
            }, this.searchButton);
            
        this.refreshButton = this.refreshButton || []; 
        this.refreshButton = Ext.Object.merge({
                text: this.refreshButtonText,
                name: 'refresh',
                type: 'button',
                itemId: 'refresh',
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
            
        this.items = this.items || [];
        this.items = this.items.concat([this.editButton, this.addButton, this.removeButton, this.saveButton, this.cancelButton, '->', this.searchButton, this.refreshButton ]);
        
        this.callParent(arguments);
    }
});

