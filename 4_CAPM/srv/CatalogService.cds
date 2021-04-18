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
        * , Items : redirected to POitems
    }

    entity POitems @(title : '{i18n>poitems}') as projection on transaction.poitems {
        * , PARENT_KEY : redirected to Pohead, PRODUCT_GUID : redirected to ProductSet
    }
}
