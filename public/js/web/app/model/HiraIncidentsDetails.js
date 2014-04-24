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
        { name: 'id_incident', type: 'float' }, 
        { name: 'nonconformity_type', type: 'float' }, 
        { name: 'nonconformity_type_desc', type: 'string' }, 
        { name: 'status', type: 'float' }, 
        { name: 'val_incident', type: 'string' }, 
        { name: 'id_type', type: 'string' }, 
        { name: 'country', type: 'string' }, 
        { name: 'company', type: 'string' }, 
        { name: 'location', type: 'string' }, 
        { name: 'description', type: 'string' }, 
        { name: 'owner_fullname', type: 'string' }, 
        { name: 'owner_email', type: 'string' }, 
        { name: 'user_id', type: 'float' }, 
        { name: 'user_create', type: 'string' }, 
        { name: 'date_incident', type: 'date', dateFormat: 'c' }, 
        { name: 'date_creation', type: 'date', dateFormat: 'c' }, 
        { name: 'general_status', type: 'float' }, 
        { name: 'incident_process', type: 'float' }, 
        { name: 'incident_process_desc', type: 'float' }, 
        { name: 'incident_thread', type: 'float' }, 
        { name: 'incident_thread_desc', type: 'string' }, 
        { name: 'incident_owner', type: 'float' }, 
        { name: 'incident_owner_desc', type: 'string' }
    ]
});
