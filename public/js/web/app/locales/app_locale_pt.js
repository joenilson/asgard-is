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
    /* Added 15 - May - 2014 */
    toolHistoryText: 'Ver Histórico do documentos',
    historyTitle: 'História do Documento'
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
    override: 'Asgard.lib.grid.emergencyplan',
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

Ext.define('Asgard.locales.lib.grid.requirements',{
    override: 'Asgard.lib.grid.requirements',
    titleText: 'Lista de Requisitos Legais',
    idText: 'Id',
    classText: 'Classe',
    typeText: 'Tipo', 
    nameText: 'Descrição',
    codeText: 'Código',
    datebeginText: 'Válida a partir',
    dateendText: 'Válido até',
    fileText: 'Arquivo',
    statusText: 'Estado',
    toolAddText: 'Adicionar Documento',
    toolUploadText: 'Carregar Template',
    toolRemoveText: 'Excluir Documento',
    toolChangeText: 'Alterar Documento',
    toolViewDocText: 'Visualizar Documento',
    titleNewAuditPlan: 'Adicionar novo Requisito',
    titleEditAuditPlan: 'Alterar Requisito',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'    
});

Ext.define('Asgard.locales.lib.grid.inspectionprogram',{
    override: 'Asgard.lib.grid.inspectionprogram',

    titleText: 'Programa de Inspeção',
    idText: 'Id',
    nameText: 'Descrição',
    fileText: 'Arquivo',
    toolViewDocText: 'Visualizar Arquivo',
    toolAddText: 'Adicionar',
    toolRemoveText: 'Excluir documento',
    toolChangeText: 'Alterar documento',
    titleNewAuditor: 'Adicionar Programa de Inspeção',
    titleEditAuditor: 'Alterar Programa de Inspeção',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.hazardoussupplies',{
    override: 'Asgard.lib.grid.hazardoussupplies',

    titleText: 'Insumos Perigosos',
    idText: 'Id',
    nameText: 'Insumo',
    typeText: 'Tipo',
    toolAddText: 'Adicionar Insumo Peligroso',
    toolRemoveText: 'Excluir Insumo Peligroso',
    toolChangeText: 'Alterar Insumo Peligroso',
    
    titleNewAuditor: 'Adicionar novo Insumo Perigoso',
    titleEditAuditor: 'Alterar Insumo Perigoso',
    
    chooseTitleText: 'Aviso',
    chooseTitleBodyDelete: 'Ele vai excluir um registro!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.Panels.SecurityHandbookPanel',{
    override: 'Asgard.lib.Panels.SecurityHandbookPanel',

    barAddText: 'Adicionar Manual de Segurança',
    barRemoveText: 'Excluir Manual de Segurança',
    warningTitle: 'Aviso',
    warningBody: 'Não é possível processar o formulário, por favor, verifique seus dado',
    warningTitleBodyDelete: 'You are choosing delete this member. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.ohr',{
    override: 'Asgard.lib.grid.ohr',
    titleText: 'Registro de Saúde Ocupacional',
    typeText: 'Tipo',
    descText: 'Descrição',
    fileText: 'Documento',
    toolAddText: 'Adicionar Registro',
    toolUploadText: 'Carregar Template',
    toolRemoveText: 'Excluir Registro',
    toolChangeText: 'Alterar Registro',
    toolViewDocText: 'Ver Arquivo',
    titleNewAuditPlan: 'Adicionar Novo Registro',
    titleEditAuditPlan: 'Editar Registro',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.simulationsalbums',{
    override: 'Asgard.lib.grid.simulationsalbums',

    titleText: 'Simulações',
    idText: 'Id',
    nameText: 'Descrição',
    dateText: 'Data',    
    toolAddText: 'Adicionar Simulação',
    toolRemoveText: 'Excluir Simulação',
    toolChangeText: 'Alterar Simulação',
    uploadToolText: 'Mass Upload',
    titleNewAuditor: 'Adicionar Nova Simulação',
    titleEditAuditor: 'Editar Simulação',
    
    chooseTitleText: 'Aviso',
    chooseTitleBodyDelete: 'Va remover um álbum, incluindo fotos!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?' 
});

Ext.define('Asgard.locales.lib.Panels.drillsPhotosPanel',{
    override: 'Asgard.lib.Panels.drillsPhotosPanel',

    barAddText: 'Adicionar Images',
    barRemoveText: 'Eliminar Images',
    
    warningTitle: 'Aviso',
    warningBody: 'Falha ao processar as imagens, por favor, verifique os arquivos',
    warningTitleBodyDelete: 'Tem certeza de que deseja excluir esta(s) imagem(s). <br />Quer continuar com esta ação?',
    emptyTitleText: 'Simulação não selecionado',
    emptyMessageText: 'Você não selecionou uma simulação, <br />Por favor, selecione um para adicionar Images...',

});

Ext.define('Asgard.locales.lib.grid.hira_incidents',{
    override: 'Asgard.lib.grid.hira_incidents',


    titleText: 'Lista de Incidentes',
    idText: 'Id',
    nctypeText: 'Não conformidade',
    typeText: 'Tipo de Incidentes',
    descriptionText: 'Descrição',
    authorText: 'Registrant',
    processText: 'Processo',
    threadText: 'Fio',
    emailText: 'Email',
    dateText: 'Data',
    statusText: 'Estado',
    causesToolText: 'Causas do Incidente',
    closeToolText: 'Fechar incidente',
    validityToolText: 'Validação do fechamento',
    deleteToolText: 'Remover Incidente',
    addToolText: 'Adicionar Incidente',
    resultTitleText: 'Correto!',
    resultMessageText: 'incidentes processados.',
    failureTitleText: 'Aviso',
    failureMessageText: 'O servidor não pôde processar os dados, <br />Por favor, reveja o formulário.',
    buttonAcceptText: 'Salvar arquivos',
    emptyTitleText: 'Nada é selecionado',
    emptyMessageText: 'Incidente não foi selecionado, <br />Por favor, selecione uma para o processamento...',
    wrongTitleText: 'Estado errado',
    wrongMessageText: 'O status do incidente é incorreto, <br />Por favor, faça o tratamento adequado...',
    chooseTitleText: 'Aviso',
    chooseTitleBodyDelete: 'Irá remover um incidente!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    titleCausesTool: 'Causas da Não conformidade',
    valTreatment1: 'Aberto',
    valTreatment2: 'Fechado',
    valTreatment4: 'Fechado e Validado',
    titleIncident: 'Incidente: '
});

Ext.define('Asgard.locales.lib.grid.hira_general',{
    override: 'Asgard.lib.grid.hira_general',
    titleText: 'Identificação de Perigos e Avaliação de Riscos :: IPAR',
    idText: 'Id',
    processText: 'Processo',
    threadText: 'Fio',
    activityText: 'Atividade',
    dangerText: 'Perigo',
    riskText: 'Risco',
    evaluationHiraText: 'Avaliação IPAR',
    evaluationHiraHText: 'A',
    evaluationHiraMText: 'M',
    evaluationHiraLText: 'B',
    controlMeasuresText: 'Medidas a serem implementadas',
    residualRiskText: 'Avaliação de Risco Residual',
    residualRiskHText: 'A',
    residualRiskMText: 'M',
    residualRiskLText: 'B',
    editToolText: 'Editar',
    deleteToolText: 'Remover',
    addToolText: 'Adicionar',
    uploadToolText: 'Fazer Upload de Template',
    emptyTextText: 'Este local não possui IPAR atribuídos',
    resultTitleText: 'Sucesso',
    resultMessageText: 'incidentes procesados.',
    failureTitleText: 'Aviso',
    failureMessageText: 'O servidor não pôde processar o arquivo, <br />Por favor, reveja os seus dados.',
    buttonAcceptText: 'Salvar dados',
    emptyTitleText: 'Nada é selecionado',
    emptyMessageText: 'Não é um item selecionado, <br />Por favor, selecione uma para o processamento...',
    chooseTitleText: 'Advertencia',
    chooseTitleBodyDelete: 'Va eliminar un item!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});

Ext.define('Asgard.locales.lib.grid.mtm',{
    override: 'Asgard.lib.grid.mtm',
    titleText: 'Medição e Monitoramento',
    typeText: 'Tipo ',
    descText: 'Descrição',
    fileText: 'Documento',
    toolAddText: 'Adicionar Documento',
    toolUploadText: 'Fazer Upload de Template',
    toolRemoveText: 'Excluir documento',
    toolChangeText: 'Alterar Documento',
    toolViewDocText: 'Visualizar documento',
    titleNewAuditPlan: 'Adicionar Novo Documento',
    titleEditAuditPlan: 'Editar Documento',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum arquivo associado com este documento...',
    chooseTitleBodyDelete: 'Ela irá remover um documento!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.isoplan',{
    override: 'Asgard.lib.grid.isoplan',

    titleText: 'Plano de Qualidade, Ambiente, Segurança e Saúde Ocupacional',
    processText: 'Processo',
    threadText: 'Fio',
    ownerText: 'Proprietário',
    docText: 'Documento',
    indicatorText: 'Indicador',
    varsText: 'Variáveis',
    recordfileText: 'Registro de controle',
    frequencyText: 'Freqüência',
    fileText: 'Documento',
    toolAddText: 'Adicionar Entrada',
    toolUploadText: 'Fazer Upload de Template',
    toolRemoveText: 'Excluir Entrada',
    toolChangeText: 'Alterar Entrada',
    toolViewDocText: 'Visualizar documento',
    titleNewAuditPlan: 'Adicionar Novo Documento',
    titleEditAuditPlan: 'Editar Entrada',
    loadingFileText: 'Carregando Documento... por favor aguarde...',
    chooseTitleText: 'Aviso',
    emptyFileMessage: 'Não há nenhum documento associado com esta entrada...',
    chooseTitleBodyDelete: 'Ela irá remover uma entrada!. <br />Quer continuar com esta ação?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});

Ext.define('Asgard.locales.lib.grid.IPGrid',{
    override: 'Asgard.lib.grid.IPGrid',
    idText: 'Id',
    nameText: 'Descrição',
    typeText: 'Fio',
    threadText: 'Fio',
    ioText: 'I/O'
});

Ext.define('Asgard.locales.lib.Panels.ISOPlanDetailPanel',{
    override: 'Asgard.lib.Panels.ISOPlanDetailPanel',
    ownersText: 'Proprietário',
    iperText: 'Perigos e Riscos',
    ioText: 'Entradas (I) / Saída (O)',
    eaText: 'Impacto Ambiental',
    recordsText: 'Registros',
    documentsText: 'Procedimentos de Controle Operacional'
});

Ext.define('Asgard.locales.lib.forms.hiraMasterFileUpload',{
    override: 'Asgard.lib.forms.hiraMasterFileUpload',
    excelFileText: 'Template Excel 2003 (.xls)',
    excelFieldEmptyText: 'Escolher arquivo Excel',    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Aviso',
    warningText: 'Dados incompletos!, revisar seus dados',
    required: '<span style="color:red;font-weight:bold" data-qtip="Obrigatório">*</span>',
    successText: 'Documentos enviada com sucesso!',
    failureText: 'Algo deu errado, verificar o formulário e tente novamente',
    typeText: 'Tipo de dados',
    additionText: 'Dados Adicionais',
    changeText: 'Substituição de Dados'
});

Ext.define('Asgard.locales.lib.dataview.policies',{
    override: 'Asgard.lib.dataview.policies',
    emptyTextText: 'Não há nenhum documento para mostrar...'
});

Ext.define('Asgard.locales.lib.dataview.policies',{
    override: 'Asgard.lib.forms.policiesNewPolicy',
    descriptionText: 'Descrição',
    fileText: 'Política em PDF',
    fileFieldEmptyText: 'Escolha um arquivo PDF',    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',

    warningTitle: 'Advertência',
    warningText: 'A política já existe!, eliminar antigo para entrar no novo',
    required: '<span style="color:red;font-weight:bold" data-qtip="Obrigatório">*</span>',
    successText: 'Política atualizada corretamente!',
    failureText: 'O processo não está completo corretamente, por favor, tente novamente.'
});

Ext.define('Asgard.locales.lib.dataview.policies',{
    override: 'Asgard.lib.Panels.PoliciesPanel',
    barAddText: 'Adicionar Política',
    barRemoveText: 'Remover Política',
    warningTitle: 'Advertência',
    warningBody: 'Não foi possível processar o seu documento, por favor, verifique se o arquivo não está errado.',
    warningTitleBodyDelete: 'Você optou por excluir este arquivo. <br />Quer continuar?'
});