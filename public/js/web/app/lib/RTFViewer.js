 Ext.define('Asgard.lib.RTFViewer',{
  extend: 'Ext.form.field.TextArea',
  alias: 'widget.rtfviewer',
  readOnly: true,
  initComponent: function(){
    this.callParent(arguments);
  }
});