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
    titleText: 'Mestre Lista de Documentos e Registros',
    idText: 'Id',
    classDocText: 'Doc Classif',
    documentText: 'Documento',
    recordText: 'Registro',
    versionText: 'Versão',
    statusText: 'Estado',
    dateActiveText: 'Data de Revisão',
    dateVersionText: 'Data de Versão',
    reviewText: 'Revisão',
    protectionText: 'Proteção',
    ownerText: 'Proprietário',
    locationText: 'Localização',
    originText: 'Origem',
    retentionText: 'Tempo de Retenção',
    toolViewDocText: 'Visualizar o documento',
    toolRequestText: 'solicitação de Mudança',
    /* Added 03 - May - 2014 */
    toolAddText: 'Adicionar Documento',
    toolRemoveText: 'Excluir Documento',
    toolChangeText: 'Ver Solicitações de Alteração',
    toolMassText: 'Carregar Modelo de documentos',
    titleNewDocument: 'Adicionar um Documento',
    titleEditDocument: 'Editar Documento',
    loadingFileText: 'Carregando Documento.. Por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'Você está escolhendo a mudança este item. <br />Quer continuar com esta ação?',
    warningTitle: 'Aviso!',
    emptyCCLText: 'Por favor completos Los Campos Companhia, País e Sede',
    emptyTitleText: 'Não é selecionado nada',
    emptyMessageText: 'Não é selecionado documento, <br />Para continuar selecione primeiro um documento...',
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
    petitionerFieldText: 'Requerente' ,
    emailFieldText: 'Email',
    documentFieldText: 'Documento proposto',
    documentFieldEmptyText: 'Escolha um documento',
    requestFieldText: 'Motivo da alteração',
    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar'
});

Ext.define('Asgard.locales.lib.forms.docsNewDocument',{
    override: 'Asgard.lib.forms.docsNewDocument',

    documentClassText: 'Classificação Doc',
    documentTypeText: 'Estado',
    documentReviewText: 'Revisão',
    documentProtectionText: 'Proteção',
    documentProcessText: 'Processo',
    documentOwnerText: 'Responsável da Documento',
    documentLocationText: 'Localização',
    documentOriginText: 'Origem',
    documentRetentionText: 'Tempo de Retenção',
    documentDescText: 'Descrição do Documento',
    documentRecordText: 'Registro',
    documentDVText: 'Data inclusão',
    documentDRText: 'Data de revisão',
    documentFileText: 'Documento',
    
    documentFieldEmptyText: 'Escolha um documento',
    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar'
});

Ext.define('Asgard.locales.lib.forms.DocsHelpers',{
    override: 'Asgard.lib.forms.DocsHelpers',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.OwnersCombo',{
    override: 'Asgard.lib.forms.OwnersCombo',
    fieldLabelText: 'Proprietário',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.ProcessCombo',{
    override: 'Asgard.lib.forms.ProcessCombo',
    fieldLabelText: 'Processo',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.ThreadsCombo',{
    override: 'Asgard.lib.forms.ThreadsCombo',
    fieldLabelText: 'Fio',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.IncidentTypeCombo',{
    override: 'Asgard.lib.forms.IncidentTypeCombo',
    fieldLabelText: 'Gênero do incidente',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.NonConformityCombo',{
    override: 'Asgard.lib.forms.NonConformityCombo',
    fieldLabelText: 'Tipo de Não-conformidade',
    emptyTextText: 'Não há dados neste momento'
});

Ext.define('Asgard.locales.lib.forms.usersNewUser',{
    override: 'Asgard.lib.forms.usersNewUser',
    
    usernameText: 'Usuário',
    passwordText: 'Senha',
    realnameText: 'Nome Completo',
    emailText: 'E-mail',
    adminText: 'Ele é um diretor?',
    langText: 'Língua',
    
    textSubmitButton: 'Adicionar',
    textCancelButton: 'Cancelar',
    
    warningTitle: 'Aviso',
    warningText: "Usuário já existe!, Escolha outro nome de usuário"
    
});

Ext.define('Asgard.locales.lib.grid.changeRequestQueue',{
    override: 'Asgard.lib.grid.changeRequestQueue',
    docAffectedText: 'Doc. Afetado',
    descriptionText: 'Descrição',
    userText: 'Requerente',
    dateText: 'Data',
    statusText: 'Estado',
    
    toolViewDocText: 'Ver Proposta',
    toolViewOriginalText: 'Ver Original',
    toolRequestText: 'Tratar da Aplicação'
});

Ext.define('Asgard.locales.lib.forms.RequestTreatment',{
    override: 'Asgard.lib.forms.RequestTreatment',
    treatmentText: 'Aceito?',
    reasonText: 'Razão',
    treatmentYesText: 'Se',
    treatmentNoText: 'Não',
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Aviso'
});

Ext.define('Asgard.locales.lib.forms.hiraNewIncident',{
    override: 'Asgard.lib.forms.hiraNewIncident',
    objectRegisterCodeText: 'Código do Registo',
    objectRegisterNameText: 'Nome escrivão',
    objectRegisterSurnameText: 'Primeiro Nome',
    objectRegisterLastnameText: 'Sobrenome',
    objectRegisterEmailText: 'E-mail',
    objectIncidentDescText: 'Descrição do Incidente',
    objectIncidentDateText: 'Data do Incidente'
});

Ext.define('Asgard.locales.lib.forms.yearMonthField',{
    override: 'Asgard.lib.forms.yearMonthField',
    emptyTextText: 'Escolha uma data',
    fieldLabelText: 'Mês e Ano'
});

Ext.define('Asgard.locales.lib.grid.emergencyplan',{
    override: 'Asgard.lib.forms.yearMonthField',
    titleText: 'Registros Planejamento e exercícios de emergência',
    descText: 'Descrição',
    dateText: 'Data',
    fileText: 'Documento',
    toolAddText: 'Adicionar',
    toolUploadText: 'Carregar Predefinição',
    toolRemoveText: 'Excluir Entrada',
    toolChangeText: 'Alterar Entrada',
    toolViewDocText: 'Ver Arquivo',
    titleNewAuditPlan: 'Adicionar novo documento',
    titleEditAuditPlan: 'Editar Documento',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});