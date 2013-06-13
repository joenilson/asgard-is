/**
 * 
 */
Ext.define('Asgard.view.Content', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.contentpanel',
    initComponent: function() {
        Ext.applyIf(this, {
	    activeTab: 0,
            plain: true
        });
        this.callParent(arguments);
    }
});
