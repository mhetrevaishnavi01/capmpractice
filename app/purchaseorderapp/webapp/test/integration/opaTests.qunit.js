sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ust/vaish/appui/purchaseorderapp/test/integration/FirstJourney',
		'ust/vaish/appui/purchaseorderapp/test/integration/pages/POList',
		'ust/vaish/appui/purchaseorderapp/test/integration/pages/POObjectPage',
		'ust/vaish/appui/purchaseorderapp/test/integration/pages/poitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POList, POObjectPage, poitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ust/vaish/appui/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOList: POList,
					onThePOObjectPage: POObjectPage,
					onThepoitemsObjectPage: poitemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);