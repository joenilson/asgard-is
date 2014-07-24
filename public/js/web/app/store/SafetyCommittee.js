/**
 * @application Asgard Information System :: asgard-is
 * @version 1.0.0 devel
 * @author Joe Nilson <joenilson@gmail.com>
 */
Ext.define('Asgard.store.SafetyCommittee', {
    extend: 'Ext.data.Store',
    model: 'Asgard.model.SafetyCommittee',
    proxy: {
        type: 'ajax',
        url: 'ims/getsafetycommittee',
        reader: {
            type: 'json',
            root: 'images'
        }
    }
});