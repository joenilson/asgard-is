/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.HiraDocuments', {
    extend: 'Ext.data.Model',
    fields: ['id',
        'type_process',
        'process',
        'subprocess',
        'danger_desc',
        'danger_risk', 
        'iper_eval_h', 
        'iper_eval_m', 
        'iper_eval_l',
        'measures',
        'residual_risk_h',
        'residual_risk_m',
        'residual_risk_l'],

});