Ext.define('Asgard.view.Viewport', {
  extend: 'Ext.container.Viewport',
  layout: 'border',
  requires: ['Asgard.view.Header','Asgard.view.Menubar','Asgard.view.Content','Asgard.view.Statusbar',
    'Asgard.view.statusbar.Clock', 'Asgard.view.statusbar.Actualdate', 'Asgard.view.content.IframeContent',
    'Asgard.lib.MenuTree','Asgard.lib.PanelContent', 'Asgard.lib.RadioButtonsVersioning', 'Asgard.lib.GridPanel',
    'Asgard.lib.RadioButtonsScope', 'Asgard.lib.versioningContent', 'Asgard.view.window.systemInformation',
    'Asgard.store.HiraDocuments','Asgard.store.HiraIncidentsType','Asgard.store.HiraIncidentsList',
    'Asgard.store.Companies','Asgard.store.Countries','Asgard.store.Locations','Asgard.lib.hiraIncidentsDetails',
    'Asgard.store.HiraIncidentsDetails','Asgard.store.ProcessMain','Asgard.lib.Panels.DiagramView',
    'Asgard.store.ProcessThread','Asgard.lib.grid.list','Asgard.lib.window.list',
    'Asgard.lib.Panels.processThreads','Asgard.lib.Panels.threadList','Asgard.store.DocsLibrary',
    'Asgard.lib.forms.docsChangeRequest','Asgard.lib.forms.docsNewDocument',
    'Asgard.lib.forms.CompaniesCombo','Asgard.lib.forms.CountriesCombo','Asgard.lib.forms.LocationsCombo',
    'Asgard.lib.forms.comboCCL','Asgard.lib.grid.documents','Asgard.store.DocsHelpers','Asgard.lib.forms.DocsHelpers'
  ],
  menuTitleText: 'Main Menu',
    defaults: {
  },
  initComponent: function(){
      this.items = [
	{
	    region: 'north',
	    xtype: 'headerbar',
	}, {
	    region: 'west',
	    title: this.menuTitleText,
	    width: 280,
	    xtype: 'menubar'
	}, {
	    region: 'south',
	    collapsible: false,
	    xtype: 'appstatusbar',
	    split: false,
	}, {
	    id: 'content-panel',
	    region: 'center',
	    xtype: 'contentpanel'
	}
    ];
    this.callParent(arguments);
  }
  
});
