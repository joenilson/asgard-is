Ext.define('Asgard.locales.view.headerbar', {
  override: 'Asgard.view.Header',
  appHeaderInfoText: 'Bienvenido: ',
  appHeaderTitleText: 'Sistema de Información Asgard',
  appHeaderLogoutText: 'Cerrar Sesion'
});
Ext.define('Asgard.locales.view.menubar', {
  override: 'Asgard.view.Viewport',
  menuTitleText: 'Menú Principal'
});

Ext.define('Asgard.locales.lib.RadioButtonsScope', {
  override: 'Asgard.lib.RadioButtonsScope',
  fieldLabelText: 'Alcance',
  countryFieldText: 'para el Pais',
  companyFieldText: 'para la empresa',
  locationFieldText: 'para la sede'
});

Ext.define('Asgard.locales.lib.RadioButtonsVersioning', {
  override: 'Asgard.lib.RadioButtonsVersioning',
  fieldLabelText: 'Tipo de Cambio',
  changeFieldText: 'Cambio Mayor',
  modificationFieldText: 'Modificacion',
  correctionFieldText: 'Corrección Menor'
});

Ext.define('Asgard.locales.lib.toolbarAdmin', {
    override: 'Asgard.lib.toolbarAdmin',
    searchButtonText: 'Buscar',
    refreshButtonText: 'Actualizar',
    editButtonText: 'Editar Contenido',
    saveButtonText: 'Guardar cambios',
    cancelButtonText: 'Cancelar cambios',
    addButtonText: 'Agregar Contenido',
    removeButtonText: 'Eliminar Contenido'
});

Ext.define('Asgard.locales.lib.toolbarKeyUser', {
    override: 'Asgard.lib.toolbarKeyUser',
    searchButtonText: 'Buscar',
    refreshButtonText: 'Actualizar',
    editButtonText: 'Editar Contenido',
    saveButtonText: 'Guardar cambios',
    cancelButtonText: 'Cancelar cambios',
    addButtonText: 'Agregar Contenido'
});

Ext.define('Asgard.locales.lib.toolbarEditor', {
    override: 'Asgard.lib.toolbarEditor',
    searchButtonText: 'Buscar',
    refreshButtonText: 'Actualizar',
    editButtonText: 'Editar Contenido',
    saveButtonText: 'Guardar cambios',
    cancelButtonText: 'Cancelar cambios'
});

Ext.define('Asgard.locales.lib.toolbarViewer', {
    override: 'Asgard.lib.toolbarViewer',
    searchButtonText: 'Buscar',
    refreshButtonText: 'Actualizar',
});

Ext.define('Asgard.locales.view.window.systemInformation', {
    override: 'Asgard.view.window.systemInformation',
    titleText: 'Información del Sistema',
    companyNameText: 'Empresa',
    presentationContentReviewText: 'Revisado',
    presentationContentApprovedText: 'Aprobado',
    defaultModuleText: 'Modulo',
});

Ext.define('Asgard.locales.lib.versioningContent',{
    override: 'Asgard.lib.versioningContent',
    versionFieldText: "Version",
    validFieldText: "Valido desde",
    scopeFieldText: "Alcance",
    registryFieldText: "Registro",
    historyFieldText: "Otras Versiones",
    historyEmptyText: 'Historial Vacio'
});

Ext.define('Ext.locales.ux.form.field.OperatorButton',{
    override: 'Ext.ux.form.field.OperatorButton',
    operatorSetText: {
        eq: 'Es igual a',
        ne: 'No es igual a',
        gte: 'Mayor o igual',
        lte: 'Menor o igual',
        gt: 'Mayor que',
        lt: 'Menor que'
    } 
});

Ext.define('Asgard.locales.lib.gridToolbarAdmin',{
    override: 'Asgard.lib.gridToolbarAdmin',
    refreshButtonText: 'Actualizar',
    addButtonText: 'Agregar Contenido',
    removeButtonText: 'Eliminar Contenido',
    enableButtonText: 'Activar Contenido',
    disableButtonText: 'Desactivar Contenido',
    exportButtonText: 'Exportar Contentido'
});

Ext.define('Asgard.locales.lib.gridToolbarSpecial',{
    override: 'Asgard.lib.gridToolbarSpecial',
    refreshButtonText: 'Actualizar',
    addButtonText: 'Agregar Contenido',
    enableButtonText: 'Activar Contenido',
    disableButtonText: 'Desactivar Contenido',
    exportButtonText: 'Exportar Contentido'
});

Ext.define('Asgard.locales.lib.gridToolbarKeyUser',{
    override: 'Asgard.lib.gridToolbarKeyUser',
    refreshButtonText: 'Actualizar',
    addButtonText: 'Agregar Contenido',
    enableButtonText: 'Activar Contenido',
    disableButtonText: 'Desactivar Contenido'
});

Ext.define('Asgard.locales.lib.gridToolbarEditor',{
    override: 'Asgard.lib.gridToolbarEditor',
    refreshButtonText: 'Actualizar',
    enableButtonText: 'Activar Contenido',
    disableButtonText: 'Desactivar Contenido'
});

Ext.define('Asgard.locales.lib.gridToolbarViewer',{
    override: 'Asgard.lib.gridToolbarViewer',
    refreshButtonText: 'Actualizar'
});

Ext.define('Asgard.locales.lib.grid.documents',{
    override: 'Asgard.lib.grid.documents',
    titleText: 'Control de Documentos',
    idText: 'Id',
    classDocText: 'Clase Doc',
    documentText: 'Documento',
    recordText: 'Registro',
    versionText: 'Version',
    statusText: 'Estado',
    dateActiveText: 'Fecha',
    reviewText: 'Revision',
    protectionText: 'Proteccion',
    ownerText: 'Responsable',
    locationText: 'Ubicacion',
    originText: 'Origen',
    retentionText: 'Tiempo de Retencion',
    toolViewDocText: 'Ver Documento',
    toolRequestText: 'Solicitar Cambio'
});

Ext.define('Asgard.locales.lib.forms.CompaniesCombo',{
    override: 'Asgard.lib.forms.CompaniesCombo',
    emptyTextText: 'No hay datos elegidos',
    fieldLabelText: 'Compañia'
});

Ext.define('Asgard.locales.lib.forms.CountriesCombo',{
    override: 'Asgard.lib.forms.CountriesCombo',
    emptyTextText: 'No hay datos elegidos',
    fieldLabelText: 'País'
});

Ext.define('Asgard.locales.lib.forms.LocationsCombo',{
    override: 'Asgard.lib.forms.LocationsCombo',
    emptyTextText: 'No hay datos elegidos',
    fieldLabelText: 'Ubicación'
});

Ext.define('Asgard.locales.lib.forms.comboCCL',{
    override: 'Asgard.lib.forms.comboCCL',
    emptyTextText: 'No hay datos elegidos',
    textSubmitButton: 'Consultar'
});

Ext.define('Asgard.locales.lib.forms.docsChangeRequest',{
    override: 'Asgard.lib.forms.docsChangeRequest',
    petitionerFieldText: 'Solicitante' ,
    emailFieldText: 'Email',
    documentFieldText: 'Documento Propuesto',
    documentFieldEmptyText: 'Escoja el documento',
    requestFieldText: 'Motivo del Cambio',
    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar'
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
    
    textSubmitButton: 'Agregar',
    textCancelButton: 'Cancelar'
});

Ext.define('Asgard.locales.lib.forms.DocsHelpers',{
    override: 'Asgard.lib.forms.DocsHelpers',
    emptyTextText: 'No hay datos elegidos'
});


