Ext.define('Asgard.lib.MenuTree',{
  extend: 'Ext.tree.Panel',
  alias : 'widget.menubar-tree',
  frame:false,
  border: false,
  title: false,
  split :true,
  animate:true,
  autoHeight: true,
  autoScroll:true,
  displayField: 'text',
  lines: false,
  plain:false,
  fit: true,
  margins: '0 0 0 0',
  rootVisible : false,
  containerScroll: false,
  collapsible: false,
  dropConfig: {appendOnly:true},
  initComponent: function(){
    this.callParent(arguments);
  }
});