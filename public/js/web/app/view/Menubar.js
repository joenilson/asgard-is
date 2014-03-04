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
    	    url: 'commons/getusermenus',
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
                                url: 'commons/getusersubmenus',
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