/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.RadioButtonsScope',{
    extend: 'Ext.form.RadioGroup',
    alias: 'widget.rb-scope',
    labelWidth: 120,
    fieldLabelText: 'Document Scope',
    columns: 3,
    countryField: undefined,
    companyField: undefined,
    locationField: undefined,
    
    countryFieldText: 'for Country',
    companyFieldText: 'for Company',
    locationFieldText: 'for Location',
    
    initComponent: function(){
        this.fieldLabel = this.fieldLabelText;
        this.countryField = this.countryField || []; 
        this.countryField = Ext.Object.merge({
            boxLabel: this.countryFieldText,
            name: 'type_scope',
            inputValue: 'country',
            checked: true
        }, this.countryField);

        this.companyField = this.companyField || []; 
        this.companyField = Ext.Object.merge({
            boxLabel: this.companyFieldText,
            name: 'type_scope',
            inputValue: 'company'
        }, this.companyField);

        this.locationField = this.locationField || []; 
        this.locationField = Ext.Object.merge({
            boxLabel: this.locationFieldText,
            name: 'type_scope',
            inputValue: 'location'
        }, this.locationField);

        this.items = this.items || [];
        this.items = this.items.concat([this.countryField, this.companyField, this.locationField ]);
        this.callParent(arguments);
    }
});