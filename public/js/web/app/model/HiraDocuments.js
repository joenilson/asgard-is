/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraDocuments', {
    extend: 'Ext.data.Model',
    fields: ['in_idPeligroRiesgo'
      ,'in_idPeligro'
      ,'in_PeligroDesc'
      ,'in_idRiesgo'
      ,'in_RiesgoDesc'
      ,'in_TypeProcess'
      ,'in_TypeProcessDesc'
      ,'in_ProcessSup'
      ,'in_ProcessSupDesc'
      ,'in_idProc'
      ,'in_ProcesoDesc'
      ,{ name: 'in_EI_A', type: 'float' }
      ,{ name: 'in_EI_M', type: 'float' }
      ,{ name: 'in_EI_B', type: 'float' }
      ,'vc_MedidasControl'
      ,{ name: 'in_ER_A', type: 'float' }
      ,{ name: 'in_ER_M', type: 'float' }
      ,{ name: 'in_ER_B', type: 'float' }
      ,'dt_FechaCreacion'
      ,'vc_UsuarioCreacion'
      ,'dt_FechaModificacion'
      ,'vc_UsuarioModificacion'
      ,'in_Estado'
      ,'in_idUbicacion'
      ,'in_idMaquinaria']
});