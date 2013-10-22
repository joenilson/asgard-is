/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraIncidentsDetails', {
    extend: 'Ext.data.Model',
    fields: [
        'in_IdIdentificacionNC',
        'in_IdTipoNC', 
        'in_IdEstadoNC',
        'vc_TipoIncidente',
        'in_IdTipoIncidente', 
        'in_IdPais',
        'in_IdUbicacion',
        'vc_Descripcion',
        'vc_fullName', 
        'vc_Email', 
        'vc_UsuarioCreacion', 
        'dt_FechaCreacion', 
        'in_Estado'
    ]
});
