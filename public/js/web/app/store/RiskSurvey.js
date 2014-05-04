/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.RiskSurvey', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.RiskSurvey',
    proxy: {
        type: 'ajax',
        url: 'ims/getrisksurvey',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});