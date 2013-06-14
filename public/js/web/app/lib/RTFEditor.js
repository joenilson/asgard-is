Ext.define('Asgard.lib.RTFEditor',{
  extend: 'Ext.ux.form.TinyMCETextArea',
  alias: 'widget.rtfeditor',
  theme_advanced_row_height: 27,
  delta_height: 1,
  flex: 1,
  autoWidth: true,
  initComponent: function(){
    this.callParent(arguments);
  }
});
