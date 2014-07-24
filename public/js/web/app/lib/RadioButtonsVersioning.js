/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.RadioButtonsVersioning',{
    extend: 'Ext.form.RadioGroup',
    alias: 'widget.rb-versioning',
    labelWidth: 120,
    fieldLabelText: 'Versioning Type',
    columns: 3,
    changeField: undefined,
    modificationField: undefined,
    correctionField: undefined,
    
    changeFieldText: 'Major Change',
    modificationFieldText: 'Minor Modification',
    correctionFieldText: 'Corrections',
    
    initComponent: function(){
        this.fieldLabel = this.fieldLabelText;
        this.changeField = this.changeField || []; 
        this.changeField = Ext.Object.merge({
            boxLabel: this.changeFieldText,
            name: 'type_versioning',
            inputValue: 'change'
        }, this.changeField);

        this.modificationField = this.modificationField || []; 
        this.modificationField = Ext.Object.merge({
            boxLabel: this.modificationFieldText,
            name: 'type_versioning',
            inputValue: 'modification'
        }, this.modificationField);

        this.correctionField = this.correctionField || []; 
        this.correctionField = Ext.Object.merge({
            boxLabel: this.correctionFieldText,
            name: 'type_versioning',
            inputValue: 'correction',
            checked: true
        }, this.correctionField);

        this.items = this.items || [];
        this.items = this.items.concat([this.changeField, this.modificationField, this.correctionField ]);
        this.callParent(arguments);
    }
});