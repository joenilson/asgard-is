Ext.define('Asgard.controller.AppTabs', {
    extend: 'Ext.app.Controller',

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
	/*
        this.control({
            'articleTab': {
                refresh: this.selectItem
            }
        });
	*/
    },
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
    loadArticle: function(view, article) {
        var viewer = this.getViewer(),
            title = article.get('title'),
            articleId = article.id;

        tab = viewer.down('[articleId=' + articleId + ']');
        if (!tab) {
            tab = this.getArticleTab();
            tab.down('button[action=viewintab]').destroy();
        }

        tab.setTitle(title);
        tab.article = article;
        tab.articleId = articleId;
        tab.update(article.data);

        viewer.add(tab);
        viewer.setActiveTab(tab);

        return tab;
    }
});


