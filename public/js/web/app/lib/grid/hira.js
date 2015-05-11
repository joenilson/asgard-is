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
    activityText: 'Activity',
    hiraIdentificationRiskFactors: 'Identification of risk factors',
    dangerCodeText: 'Code',
    dangerText: 'Danger',
    riskText: 'Risk',
    consequenceText: 'Consequence',
    hiraEvaluationDescription: 'Risk Assessment',
    freqencyText: 'Frequency (A)',
    severityText: 'Severity (B)',
    riskAssessmentText: 'Eval. (AxB)',
    classificationText: 'Classification',
    controlsText: 'Operational Controls',
    tracingText: 'Tracing',
    measurementText: 'Measurement',
    
    greenVal: 'Low',
    blueVal: 'Moderate',
    yellowVal: 'Important',
    redVal: 'Critical',
    
    initComponent: function(){
        this.title = this.titleText,
        this.autoScroll = true,
        this.columns =  {
            plugins: [{
                ptype: 'gridautoresizer'
            }],
            items: [
                {text: this.activityText, width: 160,  sortable: false, hidden: false, dataIndex: 'activity', filter: true, tdCls: 'wrapText'},
                {
                    text: this.hiraIdentificationRiskFactors,
                    columns: [
                        {text: this.dangerCodeText, width: 60,  sortable: true, filter: 'combo', dataIndex: 'danger_code' },
                        {text: this.dangerText, width: 120,  sortable: true, filter: true, dataIndex: 'description_danger', tdCls: 'wrapText'},
                        {text: this.riskText, width: 120,  sortable: true, filter: true, dataIndex: 'description_risk', tdCls: 'wrapText'},
                        {text: this.consequenceText, width: 160, sortable: true, filter: true, dataIndex: 'description_consequence', tdCls: 'wrapText'}                       
                    ]
                },
                {
                    text: this.hiraEvaluationDescription,
                    columns: [
                        { text: this.freqencyText, width: 60, sortable: true, filter: true, dataIndex: 'danger_frequency' },
                        { text: this.severityText, width: 60, sortable: true, filter: true, dataIndex: 'danger_severity' },
                        { text: this.riskAssessmentText, width: 60, sortable: true, filter: true, dataIndex: 'danger_fxs' },
                        { text: this.classificationText, width: 80, sortable: true, filter: true, dataIndex: 'classification', renderer: this.riskLeveler }
                    ]
                },
                { text: this.controlsText, flex:1, sortable: true, filter: true, dataIndex: 'control_measures', tdCls: 'wrapText' },
                { text: this.tracingText, flex:1, sortable: true, filter: true, dataIndex: 'tracing', tdCls: 'wrapText' },
                { text: this.measurementText, flex:1, sortable: true, filter: true, dataIndex: 'measurement', tdCls: 'wrapText' }
            ]
        };
        
        this.callParent();
    },
    /**
    * Custom function used for column renderer
    * @param {Object} val
    */
    riskLeveler: function(val, meta) {
        switch(val){
            case 'low':
                meta.tdCls = 'green-column';
                val = this.greenVal;
                break;
            case 'moderate':
                meta.tdCls = 'blue-column';
                val = this.blueVal;
                break;
            case 'important':
                meta.tdCls = 'yellow-column';
                val = this.yellowVal;
                break;
            case 'critical':
                meta.tdCls = 'red-column';
                val = this.redVal;
                break;
        }
        return val;
    }
});