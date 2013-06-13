/**
 * 
 */
Ext.define('Asgard.view.Menubar' ,{
    extend: 'Ext.panel.Panel',
    alias : 'widget.menubar',
    /*
     * Application Vars
     */
    layout:'accordion',
    defaults: {
        //margins : '0 0 0 0'
    },
    autoScroll: true,
    resizable: true,
    collapsible: true,
    layoutConfig: {
      titleCollapse: false,
      animate: true,
      activeOnTop: true
    },

    initComponent: function() {
	
    	Ext.Ajax.request({
    	    url: '/commons/getusermenus',
    	    params: {
    	        module: 'menu'
    	    },
    	    success: function(result, request){
    	        var data = Ext.decode(result.responseText);
    	        for(var key in data.results){
                    if(data.results[key].mid!==undefined){
                    	var submenukey = 'm'+data.results[key].mid;
                    	var storesm = Ext.create('Ext.data.TreeStore', {
                            model: 'Asgard.model.Submenus',
                            proxy: {
                                type: 'ajax',
                                url: '/commons/getusersubmenus',
				extraParams: {
				    idmenu: data.results[key].mid,
				    module: 'submenu'
				},
				reader: {
                                    root: 'nodes'
                                },
				actionMethods: 'POST'
                            },
                            folderSort: false
                        });
			
			var tree = Ext.create('Asgard.lib.MenuTree',{
			  id: submenukey,
			  store: storesm,
			});

			//console.log(data.results[key].icon);
			var myPanel = Ext.create('Asgard.lib.PanelContent',{
			  title: data.results[key].mshortdesc,
			  iconCls: data.results[key].icon, 
			  items: [ tree ],
			  fit: true,
			  id: data.results[key].mid
			});

			this.add(myPanel);
                    }
    	        }
    	    },
    	    failure: function(result, request){
                console.log('Error al Generar el Menu!');
            },
            scope: this
    	});
    this.callParent(arguments);
    }
});


/*
Ext.define('Asgard.view.Menubar', {
  extend: 'Ext.panel.Panel',
  alias: 'widget.menubar',
  width: 200,
  minWidth: 175,
  maxWidth: 400,
  margins: '0 0 0 5',
  title: 'Navigation',
  split: true,
  collapsible: true,
  animCollapse: true,
  layout: 'accordion',
  items: [{
      title: 'Navigation',
      html: '<p>Some Links in here.</p>',
      iconCls: 'nav' // see the HEAD section for style used
  }, {
      title: 'Settings',
      html: '<p>Some settings in here.</p>',
      iconCls: 'settings'
  }, {
      title: 'Information',
      html: '<p>Some info in here.</p>',
      iconCls: 'info'
  }],
  initComponent: function() {
	Ext.apply(this, {
            //items: this.createItems()
            //dockedItems: this.createToolbar()
	    //this.createMenu();
        });
        this.callParent(arguments);
    },
    createView: function(){
        this.view = Ext.create('widget.dataview', {
            autoScroll: true,
            store: Ext.create('Ext.data.Store', {
                model: 'Feed',
                data: this.feeds
            }),
            selModel: {
                mode: 'SINGLE',
                listeners: {
                    scope: this,
                    selectionchange: this.onSelectionChange
                }
            },
            listeners: {
                scope: this,
                contextmenu: this.onContextMenu,
                viewready: this.onViewReady
            },
            trackOver: true,
            cls: 'feed-list',
            itemSelector: '.feed-list-item',
            overItemCls: 'feed-list-item-hover',
            tpl: '<tpl for="."><div class="feed-list-item">{title}</div></tpl>'
        });
        return this.view;
    },

    onViewReady: function(){
        this.view.getSelectionModel().select(this.view.store.first());
    },
});
*/