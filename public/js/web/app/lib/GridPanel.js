/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.lib.GridPanel',{
  extend: 'Ext.grid.Panel',
  alias: 'widget.asgardgrid',
  layout: 'fit',
  border: false,
  frame: false,
  columnLines: true,
  //bodyPadding: 0,
  emptyText: 'No content added yet.',
  viewConfig: {
        stripeRows: true
  },
    plugins: [{
        ptype: 'filterbar',
        renderHidden: false,
        showShowHideButton: false,
        showClearAllButton: false
    /*
    Ext.create('Ext.ux.grid.xFilterRow',{
        remoteFilter:false
    })
    */

    }
    ],
  
  initComponent: function(){
    this.callParent(arguments);
  }
});