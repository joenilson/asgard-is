Ext.define('Asgard.view.Header', {
    extend: 'Ext.Container',
    alias: 'widget.headerbar',
    cls: 'app-header',
    
    /*
     * Text Variables
     */
    appHeaderInfoText: 'Welcome: ',
    appHeaderTitleText: 'Asgard Information System',
    appHeaderLogoutText: "Close Session",
    
    /*
     * Objects 
     */
    headerUserInfo: undefined,
    headerTitle: undefined,
    headerLogout: undefined,
    
    height: 52,
    layout: {
        type: 'hbox',
        align: 'middle'
    },

    initComponent: function(config) {
	//console.log(Asgard.userData.get('alias'));
	me = this;
	me.userAlias = 'User';
	
	var config = {};
        
	Ext.applyIf(this, Ext.apply(this.initialConfig, config));
	
	this.headerTitle = this.headerTitle || {};
	this.headerTitle = Ext.Object.merge({
	    cls: 'app-header-title',
            xtype: 'component',
            ref: 'headerTitle',
            name: 'headerTitle',
	    flex: 1,
            html: this.appHeaderTitleText,
        }, this.headerTitle);

	this.headerUserInfo = this.headerUserInfo || {};
	this.headerUserInfo = Ext.Object.merge({
	    cls: 'app-header-userinfo',
            xtype: 'component',
            ref: 'headerUserInfo',
            name: 'headerUserInfo',
	    flex: 3,
            html: this.appHeaderInfoText+' '+Asgard.userData.get('alias'),
        }, this.headerUserInfo);
	this.headerLogout = this.headerLogout || {};
	this.headerLogout = Ext.Object.merge({
	    cls: 'app-header-logout',
            xtype: 'component',
            ref: 'headerLogout',
            name: 'headerLogout',
	    flex: 0,
            html: "<a href='/auth/logout'>"+this.appHeaderLogoutText+"</a>",
        }, this.headerLogout);
	
	this.items = this.items || [];
        this.items = this.items.concat([ this.headerTitle, this.headerUserInfo, this.headerLogout ]);

        this.callParent(arguments);
    }
});