using {
    rv.demo.master,
    rv.demo.transaction
} from '../db/mydb';

service CalatogService @(path : '/CatalogService') {

    entity AddressSet                          as projection on master.address;
    entity BpSet                               as projection on master.bp;
    entity EmployeesSet                        as projection on master.employees;
    // entity prodtextSet      as projection on master.prodtext;
    entity ProductSet                          as projection on master.product;

    entity Pohead @(title : '{i18n>pohead}')   as projection on transaction.purchaseorder {
        * , round(
            GROSS_AMOUNT, 2
        ) as GROSS_AMOUNT : Decimal(15, 2), Items : redirected to POitems
    }actions{
        function largestOrder() returns array of Pohead;
        action boost();
    }

      annotate Pohead with {
        GROSS_AMOUNT @title: '{i18n>GROSS_AMOUNT}';
    };

    entity POitems @(title : '{i18n>poitems}') as projection on transaction.poitems {
        * , PARENT_KEY : redirected to Pohead, PRODUCT_GUID : redirected to ProductSet
    }
}
