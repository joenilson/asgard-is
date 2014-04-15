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
    'Asgard.store.HiraDocumentsByThread',
    'Asgard.store.ProcessThread','Asgard.lib.grid.list','Asgard.lib.window.list',
    'Asgard.lib.Panels.processThreads','Asgard.lib.Panels.threadList','Asgard.store.DocsLibrary',
    'Asgard.lib.forms.docsChangeRequest','Asgard.lib.forms.docsNewDocument',,'Asgard.lib.forms.OwnersCombo',
    'Asgard.lib.forms.CompaniesCombo','Asgard.lib.forms.CountriesCombo','Asgard.lib.forms.LocationsCombo',
    'Asgard.lib.forms.comboCCL','Asgard.lib.grid.documents','Asgard.store.DocsHelpers','Asgard.lib.forms.DocsHelpers',
    'Asgard.store.ProcessOwner','Asgard.lib.forms.ThreadsCombo','Asgard.lib.forms.ProcessCombo','Asgard.store.Process',
    'Asgard.store.Users','Asgard.lib.grid.users','Asgard.lib.forms.usersNewUser','Asgard.lib.forms.dateField',
    'Asgard.lib.window.alert','Asgard.lib.grid.changeRequestQueue','Asgard.lib.forms.change_password',
    'Asgard.lib.forms.RequestTreatment','Asgard.lib.gridToolbarViewer','Asgard.lib.grid.hira',
    'Asgard.store.HiraNCType','Asgard.lib.forms.IncidentTypeCombo','Asgard.lib.forms.NonConformityCombo',
    'Asgard.lib.window.windowGeneric','Asgard.lib.forms.hiraNewIncident','Asgard.lib.forms.comboCCLD','Asgard.lib.forms.yearMonthField',
    'Asgard.lib.grid.csi','Asgard.lib.forms.YearsCombo','Asgard.lib.forms.comboCCLY','Asgard.lib.grid.auditors',
    'Asgard.store.Auditors','Asgard.lib.forms.auditorsNewAuditor','Asgard.lib.forms.auditsNewAudit',
    'Asgard.lib.grid.audits','Asgard.store.Audits','Asgard.lib.forms.AuditTypeCombo','Asgard.store.AuditType',
    'Asgard.lib.grid.auditplan','Asgard.store.AuditPlan','Asgard.lib.forms.auditsNewAuditPlan',
    'Asgard.lib.grid.hira_incidents_type','Asgard.lib.grid.hira_incidents_details',
    'Asgard.store.CommitteePositions','Asgard.store.SafetyCommittee','Asgard.lib.forms.CommitteePositionsCombo',
    'Asgard.lib.forms.committeeNewMember','Asgard.lib.dataview.safetycommittee',
    'Asgard.lib.Panels.CommitteePanel'
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
