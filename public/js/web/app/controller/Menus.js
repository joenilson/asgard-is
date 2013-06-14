Ext.define('Asgard.controller.Menus', {
    extend: 'Ext.app.Controller',

    stores: ['Menus', 'SearchSubmenus'],
    models: ['Menus','Submenus'],
    views: ['Menubar'],
    requires: ['Asgard.lib.RTFPanel','Asgard.lib.RTFEditor','Asgard.lib.RTFViewer',
                'Asgard.lib.toolbarViewer','Asgard.lib.toolbarEditor','Asgard.lib.toolbarKeyUser',
                'Asgard.lib.toolbarAdmin','Asgard.lib.toolbarSpecial'],
    init: function() {
      var me = this;
      this.control({
	'menubar-tree': {
	  itemclick: function(tree, record){
	    this.onMenuItemClicked(record);
	    //console.log(record.get('id_menu'));
	  }
	}
      });
    },
    
    onPanelRendered: function(module) {
        console.log('The panel '+module.alias+' was rendered');
    },
    
    onMenuItemClicked: function(record) {
      if (record.get('leaf')) {
	var tabsPanel = Ext.getCmp('content-panel'); 
	var itemTab = record.get('id_menu')+'-'+record.get('id')+'-panel';
	var tab = Ext.getCmp(itemTab);
	if (tab) {
	  tabsPanel.setActiveTab(tab);
	} else {
	  tabsPanel.add({
	      title: record.get('description'),
	      id: itemTab,
	      closable: true,
	      AutoDestroy: true,
	      xtype: record.get('contentHeader'),
              items: this.createPanelContent(record)
	  }).show();
	  tabsPanel.ownerCt.doLayout();                    			
	}
      }
    },
    
    createPanelContent: function(content){
      console.log(content.get('id_menu'));
      console.log(content.get('contentHeader'));
      console.log(content.get('contentBody'));
      iterItems = content.get('contentBody').split(',');
      this.innerItems = [];
      for (var i = 0; i < iterItems.length; i++)
      {
	this.innerItems[i] = Ext.Object.merge({
	  xtype: iterItems[i],
	  value: 'Hello World',
          height: 500,
        }, this.innerItems[i]);
      }
      console.log(this.innerItems);
      this.config = [{
        //layout: 'fit',
        flex: 1,
	autoScroll: true,
        dockedItems: {
         xtype: 'Viewer-toolbar'
       },
       
       items: this.innerItems

      }];
      return this.config;
    }
});
