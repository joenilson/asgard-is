Ext.define('Asgard.model.Companies', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'legal_name',
        'comercial_name',
        'fiscal_id',
        'legal_address',
        'comercial_address',
        'phone_number',
        'country',
        'domain_name',
        'primary_lang',
        'status',
        'is_cluster',
        'is_header',
        'cluster_id'
    ]
});