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
Ext.define('Asgard.model.DocsUpload', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'doc_id', type: 'float' }, 
        {name: 'lang', type: 'string' }, 
        {name: 'classification', type: 'float' }, 
        {name: 'classification_desc', type: 'string' },
        {name: 'description', type: 'string' }, 
        {name: 'filename', type: 'string' }, 
        {name: 'type', type: 'float' }, 
        {name: 'type_desc', type: 'string' },
        {name: 'review', type: 'float' }, 
        {name: 'review_desc', type: 'string' }, 
        {name: 'protection', type: 'float' }, 
        {name: 'protection_desc', type: 'string' },
        {name: 'owner', type: 'float' }, 
        {name: 'owner_desc', type: 'string'},
        {name: 'process', type: 'float' }, 
        {name: 'process_desc', type: 'string'},
        {name: 'thread', type: 'float' }, 
        {name: 'thread_desc', type: 'string'},
        {name: 'location_doc', type: 'float' }, 
        {name: 'location_desc', type: 'string' }, 
        {name: 'origin', type: 'float' },
        {name: 'origin_desc', type: 'string' }, 
        {name: 'retention', type: 'float' }, 
        {name: 'retention_desc', type: 'string' }, 
        {name: 'doc_record', type: 'string' },
        {name: 'version_number', type: 'float' }, 
        {name: 'version_label', type: 'string' },
        {name: 'date_creation', type: 'date', dateFormat: 'Y-m-d H:i:s' }, 
        {name: 'user_creation', type: 'float' }, 
        {name: 'version_date', type: 'date', dateFormat: 'Y-m-d' }, 
        {name: 'revision_date', type: 'date', dateFormat: 'Y-m-d' }, 
        {name: 'doc_status_general', type: 'string' }, 
        {name: 'country', type: 'string' }, 
        {name: 'company', type: 'string' }, 
        {name: 'location', type: 'string' }
    ]
});
