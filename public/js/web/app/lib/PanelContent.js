Ext.define('Asgard.lib.PanelContent',{
  extend: 'Ext.Panel',
  alias: 'widget.panel-content',
  layout: 'fit',
  plain: true,
  minHeight: 200,
  autoScroll:true,

  initComponent: function(){
    this.callParent(arguments);
  }
});