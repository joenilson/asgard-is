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
    companyNameText: 'Empresa',
    presentationContentReviewText: 'Revisado',
    presentationContentApprovedText: 'Aprobado',
    defaultModuleText: 'Modulo',
});