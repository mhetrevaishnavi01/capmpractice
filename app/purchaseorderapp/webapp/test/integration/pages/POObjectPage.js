sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.vaish.appui.purchaseorderapp',
            componentId: 'POObjectPage',
            contextPath: '/PO'
        },
        CustomPageDefinitions
    );
});