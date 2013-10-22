/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.hiraIncidentsDetails',{
  extend: 'Ext.window.Window',
  alias: 'widget.hira-incidentsDetails',
  layout: 'fit',
  plain: false,
  minHeight: 200,
  border : false,
  autoScroll: true,
  modal: true,
  initComponent: function(){
    this.callParent(arguments);
  }
});