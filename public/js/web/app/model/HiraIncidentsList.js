/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraIncidentsList', {
    extend: 'Ext.data.Model',
    fields: [
	'in_idIncidente',
	'in_idTipoIncidente',
	'in_valor',
	'dt_FechaIncidente',
	'in_idPais',
	'in_idUbicacion',
	'in_idArea',
	'vc_UsuarioCreacion',
	'dt_FechaCreacion',
	'vc_UsuarioModificacion',
	'dt_FechaModificacion',
	'in_Estado'
    ]
});
