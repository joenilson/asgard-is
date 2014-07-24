/* 
 * Copyright (C) 2013 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY', type: 'string' }, without even the implied warranty of
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
Ext.define('Asgard.model.DocsRequest', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'doc_id', type: 'float' },
        {name: 'lang', type: 'string' },
        {name: 'doc_classification', type: 'float' },
        {name: 'doc_file', type: 'string' },
        {name: 'desc_request', type: 'string' },
        {name: 'user_request', type: 'float' },
        {name: 'name_request', type: 'string' },
        {name: 'email_request', type: 'string' },
        {name: 'date_request', type: 'date', dateFormat: 'c' },
        {name: 'date_attention', type: 'date', dateFormat: 'c' },
        {name: 'status', type: 'string' },
        {name: 'user_auth', type: 'float' },
        {name: 'doc_newid', type: 'float' },
        {name: 'country', type: 'string' },
        {name: 'company', type: 'string' },
        {name: 'location', type: 'string' },
        {name: 'desc_attention', type: 'string' },
        {name: 'doc_original', type: 'string' }
    ]
});
