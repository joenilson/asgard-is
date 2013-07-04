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
    registryFieldText: "Registry",
    historyEmptyText: 'Old versions not found',
    
    /*
     * Objects 
     */
    versionField: undefined,
    validField: undefined,
    scopeField: undefined,
    historyField: undefined,
    registryField: undefined,
    
    dock: 'top',
    height: 30,
    
    layout: {
        type: 'hbox',
        align: 'middle'
    },
    defaults: {
        labelWidth: 110,
        //width: 100,
        //layout: 'anchor',
        //flex: 3
    },
    initComponent: function() {
        
        this.registryField = this.registryField || {};
	this.registryField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'registryField',
            fieldLabel: this.registryFieldText,
            anchor: '25%',
            //value: this.versionFieldValue
        }, this.registryField);
        
        this.versionField = this.versionField || {};
	this.versionField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'versionField',
            fieldLabel: this.versionFieldText,
            anchor: '10%',
            //value: this.versionFieldValue
        }, this.versionField);

        this.validField = this.validField || {};
	this.validField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'validField',
            fieldLabel: this.validFieldText,
            anchor: '15%',
            value: this.validFieldValue
        }, this.validField);
	
        this.scopeField = this.scopeField || {};
	this.scopeField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'displayfield',
            name: 'scopeField',
            fieldLabel: this.scopeFieldText,
            anchor: '20%',
            value: this.scopeFieldValue
        }, this.scopeField);
        
        this.historyField = this.historyField || {};
	this.historyField = Ext.Object.merge({
	    //cls: 'app-header-title',
            xtype: 'combobox',
            name: 'historyField',
            fieldLabel: this.historyFieldText,
            anchor: '30%',
            emptyText: this.historyEmptyText
        }, this.historyField);
        
	this.items = this.items || [];
        this.items = this.items.concat([ this.registryField, this.versionField, this.validField, this.scopeField, this.historyField ]);

        this.callParent(arguments);
    }
});