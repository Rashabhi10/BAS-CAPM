using { anubhav.db.master, anubhav.db.transaction  } from '../db/datamodel';

service mysrvdemo {

    function somesrv(msg: String) returns String;

    @readonly
    entity ReadEmoployeeSrv as projection on master.employees;
    @insertonly
    entity InsertEmployeeSrv as projection on master.employees;
    @updateonly
    entity UpdateEmployeeSrv as projection on master.employees;
    @deleteonly
    entity DeleteEmployeeSrv as projection on master.employees;

}