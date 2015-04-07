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
    refreshButtonText: 'Actualizar'
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
    classDocText: 'Tipo Documento',
    documentText: 'Documento',
    threadText: 'Subproceso',
    recordText: 'Código',
    versionText: 'Version Vigente',
    statusText: 'Estado',
    typeText: 'Estado',
    dateRevisionText: 'Fecha de Revisión',
    dateVersionText: 'Fecha de Versión',
    dateIncorporationText: 'Fecha de Incorporación',
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
    regLocationText: 'Ubicación Física o Electrónica',
    emptyFileMessage: 'No existe el archivo asociado a este documento...',
    chooseTitleBodyDelete: 'Va eliminar un documento!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    warningTitle: 'Advertencia!',
    emptyCCLText: 'Por favor complete los campos Compañia, Pais y Ubicación',
    emptyTitleText: 'No se ha seleccionado nada',
    emptyMessageText: 'No se ha seleccionado ningún documento, <br />Para continuar primero seleccione un documento...',
    /* Added 15 - May - 2014 */
    toolHistoryText: 'Ver Historial de documentos',
    historyTitle: 'Historial de Documentos',
    finalDisposeText:'Archivo Pasivo (AP) / Destrucción (D)',
    minimalTimeText: 'Tiempo mínimo de conservación adicional',
    regReferenceText: 'Documento de Referencia'
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

Ext.define('Asgard.locales.lib.forms.comboCCLP',{
    override: 'Asgard.lib.forms.comboCCLP',
    emptyTextText: 'No hay datos elegidos',
    textSubmitButton: 'Consultar'
});

Ext.define('Asgard.locales.lib.forms.comboCCLY',{
    override: 'Asgard.lib.forms.comboCCLY',
    emptyTextText: 'No hay datos elegidos',
    textSubmitButton: 'Consultar'
});

Ext.define('Asgard.locales.lib.forms.comboCCLYM',{
    override: 'Asgard.lib.forms.comboCCLYM',
    emptyTextText: 'No hay datos elegidos',
    textSubmitButton: 'Consultar'
});

Ext.define('Asgard.locales.lib.forms.comboCCLPYM',{
    override: 'Asgard.lib.forms.comboCCLPYM',
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

    documentClassText: 'Tipo Documento',
    documentTypeText: 'Estado',
    documentReviewText: 'Revisión',
    documentProtectionText: 'Protección',
    documentProcessText: 'Proceso',
    documentOwnerText: 'Responsable del Documento',
    documentLocationText: 'Ubicación',
    documentOriginText: 'Origen',
    documentRetentionText: 'Tiempo de Retención',
    documentDescText: 'Descripción del Documento',
    documentRecordText: 'Código',
    documentRegLocationText: 'Ubicación Física o Electrónica',
    documentDVText: 'Fecha Inclusión',
    documentDRText: 'Fecha Revisión',
    documentDIText: 'Fecha de Incorporación',
    documentFileText: 'Documento',
    regReferenceText: 'Documento de Referencia',
    documentFieldEmptyText: 'Escoja un documento',
    
    textSubmitButton: 'Agregar',
    textCancelButton: 'Cancelar'
});

Ext.define('Asgard.locales.lib.grid.thread_documents',{
    override: 'Asgard.lib.grid.thread_documents',

    titleText: 'Documentos Relacionados',
    idText: 'Id',
    classDocText: 'Tipo Documento',
    documentText: 'Documento',
    recordText: 'Código',
    versionText: 'Versión',
    statusText: 'Estado',
    typeText: 'Estado',
    dateRevisionText: 'Fecha de Revisión',
    dateVersionText: 'Fecha de Versión',
    reviewText: 'Revisión',
    protectionText: 'Protección',
    locationText: 'Ubicación',
    originText: 'Origen',
    retentionText: 'Tiempo de Retención',
    toolViewDocText: 'Ver Archivo',
    loadText: 'Cargando documento... por favor espere...'
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

Ext.define('Asgard.locales.lib.grid.hira_incidents',{
    override: 'Asgard.lib.grid.hira_incidents',

    titleText: 'Lista de Incidentes',
    idText: 'Id',
    nctypeText: 'No Conformidad',
    typeText: 'Tipo Incidente',
    descriptionText: 'Descripcion',
    authorText: 'Registrante',
    processText: 'Proceso',
    threadText: 'Subproceso',
    emailText: 'Email',
    dateText: 'Fecha',
    statusText: 'Estado',
    causesToolText: 'Causas del Incidente',
    closeToolText: 'Cierre del Incidente',
    validityToolText: 'Validación del Cierre',
    deleteToolText: 'Eliminar Incidente',
    addToolText: 'Agregar Incidente',
    resultTitleText: 'Correcto!',
    resultMessageText: 'incidentes procesados.',
    failureTitleText: 'Advertencia',
    failureMessageText: 'El servidor no pudo procesar los datos, <br />por favor revise el formulario.',
    buttonAcceptText: 'Guardar Archivos',
    emptyTitleText: 'No hay nada seleccionado',
    emptyMessageText: 'No se ha seleccionado un Incidente, <br />Por favor seleccione uno para procesar...',
    wrongTitleText: 'Estado Incorrecto',
    wrongMessageText: 'El estado del Incidente es incorrecto, <br />Por favor realice el tratamiento correcto...',
    chooseTitleText: 'Advertencia',
    chooseTitleBodyDelete: 'Va eliminar un Incidente!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
    titleCausesTool: 'Causas de No Conformidad',
    valTreatment1: 'Abierto',
    valTreatment2: 'Cerrado',
    valTreatment4: 'Cerrado y Validado',
    titleIncident: 'Incidente: '
});

Ext.define('Asgard.locales.lib.grid.hira_general',{
    override: 'Asgard.lib.grid.hira_general',
    titleText: 'Identificacion de Peligros y Evaluación de Riesgos :: IPER',
    idText: 'Id',
    processText: 'Proceso',
    threadText: 'Subproceso',
    activityText: 'Actividad',
    dangerText: 'Peligro',
    riskText: 'Riesgo',
    evaluationHiraText: 'Evaluación IPER',
    evaluationHiraHText: 'A',
    evaluationHiraMText: 'M',
    evaluationHiraLText: 'B',
    controlMeasuresText: 'Medidas a implementar',
    residualRiskText: 'Evaluación del Riesgo Residual',
    residualRiskHText: 'A',
    residualRiskMText: 'M',
    residualRiskLText: 'B',
    editToolText: 'Editar',
    deleteToolText: 'Eliminar',
    addToolText: 'Agregar',
    uploadToolText: 'Subir Plantilla',
    emptyTextText: 'Esta Ubicación no tiene un IPER asignado.',
    resultTitleText: 'Exito',
    resultMessageText: 'incidentes procesados.',
    failureTitleText: 'Advertencia',
    failureMessageText: 'El servidor no pudo procesar el archivo, <br />por favor revise sus datos.',
    buttonAcceptText: 'Guardar Datos',
    emptyTitleText: 'No se seleccionó nada',
    emptyMessageText: 'No se ha seleccionado un item, <br />Por favor seleccione uno para procesar...',
    chooseTitleText: 'Advertencia',
    chooseTitleBodyDelete: 'Va eliminar un item!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});

Ext.define('Asgard.locales.lib.grid.mtm',{
    override: 'Asgard.lib.grid.mtm',
    titleText: 'Monitoreo, Seguimiento y Medición',
    typeText: 'Tipo ',
    descText: 'Descripción',
    fileText: 'Documento',
    toolAddText: 'Agregar Documento',
    toolUploadText: 'Subir Plantilla',
    toolRemoveText: 'Eliminar documento',
    toolChangeText: 'Cambiar Documento',
    toolViewDocText: 'Ver Documento',
    titleNewAuditPlan: 'Agregar nuevo Documento',
    titleEditAuditPlan: 'Editar Documento',
    loadingFileText: 'Cargando Documento... espere por favor...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No document is linked to this record...',
    chooseTitleBodyDelete: 'Va eliminar un item!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?',
});

Ext.define('Asgard.locales.lib.grid.isoplan',{
    override: 'Asgard.lib.grid.isoplan',

    titleText: 'Plan de calidad, medioambiente, seguridad y salud ocupacional',
    processText: 'Proceso',
    threadText: 'Subproceso',
    ownerText: 'Propietario',
    docText: 'Documento',
    indicatorText: 'Indicador',
    varsText: 'Variables',
    recordfileText: 'Registro de Control',
    frequencyText: 'Frecuencia',
    fileText: 'Documento',
    toolAddText: 'Agregar Valores',
    toolUploadText: 'cargar Plantilla',
    toolRemoveText: 'Eliminar Entrada',
    toolChangeText: 'Cambiar Entrada',
    toolViewDocText: 'Ver documento',
    titleNewAuditPlan: 'Agregar nuevo Documento',
    titleEditAuditPlan: 'Editar Entrada',
    loadingFileText: 'Cargando Documento... por favor espere...',
    chooseTitleText: 'Advertencia',
    emptyFileMessage: 'No hay un documento asociado a esta entrada...',
    chooseTitleBodyDelete: 'Va eliminar un item!. <br />Desea seguir con esta acción?',
    chooseTitleBodyChange: 'You are choosing change this item. <br />Would you like to save your changes?'
});

Ext.define('Asgard.locales.lib.grid.IPGrid',{
    override: 'Asgard.lib.grid.IPGrid',
    idText: 'Id',
    nameText: 'Descripción',
    typeText: 'Subproceso',
    threadText: 'Subproceso',
    ioText: 'I/O'
});

Ext.define('Asgard.locales.lib.Panels.ISOPlanDetailPanel',{
    override: 'Asgard.lib.Panels.ISOPlanDetailPanel',
    ownersText: 'Propietarios',
    iperText: 'Peligros y Riesgos',
    ioText: 'Entradas (I) / Salidas (O)',
    eaText: 'Impacto Ambiental',
    recordsText: 'Registros',
    documentsText: 'Procedimientos de Control Operacional'
});

Ext.define('Asgard.locales.lib.forms.hiraMasterFileUpload',{
    override: 'Asgard.lib.forms.hiraMasterFileUpload',
    excelFileText: 'Plantilla Excel 2003 (.xls)',
    excelFieldEmptyText: 'Escoja el archivo Excel',    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Advertencia',
    warningText: 'Datos incompletos!, revise sus datos',
    required: '<span style="color:red;font-weight:bold" data-qtip="Obligatorio">*</span>',
    successText: 'Documentos enviados exitosamente!',
    failureText: 'Algo salio mal, revise el formulario e intente nuevamente',
    typeText: 'Tipo de Datos',
    additionText: 'Datos Adicionales',
    changeText: 'Datos de Reemplazo'
});

Ext.define('Asgard.locales.lib.grid.employees',{
    override: 'Asgard.lib.grid.employees',
    titleText: 'Lista de Empleados',
    idText: 'Id',
    surnameText: 'Apellido Paterno',
    lastnameText: 'Apellido Materno',
    firstnameText: 'Nombres',
    positionText: 'Cargo',
    organizationText: 'Area',
    birthdayText: 'Fecha Nacimiento',
    officeText: 'Oficina',
    loadingText: 'Buscando datos...',
    toolFormText: 'Empleado sin dependientes',
    
    maritalStatusText: 'Estado Civil',
    statusSingle: 'Soltero/a',
    statusMarried: 'Casado/a',
    statusDivorced: 'Divorciado/a',
    statusWidowed: 'Viudo/a',
    statusSeparated: 'Divorciado/a',
    
    workedText: 'Procesado?',
    
    falseText: 'Pendiente',
    trueText: 'Procesado',
    
    questionTitle: 'Sin Dependientes',
    questionText: '¿Desea marcar este empleado sin dependientes?'
});

Ext.define('Asgard.locales.lib.grid.employee_dependants',{
    override: 'Asgard.lib.grid.employee_dependants',

    titleText: 'Lista de Dependientes del Empleado',
    idText: 'Id',
    surnameText: 'Apellido Paterno',
    lastnameText: 'Apellido Materno',
    firstnameText: 'Nombres',
    birthdayText: 'Fecha Nacimiento',
    typeText: 'Parentesco',
    genderText: 'Genero',
    loadingText: 'Buscando datos...',
    
    toolRemoveText: 'Eliminar Dependiente',
    toolAddText: 'Guardar Dependiente',
    
    typeCouple: 'Conyuge',
    typeChildren: 'Hijo',
    
    genderMale: 'Hombre',
    genderFemale: 'Mujer'
});

Ext.define('Asgard.locales.lib.forms.comboOffices',{
    override: 'Asgard.lib.forms.comboOffices',
    textSubmitButton: 'Buscar'
});

Ext.define('Asgard.locales.lib.grid.employeesr',{
    override: 'Asgard.lib.grid.employeesr',
    titleText: 'Reporte de Empleados',
    idText: 'Id',
    surnameText: 'Apellido Paterno',
    lastnameText: 'Apellido Materno',
    firstnameText: 'Nombres',
    positionText: 'Cargo',
    organizationText: 'Area',
    birthdayText: 'Fecha Nacimiento',
    ageText: 'Edad Años/Meses',
    loadingText: 'Buscando datos...',
    toolFormText: 'Empleado sin dependientes',
    
    maritalStatusText: 'Con Pareja',
    childrenMaleText: 'Qdad Hijos',
    childrenFemaleText: 'Qdad Hijas',
    workedText: 'Procesado',
    yesText: 'Si',
    noText: 'No',
    
    falseText: 'Pendiente',
    trueText: 'Procesado',
    
    textTitle: 'Confirma la Descarga?',
    textMessage: 'Desea descargar el gráfico como una imágen?',
    textButtonDownload: 'Guardar Gráfico',
    textButtonDownloadData: 'Descargar Datos',
    textButtonResumeDependents: 'Resumen de Dependientes',
    textButtonCoupleRange: 'Rango de Edades Parejas',
    textButtonChildrenRange: 'Rango de Edades Hijos'

});

Ext.define('Asgard.locales.lib.dataview.policies',{
    override: 'Asgard.lib.dataview.policies',
    emptyTextText: 'No hay un documento para mostrar...'
});

Ext.define('Asgard.locales.lib.forms.policiesNewPolicy',{
    override: 'Asgard.lib.forms.policiesNewPolicy',
    descriptionText: 'Descripcion',
    fileText: 'Politica en PDF',
    fileFieldEmptyText: 'Elija un archivo PDF',    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Advertencia',
    warningText: 'Ya existe una politica!, elimine la anterior para ingresar la nueva',
    required: '<span style="color:red;font-weight:bold" data-qtip="Obligatorio">*</span>',
    successText: 'Política actualizada correctamente!',
    failureText: 'No se completo el proceso correctamente, Por favor intente de nuevo.'
});

Ext.define('Asgard.locales.lib.Panels.PoliciesPanel',{
    override: 'Asgard.lib.Panels.PoliciesPanel',
    barAddText: 'Agregar Política',
    barRemoveText: 'Eliminar Política',
    warningTitle: 'Advertencia',
    warningBody: 'No se pudo procesar su documento, por favor revise si el archivo no es incorrecto.',
    warningTitleBodyDelete: 'Ha elegido eliminar este archivo. <br />Desea continuar?'
});

Ext.define('Asgard.locales.lib.dataview.objdocument',{
    override: 'Asgard.lib.dataview.objdocument',
    emptyTextText: 'No hay un documento para mostrar...'
});

Ext.define('Asgard.locales.lib.Panels.ObjDocumentPanel',{
    override: 'Asgard.lib.Panels.ObjDocumentPanel',
    barAddText: 'Agregar Documento',
    barRemoveText: 'Eliminar Documento',
    warningTitle: 'Advertencia',
    warningBody: 'No se pudo procesar su documento, por favor revise si el archivo no es incorrecto.',
    warningTitleBodyDelete: 'Ha elegido eliminar este archivo. <br />Desea continuar?'
});

Ext.define('Asgard.locales.lib.forms.objdocumentNewObjDocument',{
    override: 'Asgard.lib.forms.objdocumentNewObjDocument',
    descriptionText: 'Descripcion',
    fileText: 'Documento en PDF',
    fileFieldEmptyText: 'Elija un archivo PDF',    
    textSubmitButton: 'Enviar',
    textCancelButton: 'Cancelar',
    warningTitle: 'Advertencia',
    warningText: 'Ya existe un documento!, elimine el anterior para ingresar el nuevo',
    required: '<span style="color:red;font-weight:bold" data-qtip="Obligatorio">*</span>',
    successText: 'Documento actualizado correctamente!',
    failureText: 'No se completo el proceso correctamente, Por favor intente de nuevo.'
});

Ext.define('Asgard.locales.lib.grid.io',{
    override: 'Asgard.lib.grid.io',
    descriptionText: 'Descripcion',
    idText: 'Id',
    toolAddText: 'Agregar',
    toolRemoveText: 'Remover',
    toolChangeText: 'Cambiar',
    titleTextInput: 'Entradas',
    titleAlert: 'Advertencia',
    msgAlert: 'Escoja un item',
    emptyText: 'No hay datos para mostrar...'
});

Ext.define('Asgard.locales.lib.grid.output',{
    override: 'Asgard.lib.grid.output',
    descriptionText: 'Descripcion',
    idText: 'Id',
    toolAddText: 'Agregar',
    toolRemoveText: 'Remover',
    toolChangeText: 'Cambiar',
    titleTextOutput: 'Salidas',
    titleAlert: 'Advertencia',
    msgAlert: 'Escoja un item',
    emptyText: 'No hay datos para mostrar...'
});