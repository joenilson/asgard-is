Ext.define('Asgard.locales.view.headerbar', {
  override: 'Asgard.view.Header',
  appHeaderInfoText: 'Boas-vindas: ',
  appHeaderTitleText: 'Sistema de Informação Asgard',
  appHeaderLogoutText: 'Fechar Sessão'
});
Ext.define('Asgard.locales.view.menubar', {
  override: 'Asgard.view.Viewport',
  menuTitleText: 'Menu Principal'
});

Ext.define('Asgard.locales.lib.RadioButtonsScope', {
  override: 'Asgard.lib.RadioButtonsScope',
  fieldLabelText: 'Escopo',
  countryFieldText: 'para o País',
  companyFieldText: 'para a empresa',
  locationFieldText: 'para a sede'
});

Ext.define('Asgard.locales.lib.RadioButtonsVersioning', {
  override: 'Asgard.lib.RadioButtonsVersioning',
  fieldLabelText: 'Motivo da alteração',
  changeFieldText: 'Grande mudança',
  modificationFieldText: 'Modificação',
  correctionFieldText: 'Correção Minor'
});

Ext.define('Asgard.locales.lib.toolbarAdmin', {
    override: 'Asgard.lib.toolbarAdmin',
    searchButtonText: 'Pesquisar',
    refreshButtonText: 'Atualizar',
    editButtonText: 'Editar Conteúdo',
    saveButtonText: 'Salvar Alterações',
    cancelButtonText: 'Cancelar Mudanças',
    addButtonText: 'Adicionar conteúdo',
    removeButtonText: 'Remover conteúdo'
});

Ext.define('Asgard.locales.lib.toolbarKeyUser', {
    override: 'Asgard.lib.toolbarKeyUser',
    searchButtonText: 'Pesquisar',
    refreshButtonText: 'Atualizar',
    editButtonText: 'Editar Conteúdo',
    saveButtonText: 'Salvar Alterações',
    cancelButtonText: 'Cancelar Mudanças',
    addButtonText: 'Adicionar conteúdo'
});

Ext.define('Asgard.locales.lib.toolbarEditor', {
    override: 'Asgard.lib.toolbarEditor',
    searchButtonText: 'Pesquisar',
    refreshButtonText: 'Atualizar',
    editButtonText: 'Editar Conteúdo',
    saveButtonText: 'Salvar Alterações',
    cancelButtonText: 'Cancelar Mudanças',
});

Ext.define('Asgard.locales.lib.toolbarViewer', {
    override: 'Asgard.lib.toolbarViewer',
    searchButtonText: 'Pesquisar',
    refreshButtonText: 'Atualizar',
});

Ext.define('Asgard.locales.view.window.systemInformation', {
    override: 'Asgard.view.window.systemInformation',
    titleText: 'Informações sobre o Sistema',
    companyNameText: 'Empresa',
    presentationContentReviewText: 'Revisado',
    presentationContentApprovedText: 'Aprovado',
    defaultModuleText: 'Módulo',
});

Ext.define('Asgard.locales.lib.versioningContent',{
    override: 'Asgard.lib.versioningContent',
    versionFieldText: "Versão",
    validFieldText: "Válido a partir de",
    scopeFieldText: "Escopo",
    registryFieldText: "Registrar",
    historyFieldText: "Outras versões",
    historyEmptyText: 'Historial Vazio',
});

Ext.define('Ext.locales.ux.form.field.OperatorButton',{
    override: 'Ext.ux.form.field.OperatorButton',
    operatorSetText: {
        eq: 'É igual',
        ne: 'Não é igual',
        gte: 'Grande ou igual',
        lte: 'Menos do que ou igual',
        gt: 'Grande de',
        lt: 'Menos que'
    } 
});

Ext.define('Asgard.locales.lib.gridToolbarAdmin',{
    override: 'Asgard.lib.gridToolbarAdmin',
    refreshButtonText: 'Atualizar',
    addButtonText: 'Adicionar conteúdo',
    removeButtonText: 'Remover conteúdo',
    enableButtonText: 'Habilitar Conteúdo',
    disableButtonText: 'Desativar conteúdo',
    exportButtonText: 'Exportar conteúdo'
});

Ext.define('Asgard.locales.lib.gridToolbarSpecial',{
    override: 'Asgard.lib.gridToolbarSpecial',
    refreshButtonText: 'Atualizar',
    addButtonText: 'Adicionar conteúdo',
    enableButtonText: 'Habilitar Conteúdo',
    disableButtonText: 'Desativar conteúdo',
    exportButtonText: 'Exportar conteúdo'
});

Ext.define('Asgard.locales.lib.gridToolbarKeyUser',{
    override: 'Asgard.lib.gridToolbarKeyUser',
    refreshButtonText: 'Atualizar',
    addButtonText: 'Adicionar conteúdo',
    enableButtonText: 'Habilitar Conteúdo',
    disableButtonText: 'Desativar conteúdo'
});

Ext.define('Asgard.locales.lib.gridToolbarEditor',{
    override: 'Asgard.lib.gridToolbarEditor',
    refreshButtonText: 'Atualizar',
    enableButtonText: 'Habilitar Conteúdo',
    disableButtonText: 'Desativar conteúdo'
});

Ext.define('Asgard.locales.lib.gridToolbarViewer',{
    override: 'Asgard.lib.gridToolbarViewer',
    refreshButtonText: 'Atualizar'
});

Ext.define('Asgard.locales.lib.grid.documents',{
    override: 'Asgard.lib.grid.documents',
    titleText: 'Controle de Documentos',
    idText: 'Id',
    classDocText: 'Doc Classif',
    documentText: 'Documento',
    recordText: 'Registro',
    versionText: 'Versão',
    statusText: 'Estado',
    dateActiveText: 'Data',
    reviewText: 'Revisão',
    protectionText: 'Proteção',
    ownerText: 'Proprietário',
    locationText: 'Localização',
    originText: 'Origem',
    retentionText: 'Tempo de Retenção',
    toolViewDocText: 'Visualizar o documento',
    toolRequestText: 'solicitação de Mudança'
});

Ext.define('Asgard.locales.lib.forms.CompaniesCombo',{
    override: 'Asgard.lib.forms.CompaniesCombo',
    emptyTextText: 'Não há dados neste momento',
    fieldLabelText: 'Companhia'
});

Ext.define('Asgard.locales.lib.forms.CountriesCombo',{
    override: 'Asgard.lib.forms.CountriesCombo',
    emptyTextText: 'Não há dados neste momento',
    fieldLabelText: 'País'
});

Ext.define('Asgard.locales.lib.forms.LocationsCombo',{
    override: 'Asgard.lib.forms.LocationsCombo',
    emptyTextText: 'Não há dados neste momento',
    fieldLabelText: 'Sede'
});

Ext.define('Asgard.locales.lib.forms.comboCCL',{
    override: 'Asgard.lib.forms.comboCCL',
    emptyTextText: 'Não há dados neste momento',
    textSubmitButton: 'Procurar'
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
    emptyTextText: 'Não há dados neste momento'
});