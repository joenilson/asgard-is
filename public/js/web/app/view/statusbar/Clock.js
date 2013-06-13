Ext.define('Asgard.view.statusbar.Clock', {
  extend: 'Ext.toolbar.TextItem',
  alias: 'widget.clock', 
  text: Ext.Date.format(new Date(), 'g:i:s A'),
  initComponent: function(){
    this.callParent(arguments);
    this.on('render', function(){
	Ext.TaskManager.start({
	  scope: this,
	  run: function(){
	      Ext.fly(this.getEl()).update(Ext.Date.format(new Date(), 'g:i:s A'));
	  },
	  interval: 1000
	});
    });
  }
});
