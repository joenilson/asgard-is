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
        'id_incident',
        'nonconformity_type', 
        'status',
        'val_incident',
        'id_type', 
        'country',
        'company',
        'location',
        'description',
        'owner_fullname', 
        'owner_email', 
        'user_create', 
        'date_incident', 
        'date_creation', 
        'general_status'
    ]
});
