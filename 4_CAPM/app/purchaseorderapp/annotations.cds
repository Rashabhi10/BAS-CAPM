using CatalogService as service from '../../srv/CatalogService';

annotate CatalogService.Pohead with {
    PARTNER_GUID@(
        Common:{
            Text: PARTNER_GUID.COMPANY_NAME
        },
        ValueList.entity: CatalogService.BPSet
    )
};

@cds.odata.valuelist
annotate CatalogService.BPSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

annotate CatalogService.POitems with {
    PRODUCT_GUID@(
        Common:{
            Text: PRODUCT_GUID.DESCRIPTION
        },
        ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);

annotate CatalogService.Pohead with @(
    UI : {
    SelectionFields : [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            CURRENCY.code,
    ],
    LineItem        : [
    {
        $Type : 'UI.DataField',
        Value : PO_ID
    },
    {
        $Type:'UI.DataField',
        Value: GROSS_AMOUNT
    },
    {
        $Type:'UI.DataFieldForAction',
        Label: 'Boost',
        Action : 'CatalogService.boost',
        Inline:true
    },
    {
        $Type:'UI.DataField',
        Value:CURRENCY.code
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
           Target:![@UI.FieldGroup#HeaderGeneralInformation]
       },
       {
           $Type : 'UI.ReferenceFacet',
           Label : '{i18n>POIitemInfo}',
           Target : 'Items/@UI.LineItem',
       },
    ],

    FieldGroup#HeaderGeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data:[
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY, 
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.BP_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY.code
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            }
        ]
    }
});


annotate CatalogService.POitems with @(
    UI: {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRODUCT_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY.code,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'PO Item',
            TypeNamePlural : 'PO Items',
            Title: {
                $Type: 'UI.DataField',
                Value: ID
            },
            Description:{
                $Type: 'UI.DataField',
                Value: PO_ITEM_POS
            }
        },
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Line Item Information',
                Target : '@UI.FieldGroup#POLineItemHeader',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Product Detail',
                Target : '@UI.FieldGroup#ProductDetail',
            },
        ],

        FieldGroup#POLineItemHeader  : {
            $Type : 'UI.FieldGroupType',
            Data :[
                    {
                        $Type : 'UI.DataField',
                        Value : PO_ITEM_POS,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : PRODUCT_GUID_NODE_KEY,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : PRODUCT_GUID.DESCRIPTION,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : GROSS_AMOUNT,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : NET_AMOUNT,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : TAX_AMOUNT,
                    },
                    {
                        $Type : 'UI.DataField',
                        Value : CURRENCY.code,
                    },
            ]
        },
        FieldGroup#ProductDetail : {
            $Type : 'UI.FieldGroupType',
            Data  : [
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRODUCT_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.TYPE_CODE,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRICE,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.MEASURE_UNIT,
            },
        ],
        },

    }
);

