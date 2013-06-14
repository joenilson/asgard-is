/**
 * 
 */
Ext.define('Asgard.view.Content', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.contentpanel',
    titleText: 'Portal',
    initComponent: function() {
        Ext.applyIf(this, {
	    activeTab: 0,
            plain: true,
            items: [{
                xtype: 'panel',
                closable: false,
                title: this.titleText,
                loader: {
                    url: '/application/presentation',
                    autoLoad: true
                },      
            },
            ]
        });
        this.callParent(arguments);
    }
});
