Ext.define('Asgard.controller.AppTabs', {
    extend: 'Ext.app.Controller',
    views: ['Content'],
    //stores: ['Menus'],

    //views: ['article.Grid'],
    /*
    refs: [{
        ref: 'articleTab',
        xtype: 'articlepreview',
        closable: true,
        forceCreate: true,
        selector: 'articlepreview'
    }],
    */
    init: function() {
        this.control({
            firebutton: {
                click: this.fireButtonClickHandler
            }
        });
	
    },
    
    fireButtonClickHandler: function(btn) {
    
        console.log('button clicked');
    
    //var toolbar = btn.up('toolbar');
    //toolbar.add({xtype: 'waterbutton'});
    }
    /*
    selectItem: function(view) {
        var first = this.getArticlesStore().getAt(0);
        if (first) {
            view.getSelectionModel().select(first);
        }
    },
    */
    /**
     * Loads the given article into a new tab
     * @param {Asgard.model.AppTab} article The article to load into a new tab
     */
    
});


