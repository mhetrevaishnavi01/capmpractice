using { vaish.db.master,vaish.db.transaction } from '../db/datamodel';
using {  cappo.cds } from '../db/CDSViews';


service CatalogService @(path: 'CatalogService'){
    
    
    entity businesspartner as projection on master.businesspartner;
    //entity products as projection on cds.CDSViews.ProductView; /will get only product data even though item association is there
    //entity ItemView as projection on cds.CDSViews.ItemView;    

    entity EmployeeSet as projection on master.employees;//as currencies is refereing to entity in sap common.cds thats why currency is also exposed
    //@readonly //you can read only this entity but not creating and patching
    entity PO @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        Items,
        case OVERALL_STATUS
        when 'P' then 'pending'
        when 'X' then 'rejected'
        when 'A' then 'approved'
        end as OVERALL_STATUS:String(10),

        case OVERALL_STATUS
        when 'P' then 1
        when 'X' then 2
        when 'A' then 3
        end as ColorCode:Integer
    }
    actions{
        @Common.SideEffects:{
            $Type:'Common.SideEffectsType',
            TargetProperties:[
                'in/GROSS_AMOUNT',
            ],
        }
        action boost() returns PO
    };
    function largetsOrder() returns PO;
    //@Capabilities : { Deletable:false }
    entity poitems as projection on transaction.poitems;
}
