Ext.define('Asgard.lib.RTFPanel',{
  extend: 'Ext.form.Panel',
  alias: 'widget.rtfpanel',
  layout: 'fit',
  border: false,
  frame: false,
  //bodyPadding: 0,
  emptyText: 'No content added yet.',
  initComponent: function(){
    this.callParent(arguments);
  }
});