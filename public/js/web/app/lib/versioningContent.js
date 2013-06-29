/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.versioningContent', {
    extend: 'Ext.Container',
    alias: 'widget.versioningbar',
    cls: 'versioning',
    
    /*
     * Text Variables
     */
    versionFieldText: "Version",
    validFieldText: "Valid from",
    scopeFieldText: "Document Scope",
    historyFieldText: "Older Versions",
    historyEmptyText: 'Old versions not found',
    
    /*
     * Objects 
     */
    versionField: undefined,
    validField: undefined,
    scopeField: undefined,
    historyField: undefined,
    
    dock: 'top',
    height: 30,
    
    layout: {
        type: 'hbox',
        align: 'middle'
    },
    defaults: {
        labelWidth: 110,
        width: 80,
        layout: 'anchor',
        flex: 1
    },
    initComponent: function() {
        
        this.versionField = this.versionField || {};
	this.versionField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'versionField',
            fieldLabel: this.versionFieldText,
            //value: this.versionFieldValue
        }, this.versionField);

        this.validField = this.validField || {};
	this.validField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'validField',
            fieldLabel: this.validFieldText,
            value: this.validFieldValue
        }, this.validField);
	
        this.scopeField = this.scopeField || {};
	this.scopeField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'scopeField',
            fieldLabel: this.scopeFieldText,
            value: this.scopeFieldValue
        }, this.scopeField);
        
        this.historyField = this.historyField || {};
	this.historyField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'combobox',
            name: 'historyField',
            fieldLabel: this.historyFieldText,
            width: 180,
            emptyText: this.historyEmptyText
        }, this.historyField);
        
	this.items = this.items || [];
        this.items = this.items.concat([ this.versionField, this.validField, this.scopeField, this.historyField ]);

        this.callParent(arguments);
    }
});