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
Ext.define('Asgard.model.SimulationsBrigade', {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'company', type: 'string' }, 
        {name: 'country', type: 'string' }, 
        {name: 'location', type: 'string' }, 
        {name: 'id', type: 'float' }, 
        {name: 'fullname', type: 'string' }, 
        {name: 'id_position', type: 'float' }, 
        {name: 'description', type: 'string' }, 
        {name: 'email', type: 'string' }, 
        {name: 'phone', type: 'float' }, 
        {name: 'status', type: 'string' },
        {name: 'photo', type: 'string' }, 
        {name: 'thumbnail', type: 'string' }, 
        {name: 'user_id', type: 'float' },
        {name: 'date_creation', type: 'date', format: 'c' },
        {name: 'user_modification', type: 'float' },
        {name: 'date_modification', type: 'date', format: 'c' }
    ]
});
