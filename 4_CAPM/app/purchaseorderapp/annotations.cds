// using CalatogService as service from '../../srv/CatalogService';
using {CalatogService} from '../../srv/CatalogService';


annotate CalatogService.Pohead with @(
    UI : {
    SelectionFields : [
            PO_ID,
            GROSS_AMOUNT,
            CURRENCY_CODE,
            LIFECYCLE_STATUS
    ],
    LineItem        : [
    {
        $Type : 'UI.DataField',
        Value : PO_ID
    },
    {
        $Type : 'UI.DataField',
        Value : TAX_AMOUNT
    },
    {
        $Type:'UI.DataField',
        Value: GROSS_AMOUNT
    },
    {
        $Type:'UI.DataFieldForAction',
        Label: 'Boost',
        Action : 'CalatogService.boost',
        Inline:true
    },
    {
        $Type:'UI.DataField',
        Value:CURRENCY_CODE
    },
     {
        $Type:'UI.DataField',
        Value:OVERALL_STATUS,
    },
    {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.COMPANY_NAME
    },
    {
        $Type:'UI.DataField',
        Value:PARTNER_GUID.ADDRESS_GUID.COUNTRY
    },
    {
        $Type:'UI.DataField',
        Value:LIFECYCLE_STATUS,
        Criticality: Criticality,
        CriticalityRepresentation : #WithIcon,
    },
    {
        $Type:'UI.DataField',
        Value:NOTE
    }
    ],
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>purchaseorder}',
        TypeNamePlural : '{i18n>purchaseorders}',
        Title: {
            Label:'{i18n>POID}',
            Value: PO_ID
        },
        Description:{
            Label:'{i18n>DESC}',
            Value: PARTNER_GUID.COMPANY_NAME
        }
    },
    Facets  : [
       {
           $Type:'UI.ReferenceFacet',
           Label : '{i18n>POInfo}',
       }
    ],
});
