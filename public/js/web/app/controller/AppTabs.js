Ext.define('Asgard.controller.AppTabs', {
    extend: 'Ext.app.Controller',
    views: ['Content'],

    init: function() {
        this.control({
            'toolbar button': {
                click: this.fireButtonClickHandler 
            }
        });
    },
    
    fireButtonClickHandler: function(btn) {
        if(btn.text === 'Refresh'){
            Ext.getCmp('content-panel').getActiveTab().removeAll();
            Ext.getCmp('content-panel').getActiveTab().getLoader().load();
        }
    }
    
});


