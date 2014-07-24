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
Ext.define('Asgard.lib.grid.hira',{
   extend: 'Asgard.lib.GridPanel',
   autoShow: true,
    autoDestroy: true,
    border: false,
    frame: false,
    flex: 1,
    //layout: 'fit',
    
    titleText: 'HIRA List',
    idText: 'Id',
    dangerText: 'Danger',
    riskText: 'Risk',
    evaluationHiraText: 'HIRA Evaluation',
    evaluationHiraHText: 'H',
    evaluationHiraMText: 'M',
    evaluationHiraLText: 'L',
    controlMeasuresText: 'Measures to be implemented',
    residualRiskText: 'Residual Risk Assessment',
    residualRiskHText: 'H',
    residualRiskMText: 'M',
    residualRiskLText: 'L',
    
    initComponent: function(){
        this.title = this.titleText,
        this.autoScroll = true,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.idText, sortable: false, hidden: true, dataIndex: 'id_danger_risk', filter: false},
                {text: this.dangerText, flex: 1.5, sortable: true, filter: 'combo', dataIndex: 'desc_danger', tdCls: 'wrapText'},
                {text: this.riskText, flex: 1.5, sortable: true, filter: true, dataIndex: 'desc_risk', tdCls: 'wrapText'},
                {text: this.evaluationHiraText,
                    columns: [{
                        text     : this.evaluationHiraHText,
                        width    : 50,
                        sortable : true,
                        filter: true,
                        align: 'center',
                        dataIndex: 'eval_iper_h',
                        renderer : this.riskleveler,
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }, {
                        text     : this.evaluationHiraMText,
                        width    : 50,
                        sortable : true,
                        filter: true,
                        align: 'center',
                        renderer :  this.riskleveler,
                        dataIndex: 'eval_iper_m',
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }, {
                        text     : this.evaluationHiraLText,
                        width    : 50,
                        sortable : true, 
                        filter: true,
                        align: 'center',
                        renderer : this.riskleveler,
                        dataIndex: 'eval_iper_l',
                        editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                            hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                        }
                    }]
                },
            {text: this.controlMeasuresText, flex:3, sortable: true, filter: true, dataIndex: 'control_measures', 
                editor: {
                    xtype: 'textareafield', allowBlank: false
                },
                tdCls: 'wrapText'
            },
            {text: this.residualRiskText,
                columns: [{
                    text     : this.residualRiskHText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    dataIndex: 'eval_risk_h',
                    renderer : this.iskleveler,
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }, {
                    text     : this.residualRiskMText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    renderer : this.riskleveler,
                    dataIndex: 'eval_risk_m',
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }, {
                    text     : this.residualRiskLText,
                    width    : 50,
                    sortable : true, 
                    filter: true,
                    align: 'center',
                    renderer : this.riskleveler,
                    dataIndex: 'eval_risk_l',
                    editor : { xtype: 'numberfield', allowBlank: false, minValue: 0, maxValue: 25,
                        hideTrigger: true, keyNavEnabled: false, mouseWheelEnabled: false
                    }
                }]
            }]
        };
        
        this.callParent();
    },
    /**
    * Custom function used for column renderer
    * @param {Object} val
    */
    riskleveler: function(val, meta) {
        if (val < 9 && val > 0) {
            meta.tdCls = 'red-column';
        } else if (val < 16 && val > 8) {
            meta.tdCls = 'yellow-column';
        } else if (val > 15) {
            meta.tdCls = 'green-column';
        }
        return val;
    }
});