/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.view.window.systemInformation', {
    extend: 'Ext.window.Window',
    xtype: 'basic-window',
    height: 300,
    width: 400,
    titleText: 'System Information',
    autoScroll: true,
    autoShow: true,
    autoDestroy: true,
    closable: false,
    bodyPadding: 10,
    companyNameField: undefined,
    presentationContentReviewField: undefined,
    presentationContentApprovedField: undefined,
    defaultModuleField: undefined,
    
    companyNameText: 'Company',
    presentationContentReviewText: 'Review',
    presentationContentApprovedText: 'Approved',
    defaultModuleText: 'Module',
    
    defaults: {
        labelWidth: 80,
    },
    initComponent: function(){
       
        this.title = this.titleText;
 
        this.companyNameField = this.companyNameField || {};
	this.companyNameField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'companyNameField',
            fieldLabel: this.companyNameText,
        }, this.companyNameField);
        
        this.defaultModuleField = this.defaultModuleField || {};
	this.defaultModuleField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'defaultModuleField',
            fieldLabel: this.defaultModuleText,
        }, this.defaultModuleField);
        
        this.presentationContentReviewField = this.presentationContentReviewField || {};
	this.presentationContentReviewField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'presentationContentReviewField',
            fieldLabel: this.presentationContentReviewText,
        }, this.presentationContentReviewField);
        
        this.presentationContentApprovedField = this.presentationContentApprovedField || {};
	this.presentationContentApprovedField = Ext.Object.merge({
            xtype: 'displayfield',
            name: 'presentationContentApprovedField',
            fieldLabel: this.presentationContentApprovedText,
        }, this.presentationContentApprovedField);
                
        this.items = this.items || [];
        this.items = this.items.concat([ 
            this.companyNameField, 
            this.defaultModuleField, 
            this.presentationContentReviewField, 
            this.presentationContentApprovedField 
        ]);
        
        this.callParent(arguments);
    }
});