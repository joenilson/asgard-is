Ext.define('Asgard.view.content.IframeContent',{
  extend: 'Ext.ux.IFrame',
  alias: 'widget.iframe-content',
  //hideMode : 'display',
  loadMask: 'Loading...',
   
  initComponent: function(){
    
    this.callParent(arguments);
  }
});