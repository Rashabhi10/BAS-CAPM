using {
    rv.demo.master,
    rv.demo.transaction
} from '../db/mydb';


service MyService @(path : '/CRUDDemo') {

    @readonly
    entity ReadEmployeeSrv   as projection on master.employees;

    @insertonly
    entity InsertEmployeeSrv as projection on master.employees;

    @updateonly
    entity UpdateEmployeeSrv as projection on master.employees;

    @deleteonly
    entity DeleteEmployeeSrv as projection on master.employees;


}
