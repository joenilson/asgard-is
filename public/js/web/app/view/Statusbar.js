Ext.define('Asgard.view.Statusbar', {
  extend: 'Ext.ux.StatusBar',
  alias: 'widget.appstatusbar',
  dock: 'bottom',
  ui: 'footer',
 
  clock: undefined,
  actualDate: undefined,

  scope: this,
  
  initComponent: function() {

      this.clock = this.clock || [];
      this.clock = Ext.Object.merge({
	xtype: 'clock'
      }, this.clock);
      
      this.actualDate = this.actualDate || [];
      this.actualDate = Ext.Object.merge({
	xtype: 'actual-date'
      }, this.actualDate);
      
      this.items = this.items || [];
      this.items = this.items.concat(['-', this.actualDate, '-', this.clock, '-' ]);

      this.callParent(arguments);

  },

});
