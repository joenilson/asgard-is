Ext.define('Asgard.view.header.UserInfo', {
    extend: 'Ext.Component',
    alias: 'widget.userinfohead',
    //id: 'app-header-userinfo',
    appHeaderInfoText: 'Welcome: ',
    //xtype: 'component',
    initComponent: function() {
      
      this.config = {
	id: 'app-header-userinfo',
	html: this.appHeaderInfoText,
	flex: 3,
      };
      this.callParent(arguments);
    }
});