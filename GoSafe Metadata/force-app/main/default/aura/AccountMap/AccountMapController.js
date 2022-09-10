({
    init: function (cmp, event, helper) {
        cmp.set('v.mapMarkers', [
            {
                location: {
                    Street: cmp.get('v.accountRecord.Mailing_Address__c'),
                    City: cmp.get('v.accountRecord.Mailing_City__c'),
                    State: cmp.get('v.accountRecord.Mailing_State__c'),
                },
                
                value: 'Mailing',
                icon: 'custom:custom105',
                title: 'Mailing Address'
            },
            {
                location: {
                    Street: cmp.get('v.accountRecord.Garaging_Address__c'),
                    City: cmp.get('v.accountRecord.Garaging_City__c'),
                    State: cmp.get('v.accountRecord.Mailing_State__c'),
                },
                
                value: 'Garaging',
                icon: 'custom:custom98',
                title: 'Garaging Address'
            }/*,
            {
                location: {
                    Street: '1600 Pennsylvania Ave NW',
                    City: 'Washington',
                    State: 'DC'
                },

                title: 'The White House',
                description: 'Landmark, historic home & office of the United States president, with tours for visitors.'
            }*/
        ]);
        cmp.set('v.markersTitle', 'Adresses');
    },

    handleMarkerSelect: function (cmp, event, helper) {
        var marker = event.getParam("selectedMarkerValue");
    }
});