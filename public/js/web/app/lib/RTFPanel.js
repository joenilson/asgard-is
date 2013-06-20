Ext.define('Asgard.lib.RTFPanel',{
  extend: 'Ext.form.Panel',
  alias: 'widget.rtfpanel',
  layout: 'fit',
  border: false,
  frame: false,
  //bodyPadding: 0,
  bodyStyle: {
    background: '#ffc',
    //padding: '10px'
  },
  emptyText: 'No content added yet.',
  initComponent: function(){
    this.callParent(arguments);
  }
});