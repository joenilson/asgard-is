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