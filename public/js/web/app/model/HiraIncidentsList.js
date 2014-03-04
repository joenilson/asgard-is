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
        { name: 'date_incident', type: 'date', dateFormat: 'Y-m-d'},
        { name: 'summaryIncidents', type: 'float' }
    ]
});
