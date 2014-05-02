/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.IEEA', {
    extend: 'Ext.data.Model',
    fields: [
        { name: 'company', type: 'string' },
        { name: 'country', type: 'string' },
        { name: 'location', type: 'string' },
        { name: 'id', type: 'float' },
        { name: 'id_type', type: 'float' },
        { name: 'id_cycle', type: 'float' },
        { name: 'id_process', type: 'float' },
        { name: 'id_thread', type: 'float' },
        { name: 'id_ea', type: 'float' },
        { name: 'id_ei', type: 'float' },
        { name: 'quantity', type: 'float' },
        { name: 'unit_measure', type: 'string' },
        { name: 'influence', type: 'string' },
        { name: 'magnitude', type: 'float' },
        { name: 'frequency', type: 'float' },
        { name: 'e_impact', type: 'float' },
        { name: 'save', type: 'float' },
        { name: 't_normal_c', type: 'float' },
        { name: 'legal_req', type: 'float' },
        { name: 'corporative_req', type: 'float' },
        { name: 'voluntary_req', type: 'float' },
        { name: 'total_req', type: 'float' },
        { name: 'abnormal_ha_a', type: 'float' },
        { name: 'abnormal_ha_b', type: 'float' },
        { name: 'abnormal_ha_c', type: 'float' },
        { name: 'abnormal_ha_d', type: 'float' },
        { name: 'abnormal_im_e', type: 'float' },
        { name: 'abnormal_im_f', type: 'float' },
        { name: 'abnormal_su_g', type: 'float' },
        { name: 'abnormal_factor', type: 'float' },
        { name: 'abnormal_table', type: 'float' },
        { name: 'ranking', type: 'float' },
        { name: 'status', type: 'string' },
        { name: 'user_creation', type: 'int' },
        { name: 'date_creation', type: 'date', dateFormat: 'c' },
        { name: 'user_modification', type: 'int' },
        { name: 'date_modification', type: 'date', dateFormat: 'c' },
        { name: 'desc_type', type: 'string' },
        { name: 'desc_cycle', type: 'string' },
        { name: 'desc_ea', type: 'string' },
        { name: 'desc_ei', type: 'string' },
        { name: 'desc_process', type: 'string' },
        { name: 'desc_thread', type: 'string' }
    ]
});