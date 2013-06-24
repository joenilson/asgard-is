Ext.define('Asgard.lib.toolbarKeyUser',{
    extend: 'Ext.Toolbar',
    alias: 'widget.KeyUser-toolbar',
    dock: 'top',
    ui: 'footer',
    searchButtonText: 'Search',
    refreshButtonText: 'Refresh',
    editButtonText: 'Edit Content',
    saveButtonText: 'Save Changes',
    cancelButtonText: 'Cancel Changes',
    addButtonText: 'Add Content',
    searchButton: undefined,
    refreshButton: undefined,
    editButton: undefined,
    saveButton: undefined,
    cancelButton: undefined,
    addButton: undefined,
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
        
        this.editButton = this.editButton || []; 
        this.editButton = Ext.Object.merge({
                text: this.editButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.editButton);
        
        this.saveButton = this.saveButton || []; 
        this.saveButton = Ext.Object.merge({
                text: this.saveButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.saveButton);
        
        this.cancelButton = this.cancelButton || []; 
        this.cancelButton = Ext.Object.merge({
                text: this.cancelButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.cancelButton);
        
        this.addButton = this.addButton || []; 
        this.addButton = Ext.Object.merge({
                text: this.addButtonText,
                type: 'button',
                scope: me,
                handler: onClick
            }, this.addButton);
        
        this.items = this.items || [];
        this.items = this.items.concat([this.editButton, this.addButton, this.saveButton, this.cancelButton, '->', this.searchButton, this.refreshButton ]);

        
        this.callParent(arguments);
    }
});

