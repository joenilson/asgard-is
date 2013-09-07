Ext.define('Asgard.locales.view.headerbar', {
  override: 'Asgard.view.Header',
  appHeaderInfoText: 'Accueil: ',
  appHeaderTitleText: "Système d'Information Asgard",
  appHeaderLogoutText: 'Quitter la Session'
});
Ext.define('Asgard.locales.view.menubar', {
  override: 'Asgard.view.Viewport',
  menuTitleText: 'Menu Principal'
});

Ext.define('Ext.locales.ux.form.field.OperatorButton',{
    override: 'Ext.ux.form.field.OperatorButton',
    operatorSetText: {
        eq: 'Est égal à',
        ne: 'N\'est pas égal à',
        gte: 'Grande ou égale',
        lte: 'Inférieur ou égal',
        gt: 'Grande de',
        lt: 'Moins que'
    } 
});