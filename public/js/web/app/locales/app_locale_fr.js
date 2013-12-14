Ext.define('Asgard.locales.view.headerbar', {
  override: 'Asgard.view.Header',
  appHeaderInfoText: 'Accueil: ',
  appHeaderTitleText: "Système d'Information Asgard",
  appHeaderLogoutText: 'Quitter la Session'
});
Ext.define('Asgard.locales.view.menubar', {
  override: 'Asgard.view.Viewport',
  menuTitleText: 'Menu Principal'
});

Ext.define('Asgard.locales.lib.RadioButtonsScope', {
  override: 'Asgard.lib.RadioButtonsScope',
  fieldLabelText: 'Portée',
  countryFieldText: 'pour le Pays',
  companyFieldText: "pour l'entreprise",
  locationFieldText: 'pour le siège'
});

Ext.define('Asgard.locales.lib.RadioButtonsVersioning', {
  override: 'Asgard.lib.RadioButtonsVersioning',
  fieldLabelText: 'Raison du changement',
  changeFieldText: 'Changement majeur',
  modificationFieldText: 'Modification',
  correctionFieldText: 'Correction mineure'
});

Ext.define('Asgard.locales.lib.toolbarAdmin', {
    override: 'Asgard.lib.toolbarAdmin',
    searchButtonText: 'Rechercher',
    refreshButtonText: 'mettre à jour',
    editButtonText: 'Modifier le contenu',
    saveButtonText: 'Enregistrer les modifications',
    cancelButtonText: 'Annuler les modifications',
    addButtonText: 'Ajouter du contenu',
    removeButtonText: 'Supprimer le contenu'
});

Ext.define('Asgard.locales.lib.toolbarKeyUser', {
    override: 'Asgard.lib.toolbarKeyUser',
    searchButtonText: 'Rechercher',
    refreshButtonText: 'mettre à jour',
    editButtonText: 'Modifier le contenu',
    saveButtonText: 'Enregistrer les modifications',
    cancelButtonText: 'Annuler les modifications',
    addButtonText: 'Ajouter du contenu'
});

Ext.define('Asgard.locales.lib.toolbarEditor', {
    override: 'Asgard.lib.toolbarEditor',
    searchButtonText: 'Rechercher',
    refreshButtonText: 'mettre à jour',
    editButtonText: 'Modifier le contenu',
    saveButtonText: 'Enregistrer les modifications',
    cancelButtonText: 'Annuler les modifications'
});

Ext.define('Asgard.locales.lib.toolbarViewer', {
    override: 'Asgard.lib.toolbarViewer',
    searchButtonText: 'Rechercher',
    refreshButtonText: 'mettre à jour'
});

Ext.define('Asgard.locales.view.window.systemInformation', {
    override: 'Asgard.view.window.systemInformation',
    titleText: 'Les informations du Système',
    companyNameText: 'Entreprise',
    presentationContentReviewText: 'Révisé',
    presentationContentApprovedText: 'Approuvé',
    defaultModuleText: 'Module',
});

Ext.define('Asgard.locales.lib.versioningContent',{
    override: 'Asgard.lib.versioningContent',
    versionFieldText: "Version",
    validFieldText: "Valable à partir de",
    scopeFieldText: "Portée",
    registryFieldText: "Dossier",
    historyFieldText: "Autres versions",
    historyEmptyText: 'Histoire vide'
});

Ext.define('Ext.locales.ux.form.field.OperatorButton',{
    override: 'Ext.ux.form.field.OperatorButton',
    operatorSetText: {
        eq: 'Est égal à',
        ne: 'N\'est pas égal à',
        gte: 'Grande ou égale',
        lte: 'Inférieur ou égal',
        gt: 'Grande de',
        lt: 'Moins que'
    } 
});

Ext.define('Asgard.locales.lib.gridToolbarAdmin',{
    override: 'Asgard.lib.gridToolbarAdmin',
    refreshButtonText: 'Mettre à jour',
    addButtonText: 'Ajouter du contenu',
    removeButtonText: 'Supprimer le contenu',
    enableButtonText: 'Activer le contenu',
    disableButtonText: 'Désactiver le contenu',
    exportButtonText: 'Exporter le contenu'
});

Ext.define('Asgard.locales.lib.gridToolbarSpecial',{
    override: 'Asgard.lib.gridToolbarSpecial',
    refreshButtonText: 'Mettre à jour',
    addButtonText: 'Ajouter du contenu',
    enableButtonText: 'Activer le contenu',
    disableButtonText: 'Désactiver le contenu',
    exportButtonText: 'Exporter le contenu'
});

Ext.define('Asgard.locales.lib.gridToolbarKeyUser',{
    override: 'Asgard.lib.gridToolbarKeyUser',
    refreshButtonText: 'Mettre à jour',
    addButtonText: 'Ajouter du contenu',
    enableButtonText: 'Activer le contenu',
    disableButtonText: 'Désactiver le contenu'
});

Ext.define('Asgard.locales.lib.gridToolbarEditor',{
    override: 'Asgard.lib.gridToolbarEditor',
    refreshButtonText: 'Mettre à jour',
    enableButtonText: 'Activer le contenu',
    disableButtonText: 'Désactiver le contenu'
});

Ext.define('Asgard.locales.lib.gridToolbarViewer',{
    override: 'Asgard.lib.gridToolbarViewer',
    refreshButtonText: 'Mettre à jour'
});


Ext.define('Asgard.locales.lib.grid.documents',{
    override: 'Asgard.lib.grid.documents',
    titleText: 'Control de Documentos',
    idText: 'Id',
    classDocText: 'Classif Doc',
    documentText: 'Document',
    recordText: 'Record',
    versionText: 'Version',
    statusText: 'Statut',
    dateActiveText: 'Date',
    reviewText: 'Réviser',
    protectionText: 'Sauvegarde',
    ownerText: 'Propriétaire',
    locationText: 'Emplacement',
    originText: 'Origine',
    retentionText: 'Temps de rétention',
    toolViewDocText: 'Voir le document',
    toolRequestText: 'Demande de changement'
});

Ext.define('Asgard.locales.lib.forms.CompaniesCombo',{
    override: 'Asgard.lib.forms.CompaniesCombo',
    emptyTextText: 'Il n\'existe pas de données à ce moment',
    fieldLabelText: 'Entreprise'
});

Ext.define('Asgard.locales.lib.forms.CountriesCombo',{
    override: 'Asgard.lib.forms.CountriesCombo',
    emptyTextText: 'Il n\'existe pas de données à ce moment',
    fieldLabelText: 'Pays'
});

Ext.define('Asgard.locales.lib.forms.LocationsCombo',{
    override: 'Asgard.lib.forms.LocationsCombo',
    emptyTextText: 'Il n\'existe pas de données à ce moment',
    fieldLabelText: 'Localité'
});

Ext.define('Asgard.locales.lib.forms.comboCCL',{
    override: 'Asgard.lib.forms.comboCCL',
    emptyTextText: 'Il n\'existe pas de données à ce moment',
    textSubmitButton: 'Consulter'
});

Ext.define('Asgard.locales.lib.forms.docsChangeRequest',{
    override: 'Asgard.lib.forms.docsChangeRequest',
    petitionerFieldText: 'Pétitionnaire' ,
    emailFieldText: 'Email',
    documentFieldText: 'Document Proposé',
    documentFieldEmptyText: 'Choisissez le document',
    requestFieldText: 'Raison du Changement',
    
    textSubmitButton: 'Envoyer',
    textCancelButton: 'Annuler'
});

Ext.define('Asgard.locales.lib.forms.docsNewDocument',{
    override: 'Asgard.lib.forms.docsNewDocument',

    documentClassText: 'Clasificación Doc',
    documentTypeText: 'Estado',
    documentReviewText: 'Revisión',
    documentProtectionText: 'Protección',
    documentOwnerText: 'Responsable del Documento',
    documentLocationText: 'Ubicación',
    documentOriginText: 'Origen',
    documentRetentionText: 'Tiempo de Retención',
    documentDescText: 'Descripción del Documento',
    documentRecordText: 'Registro',
    documentFileText: 'Documento',
    
    documentFieldEmptyText: 'Escoja un documento',
    
    textSubmitButton: 'Envoyer',
    textCancelButton: 'Annuler'
});

Ext.define('Asgard.locales.lib.forms.DocsHelpers',{
    override: 'Asgard.lib.forms.DocsHelpers',
    emptyTextText: 'Il n\'existe pas de données à ce moment'
});