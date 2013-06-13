Ext.define('Asgard.view.content.ViewerFunctions',{
  extend: 'Ext.Container',
  alias: 'widget.Viewer-functions',
  
  initComponent: function(){
      this.dockedItems = {
	xtype: 'toolbar',
	dock: 'top',
	ui: 'header',
	items: ['->', {
	  text: 'Save',
	}]
      };
      
      this.callParent(arguments);
  }
});