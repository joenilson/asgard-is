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