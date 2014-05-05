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
    titleText: 'Lista Maestra de Documentos y Registros',
    idText: 'Id',
    classDocText: 'Clase Doc',
    documentText: 'Documento',
    recordText: 'Registro',
    versionText: 'Version',
    statusText: 'Estado',
    dateRevisionText: 'Fecha de Revisión',
    dateVersionText: 'Fecha de Versión',
    reviewText: 'Revision',
    protectionText: 'Proteccion',
    ownerText: 'Responsable',
    locationText: 'Ubicacion',
    originText: 'Origen',
    retentionText: 'Tiempo de Retencion',
    toolViewDocText: 'Ver Documento',
    toolRequestText: 'Solicitar Cambio',
    /* Added 03 - May - 2014 */
    toolAddText: 'Agregar Documento',
    toolRemoveText: 'Eliminar Documento',
    toolChangeText: 'Ver las Solicitudes de Cambio',
    toolMassText: 'Subir Plantilla de Documentos',
    titleNewDocument: 'Agregar un Documento',
    titleEditDocument: 'Editar Documento',
    loadingFileText: 'Cargando Documento.. espere por favor...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No existe el archivo asociado a este documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    warningTitle: 'Advertencia!',
    emptyCCLText: 'Por favor complete los campos Compañia, Pais y Ubicación',
    emptyTitleText: 'No se ha seleccionado nada',
    emptyMessageText: 'No se ha seleccionado ningún documento, <br />Para continuar primero seleccione un documento...',
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
    documentProcessText: 'Proceso',
    documentOwnerText: 'Responsable del Documento',
    documentLocationText: 'Ubicación',
    documentOriginText: 'Origen',
    documentRetentionText: 'Tiempo de Retención',
    documentDescText: 'Descripción del Documento',
    documentRecordText: 'Registro',
    documentDVText: 'Fecha Inclusión',
    documentDRText: 'Fecha Revisión',
    documentFileText: 'Documento',
    
    documentFieldEmptyText: 'Escoja un documento',
    
    textSubmitButton: 'Agregar',
    textCancelButton: 'Cancelar'
});

Ext.define('Asgard.locales.lib.forms.DocsHelpers',{
    override: 'Asgard.lib.forms.DocsHelpers',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.OwnersCombo',{
    override: 'Asgard.lib.forms.OwnersCombo',
    fieldLabelText: 'Propietario',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.ProcessCombo',{
    override: 'Asgard.lib.forms.ProcessCombo',
    fieldLabelText: 'Proceso',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.ThreadsCombo',{
    override: 'Asgard.lib.forms.ThreadsCombo',
    fieldLabelText: 'Subproceso',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.NonConformityCombo',{
    override: 'Asgard.lib.forms.NonConformityCombo',
    fieldLabelText: 'Tipo No Conformidad',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.IncidentTypeCombo',{
    override: 'Asgard.lib.forms.IncidentTypeCombo',
    fieldLabelText: 'Tipo de Incidente',
    emptyTextText: 'No hay datos elegidos'
});

Ext.define('Asgard.locales.lib.forms.usersNewUser',{
    override: 'Asgard.lib.forms.usersNewUser',
    
    usernameText: 'Usuario',
    passwordText: 'Clave',
    realnameText: 'Nombre Completo',
    emailText: 'Correo',
    adminText: 'Es admin?',
    langText: 'Idioma',
    
    textSubmitButton: 'Agregar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Advertencia',
    warningText: 'El usuario ya existe!, elija otro nombre de usuario'
    
});

Ext.define('Asgard.locales.lib.grid.changeRequestQueue',{
    override: 'Asgard.lib.grid.changeRequestQueue',
    docAffectedText: 'Doc. Afectado',
    descriptionText: 'Descripción',
    userText: 'Solicitante',
    dateText: 'Fecha',
    statusText: 'Estado',
    
    toolViewDocText: 'Ver Propuesta',
    toolViewOriginalText: 'Ver Original',
    toolRequestText: 'Tratar Solicitud'
});

Ext.define('Asgard.locales.lib.forms.RequestTreatment',{
    override: 'Asgard.lib.forms.RequestTreatment',
    treatmentText: 'Se acepta?',
    reasonText: 'Motivo',
    treatmentYesText: 'Si',
    treatmentNoText: 'No',
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Advertencia'
});

Ext.define('Asgard.locales.lib.forms.hiraNewIncident',{
    override: 'Asgard.lib.forms.hiraNewIncident',
    objectRegisterCodeText: 'Codigo de Registro',
    objectRegisterNameText: 'Nombre del Registrador',
    objectRegisterSurnameText: 'Primer Apellido',
    objectRegisterLastnameText: 'Segundo Apellido',
    objectRegisterEmailText: 'Correo Electrónico',
    objectIncidentDescText: 'Descripción del Incidente',
    objectIncidentDateText: 'Fecha del Incidente'
});

Ext.define('Asgard.locales.lib.forms.yearMonthField',{
    override: 'Asgard.lib.forms.yearMonthField',
    emptyTextText: 'Elija una fecha',
    fieldLabelText: 'Mes y Año'
});

Ext.define('Asgard.locales.lib.grid.emergencyplan',{
    override: 'Asgard.lib.grid.emergencyplan',
    titleText: 'Plan de Emergencia y Actas de Simulacros',
    descText: 'Descripcion',
    dateText: 'Fecha',
    fileText: 'Documento',
    toolAddText: 'Agregar',
    toolUploadText: 'Subir Plantilla',
    toolRemoveText: 'Eliminar Entrada',
    toolChangeText: 'Cambiar Entrada',
    toolViewDocText: 'Ver Archivo',
    titleNewAuditPlan: 'Agregar nuevo Documento',
    titleEditAuditPlan: 'Editar Documento',
    loadingFileText: 'Cargando Documento... por favor espere...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No se encontro el archivo enlazado al documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});

Ext.define('Asgard.locales.lib.grid.requirements',{
    override: 'Asgard.lib.grid.requirements',
    titleText: 'Lista de Requisitos Legales',
    idText: 'Id',
    classText: 'Clase',
    typeText: 'Tipo', 
    nameText: 'Descripción',
    codeText: 'Codigo',
    datebeginText: 'Valido desde',
    dateendText: 'Valido hasta',
    fileText: 'Archivo',
    statusText: 'Estado',
    toolAddText: 'Agregar Documento',
    toolUploadText: 'Subir Plantilla',
    toolRemoveText: 'Eliminar Documento',
    toolChangeText: 'Cambiar Documento',
    toolViewDocText: 'Ver Documento',
    titleNewAuditPlan: 'Agregar nuevo Requisito',
    titleEditAuditPlan: 'Editar Requisito',
    loadingFileText: 'Cargando documento.. por favor espere...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No se encontro el archivo enlazado al documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'    
});

Ext.define('Asgard.locales.lib.grid.inspectionprogram',{
    override: 'Asgard.lib.grid.inspectionprogram',

    titleText: 'Programa de Inspección',
    idText: 'Id',
    nameText: 'Descripción',
    fileText: 'archivo',
    toolViewDocText: 'Ver Archivo',
    toolAddText: 'Agregar',
    toolRemoveText: 'Eliminar documento',
    toolChangeText: 'Modificar documento',
    
    titleNewAuditor: 'Agregar Programa de Inspección',
    titleEditAuditor: 'Editar Programa de Inspección',
    loadingFileText: 'Cargando documento.. espere por favor...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No se encontro el archivo enlazado al documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.hazardoussupplies',{
    override: 'Asgard.lib.grid.hazardoussupplies',

    titleText: 'Insumos Peligrosos',
    idText: 'Id',
    nameText: 'Insumo',
    typeText: 'Tipo',
    toolAddText: 'Agregar Insumo Peligroso',
    toolRemoveText: 'Eliminar Insumo Peligroso',
    toolChangeText: 'Cambiar Insumo Peligroso',
    
    titleNewAuditor: 'Agrega nuevo Insumo Peligroso',
    titleEditAuditor: 'Editar Insumo Peligroso',
    
    chooseTitleText: 'Advertencia',
    chooseTitleBodyDelete: 'Va eliminar un registro!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.Panels.SecurityHandbookPanel',{
    override: 'Asgard.lib.Panels.SecurityHandbookPanel',

    barAddText: 'Agregar Cartilla de Seguridad',
    barRemoveText: 'Eliminar Cartilla de Seguridad',
    warningTitle: 'advertencia',
    warningBody: 'No se puede procesar el formulario, por favor revise sus datos',
    warningTitleBodyDelete: 'You are choosing delete this member. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.ohr',{
    override: 'Asgard.lib.grid.ohr',
    titleText: 'Registro de Salud Ocupacional',
    typeText: 'Tipo',
    descText: 'Descripción',
    fileText: 'Documento',
    toolAddText: 'Agregar Registro',
    toolUploadText: 'Subir Plantilla',
    toolRemoveText: 'Eliminar Registro',
    toolChangeText: 'Cambiar Registro',
    toolViewDocText: 'Ver Archivo',
    titleNewAuditPlan: 'Agregar Nuevo Registro',
    titleEditAuditPlan: 'Editar Registro',
    loadingFileText: 'Cargando documento.. espere por favor...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No se encontro el archivo enlazado al documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.simulationsalbums',{
    override: 'Asgard.lib.grid.simulationsalbums',

    titleText: 'Simulacros',
    idText: 'Id',
    nameText: 'Descripcion',
    dateText: 'Fecha',    
    toolAddText: 'Agregar Simulacro',
    toolRemoveText: 'Eliminar Simulacro',
    toolChangeText: 'Cambiar Simulacro',
    uploadToolText: 'Mass Upload',
    titleNewAuditor: 'Agregar nuevo Simulacro',
    titleEditAuditor: 'Editar Simulacro',
    
    chooseTitleText: 'Advertencia',
    chooseTitleBodyDelete: 'Va eliminar un album incluidas las fotos!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?' 
});

Ext.define('Asgard.locales.lib.Panels.drillsPhotosPanel',{
    override: 'Asgard.lib.Panels.drillsPhotosPanel',

    barAddText: 'Agregar Imágenes',
    barRemoveText: 'Eliminar Imágen(es)',
    
    warningTitle: 'Advertencia',
    warningBody: 'No se pudieron procesar las imágenes, por favor revise los archivos',
    warningTitleBodyDelete: 'Esta seguro que quiere eliminar esta(s) imágen(es). <br />Desea seguir con esta acción?',
    emptyTitleText: 'Simulacro no seleccionado',
    emptyMessageText: 'No se ha seleccionado un simulacro, <br />Por favor seleccione uno para agregarle fotos...',

});