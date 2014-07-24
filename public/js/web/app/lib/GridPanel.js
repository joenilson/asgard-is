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
    loadMask: true,
    plugins: [{
        ptype: 'filterbar',
        renderHidden: false,
        showShowHideButton: false,
        showClearAllButton: false,
    },{
        ptype: 'bufferedrenderer',
        trailingBufferZone: 20,  // Keep 20 rows rendered in the table behind scroll
        leadingBufferZone: 50  
    }],
  initComponent: function(){
    this.callParent(arguments);
  }
});