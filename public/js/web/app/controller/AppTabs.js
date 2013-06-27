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
        if(btn.name === 'refresh'){
            Ext.getCmp('content-panel').getActiveTab().removeAll();
            Ext.getCmp('content-panel').getActiveTab().getLoader().load();
        }
        /*
        if(btn.name === 'edit'){
            var button = Ext.getCmp('content-panel').getActiveTab().getComponentLayout().getDockedItems('toolbar[dock="top"]');
            console.log(button);
        }
        */
        
    }
    
});


