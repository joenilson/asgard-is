/**
 * 
 */
Ext.define('Asgard.view.Content', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.contentpanel',
    titleText: 'System Info',
    initComponent: function() {
        Ext.applyIf(this, {
	    activeTab: 0,
            plain: true,
            items: [{
               xtype: 'iframe-content',
               closable: false,
               id: 'system-info',
               title: this.titleText,
               src: '/application/presentation'
            }]
        });
        this.callParent(arguments);
    }
});
