/* 
 * Copyright (C) 2014 Joe Nilson <joenilson@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 * @class threadDetails
 * @extends Ext.panel.Panel
 *
 * Shows a list of available feeds. Also has the ability to add/remove and load feeds.
 *
 * @constructor
 * Create a new Feed Panel
 * @param {Object} config The config object
 */

Ext.define('Asgard.lib.Panels.threadDetails', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.threadsdetails',
    titleText: 'Details',
    bodyPadding: 5,
    layout: {
        type: 'vbox',
        pack: 'start',
        align: 'stretch'
    },
    defaults: {
        frame: false,
        padding: 2,
        autoScroll: true
    },
    missionTitle: 'Mission',
    editTooltip: 'Edit Information',
    missionValue: '',
    threadOwnerTitle: 'thread Owner',
    threadOwnerValue: '',
    scopeTitle: 'Scope',
    scopeValue: '',
    inputTitle: 'Inputs',
    outputTitle: 'Outputs',
    
    questionCancelTitle: 'Cancel Treatment',
    questionCancelText: 'Do you want to cancel the edition?',
    questionSaveTitle: 'Save Changes',
    questionSaveText: 'Do you want to save the changes?',
    
    initComponent: function () {
        var me = this;
        this.title = this.titleText;

        this.items = [{
                title: this.missionTitle,
                flex: 1,
                minHeight: 135,
                margin: '0 0 0 0',
                tools: [{
                        type: 'gear',
                        tooltip: 'Edit Information',
                        handler: this.fnChangeInformation
                    }],
                items: [{
                        width: '100%',
                        itemId: 'textmission',
                        xtype: 'displayfield',
                        value: this.missionValue
                    }]
            }, {
                title: this.threadOwnerTitle,
                flex: 1,
                margin: '0 0 5 0',
                html: this.threadOwnerValue
            }, {
                title: this.scopeTitle,
                flex: 2,
                html: this.scopeValue
            }, {
                layout: {
                    type: 'hbox',
                    pack: 'start',
                    align: 'stretch'
                },
                items: [{
                        title: this.inputTitle,
                        flex: 1,
                        margin: '0 5 0 0',
                        html: 'Entradas'
                    }, {
                        title: this.outputTitle,
                        flex: 1,
                        html: 'Salidas'
                    }]
            }];

        this.callParent();
    },
    
    fnChangeInformation: function (obj, id, component, tool, event, record) {
        var item = component.up('panel').items.getAt(0);
        var itemValue = Ext.String.htmlDecode(item.value);
        //console.log(item.value);
        Ext.suspendLayouts();
        component.up('panel').removeAll();
        var editorField = [{
                width: '99%',
                height: 45,
                margin: '5 5 5 5',
                xtype: 'textareafield',
                value: itemValue
            }, {
                bbar: ['->', {
                        xtype: 'button',
                        text: 'Cancel',
                        scope: this,
                        handler: function (btn) {
                            Ext.Msg.confirm(this.questionCancelTitle, this.questionCancelText, function (button) {
                                if (button === 'yes') {
                                    Ext.suspendLayouts();
                                    component.up('panel').removeAll();
                                    var displayField = [{
                                            width: '99%',
                                            height: 45,
                                            margin: '5 5 5 5',
                                            xtype: 'displayfield',
                                            value: itemValue
                                        }];
                                    component.up('panel').add(displayField);
                                    Ext.resumeLayouts(true);
                                }
                            }, this);
                        }
                    }, {
                        xtype: 'button',
                        text: 'Save',
                        scope: this,
                        handler: function (btn) {
                            Ext.Msg.confirm(this.questionSaveTitle, this.questionSaveText, function (button) {
                                if (button === 'yes') {
                                    var innerItem = btn.up('panel').up('panel').getComponent(0);
                                    Ext.Ajax.request({
                                        url: 'ims/threadinfoedit',
                                        params: {
                                            process: this.processId, 
                                            thread: this.threadId,
                                            field: 'mission',
                                            lang: this.langData,
                                            value: innerItem.value
                                        },
                                        success: function(response){
                                            var status = Ext.decode(response.responseText);
                                            if(status.success){
                                                Ext.suspendLayouts();
                                                component.up('panel').removeAll();
                                                var displayField = [{
                                                    width: '100%',
                                                    xtype: 'displayfield',
                                                    value: innerItem.value
                                                }];
                                                component.up('panel').add(displayField);
                                                Ext.resumeLayouts(true);
                                            }else{
                                                Ext.Msg.alert('Alerta', 'No se grabaron los datos!');
                                            }
                                        }
                                    },this);
                                }
                            }, this);
                        }
                    }]
            }];
        component.up('panel').add(editorField);
        Ext.resumeLayouts(true);
    },
    /**
     * Create the DataView to be used for the feed list.
     * @private
     * @return {Ext.view.View}
     */
    createView: function () {
        this.view = Ext.create('widget.dataview', {
            autoScroll: true,
            selModel: {
                mode: 'SINGLE',
                listeners: {
                    scope: this,
                    selectionchange: this.onSelectionChange
                }
            },
            listeners: {
                scope: this,
                contextmenu: this.onContextMenu,
                viewready: this.onViewReady
            },
            trackOver: true,
            cls: 'feed-list',
            itemSelector: '.thread-list-item',
            overItemCls: 'thread-list-item-hover',
            tpl: '<tpl for="."><div class="thread-list-item">{value}</div></tpl>'
        });
        return this.view;
    },
    onViewReady: function () {
        this.view.getSelectionModel().select(this.view.store.first());
    },
    /**
     * React to the load feed menu click.
     * @private
     */
    onLoadClick: function () {
        this.loadThread(this.menu.activeThread);
    },
    /**
     * Loads a feed.
     * @private
     * @param {Ext.data.Model} rec The feed
     */
    loadThread: function (rec) {
        if (rec) {
            this.fireEvent('feedselect', this, rec.get('title'), rec.get('url'));
        }
    },
    /**
     * Gets the currently selected record in the view.
     * @private
     * @return {Ext.data.Model} Returns the selected model. false if nothing is selected.
     */
    getSelectedItem: function () {
        return this.view.getSelectionModel().getSelection()[0] || false;
    },
    /**
     * Listens for the context menu event on the view
     * @private
     */
    onContextMenu: function (view, index, el, event) {
        var menu = this.menu;

        event.stopEvent();
        menu.activeThread = view.store.getAt(index);
        menu.showAt(event.getXY());
    },
    /**
     * React to a feed attempting to be added
     * @private
     */
    onAddFeedClick: function () {
        var win = this.addFeedWindow || (this.addFeedWindow = Ext.create('widget.feedwindow', {
            listeners: {
                scope: this,
                feedvalid: this.onFeedValid
            }
        }));
        win.form.getForm().reset();
        win.show();
    },
    /**
     * React to a validation on a feed passing
     * @private
     * @param {FeedViewer.FeedWindow} win
     * @param {String} title The title of the feed
     * @param {String} url The url of the feed
     */
    onFeedValid: function (win, title, url) {
        var view = this.view,
                store = view.store,
                rec;

        rec = store.add({
            url: url,
            title: title
        })[0];
        this.animateNode(view.getNode(rec), 0, 1);
    },
    /**
     * Animate a node in the view when it is added/removed
     * @private
     * @param {Mixed} el The element to animate
     * @param {Number} start The start opacity
     * @param {Number} end The end opacity
     * @param {Object} listeners (optional) Any listeners
     */
    animateNode: function (el, start, end, listeners) {
        Ext.create('Ext.fx.Anim', {
            target: Ext.get(el),
            duration: 500,
            from: {
                opacity: start
            },
            to: {
                opacity: end
            },
            listeners: listeners
        });
    },
    // Inherit docs
    onDestroy: function () {
        this.callParent(arguments);
        this.menu.destroy();
    }
});
