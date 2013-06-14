 Ext.define('Asgard.lib.RTFViewer',{
  extend: 'Ext.form.field.TextArea',
  alias: 'widget.rtfviewer',
  readOnly: true,
  width: '100%',
  initComponent: function(){
    this.callParent(arguments);
  }
});