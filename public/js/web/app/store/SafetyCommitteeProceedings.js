/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SafetyCommitteeProceedings', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SafetyCommitteeProceedings',
    proxy: {
        type: 'ajax',
        url: 'ims/getcommitteeproceedings',
        reader: {
            type: 'json',
            root: 'results'
        }
    }
});