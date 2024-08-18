using CatalogService as service from '../../srv/CatalogService';
annotate service.PO  with @(
    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.BP_ROLE,
        OVERALL_STATUS
    ],
    UI.LineItem:[
       {
        $Type:'UI.DataField',
        Value:OVERALL_STATUS,
        Criticality:ColorCode
       },
       {
         $Type:'UI.DataField',
         Value:TAX_AMOUNT
       },
       {
         $Type:'UI.DataField',
         Value:GROSS_AMOUNT
       },
       {
        $Type:'UI.DataFieldForAction',
        Action:'CatalogService.boost',
        Label:'boost',
        Inline:true
       }
    ],
    UI.HeaderInfo:{
      
      TypeName:'purchaseordres', //1st screen tiltle
      TypeNamePlural:'purchase orderss', //1st screen title
      Title:{Value:PO_ID}, //second screen title
      Description:{Value:PARTNER_GUID.BP_ID} //second screen title
      
    },
    UI.Facets:[
       
      {
      $Type:'UI.CollectionFacet',
      Label:'General Information',
      Facets:[
        {
          $Type:'UI.ReferenceFacet',
          Label:'OrderDetails',
          Target:'@UI.Identification'
        },
        {
          $Type:'UI.ReferenceFacet',
          Label:'Configuration Details',
          Target:'@UI.FieldGroup'
        }
        
      ]

          },
          {
            $Type:'UI.ReferenceFacet',
            Label:'PO ITEMS',
            Target:'Items/@UI.LineItem'
          }  

    ],
    UI.Identification:[
      {
        $Type:'UI.DataField',
        Value:PO_ID
      },
      {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.BP_ID
      }
    ],
     UI.FieldGroup:{
    Data:[
      {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.EMAIL_ADDRESS
      },
      {
       $Type:'UI.DataField',
       Value:OVERALL_STATUS
      },
      {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.PHONE_NUMBER
      },{
        $Type:'UI.DataField',
        Value:PARTNER_GUID.BP_ROLE
      }
    ]
     }
    );

    annotate service.poitems with @(
     UI.HeaderInfo:{
      TypeName:'PO ITEMS',
      TypeNamePlural:'PO ITEMS',
      Title:{Value: PO_ITEM_POS},
      Description: {Value:PARENT_KEY_ID}
     },
      UI.LineItem:[
        {
          $Type:'UI.DataField',
          Value: PARENT_KEY.CURRENCY_code
        },
        {
          $Type:'UI.DataField',
          Value: PO_ITEM_POS
          },
        {
          $Type:'UI.DataField',
          Value: PRODUCT_GUID.PRODUCT_ID //NOT GETTING THIS FIELD
        },
        {
          $Type:'UI.DataField',
          Value:GROSS_AMOUNT
        }
      ],
      UI.Facets:[
        {
          $Type:'UI.ReferenceFacet',
          Label:'more info',
          Target:'@UI.Identification'
        }
      ],
      UI.Identification:[
      {
         $Type:'UI.DataField',
         Value:GROSS_AMOUNT
      },
      {
         $Type:'UI.DataField',
         Value:NET_AMOUNT
      },
      {
         $Type:'UI.DataField',
         Value:TAX_AMOUNT
      }
      ],
    ) ;
    


