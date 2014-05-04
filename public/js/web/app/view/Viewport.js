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
    'Asgard.lib.Panels.CommitteePanel','Asgard.store.Languages','Asgard.lib.forms.LanguageCombo',
    'Asgard.lib.forms.docsMasterFileUpload','Asgard.lib.grid.documents_upload',
    'Asgard.store.DocsUpload','Asgard.lib.grid.thread_documents','Asgard.store.HiraIncidents',
    'Asgard.lib.grid.hira_incidents','Asgard.lib.Panels.IncidentCausesPanel',
    'Asgard.lib.forms.hiraIncidentCauses','Asgard.lib.forms.hiraIncidentValidity',
    'Asgard.lib.forms.hiraIncidentClose','Asgard.store.SafetyCommitteeProceedings',
    'Asgard.lib.grid.committeeproceedings','Asgard.lib.grid.hira_general',
    'Asgard.store.HiraUpload','Asgard.lib.grid.hira_upload','Asgard.lib.forms.hiraMasterFileUpload',
    'Asgard.store.Requirements','Asgard.lib.grid.requirements','Asgard.store.ReqsUpload',
    'Asgard.lib.forms.reqsMasterFileUpload','Asgard.lib.grid.requirements_upload',
    'Asgard.store.Objectives','Asgard.lib.dataview.objectives','Asgard.lib.grid.ownersprofile',
    'Asgard.store.OwnersProfile','Asgard.lib.dataview.organigram','Asgard.store.Organigram',
    'Asgard.lib.Panels.OrganigramPanel','Asgard.lib.forms.organigramNewOrganigram',
    'Asgard.store.Communications','Asgard.lib.grid.communications','Asgard.lib.forms.commNewCommunication',
    'Asgard.store.TrainingPlan','Asgard.lib.grid.trainingplan','Asgard.lib.forms.trainingNewTrainingPlan',
    'Asgard.store.IEEA','Asgard.lib.grid.ieea','Asgard.lib.forms.ieeaMasterFileUpload','Asgard.store.IEEAUpload',
    'Asgard.lib.grid.ieea_upload','Asgard.lib.forms.CommitteeProcedings','Asgard.store.EmergencyPlan',
    'Asgard.lib.grid.emergencyplan','Asgard.lib.forms.emergencyNewEmergencyPlan','Asgard.store.DrillsMinutes',
    'Asgard.store.IEEA_Thread','Asgard.lib.grid.ieea_thread','Asgard.lib.forms.ownersprofileNewProfile',
    'Asgard.lib.forms.RequirementTypeCombo','Asgard.store.RequirementsHelper',
    'Asgard.lib.forms.requirementNewRequirement','Asgard.lib.dataview.drillsphotos',
    'Asgard.lib.dataview.MSDS','Asgard.lib.Panels.MSDSPanel','Asgard.lib.Panels.drillsPhotosPanel',
    'Asgard.lib.dataview.objectives','Asgard.lib.Panels.ObjectivesPanel','Asgard.lib.grid.msds',
    'Asgard.store.MSDS','Asgard.lib.forms.msdsNewMSDS','Asgard.lib.forms.objectivesNewObjective',
    'Asgard.lib.forms.ipNewInspectionProgram','Asgard.lib.grid.inspectionprogram',
    'Asgard.store.InspectionProgram'
    
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
