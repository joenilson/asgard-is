/* 
 * Copyright (C) 2013 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.model.DocsLibrary', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'doc_id', type: 'float' }, 
        {name: 'lang', type: 'string' }, 
        {name: 'doc_classification', type: 'float' }, 
        {name: 'desc_classification', type: 'string' },
        {name: 'doc_desc', type: 'string' }, 
        {name: 'doc_file', type: 'string' }, 
        {name: 'doc_type', type: 'float' }, 
        {name: 'desc_type', type: 'string' },
        {name: 'doc_review', type: 'float' }, 
        {name: 'desc_review', type: 'string' }, 
        {name: 'doc_protection', type: 'float' }, 
        {name: 'desc_protection', type: 'string' },
        {name: 'doc_owner', type: 'float' }, 
        {name: 'desc_owner', type: 'string' }, 
        {name: 'desc_thread', type: 'string' }, 
        {name: 'doc_location', type: 'float' }, 
        {name: 'desc_location', type: 'string' }, 
        {name: 'doc_origin', type: 'float' },
        {name: 'desc_origin', type: 'string' }, 
        {name: 'doc_retention', type: 'float' }, 
        {name: 'desc_retention', type: 'string' }, 
        {name: 'doc_record', type: 'string' },
        {name: 'doc_version_number', type: 'float' }, 
        {name: 'doc_version_label', type: 'string' },
        {name: 'doc_date_creation', type: 'date', dateFormat: 'Y-m-d H:i:s' }, 
        {name: 'doc_user_creation', type: 'float' }, 
        {name: 'doc_date_modification', type: 'date', dateFormat: 'Y-m-d H:i:s' },
        {name: 'doc_user_modification', type: 'float' }, 
        {name: 'doc_date_revision_req', type: 'date', dateFormat: 'Y-m-d H:i:s' }, 
        {name: 'doc_user_revision_req', type: 'float' },
        {name: 'doc_date_revision_actual', type: 'date', dateFormat: 'Y-m-d H:i:s' }, 
        {name: 'doc_date_revision_next', type: 'date', dateFormat: 'Y-m-d H:i:s' }, 
        {name: 'doc_status_general', type: 'string' }, 
        {name: 'doc_status_revision', type: 'string' }, 
        {name: 'doc_reference', type: 'float' }, 
        {name: 'country', type: 'string' }, 
        {name: 'company', type: 'string' }, 
        {name: 'location', type: 'string' },
        {name: 'doc_final_dispose', type: 'float' },
        {name: 'doc_minimal_time', type: 'float' },
        {name: 'doc_source', type: 'string' },
        {name: 'reg_location', type: 'string' },
        {name: 'desc_regretention', type: 'string' },
        {name: 'desc_dispose', type: 'string' },
        {name: 'reg_reference', type: 'string' }
        
    ]
});
