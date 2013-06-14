Ext.define('Asgard.view.statusbar.Actualdate',{
  extend: 'Ext.toolbar.TextItem',
  alias: 'widget.actual-date', 
  text: Ext.Date.format(new Date(), 'l, \\t\\he jS \\of F Y'),
  scope: this,
  minWidth: 200,
  initComponent: function(){
    this.callParent(arguments);
    this.on('render', function(){
      Ext.TaskManager.start({
	  scope: this,
	  run: function(){
	      Ext.fly(this.getEl()).update(Ext.Date.format(new Date(), 'l, \\t\\he jS \\of F Y'));
	  },
	  interval: 60000
	});
    });
  }
});