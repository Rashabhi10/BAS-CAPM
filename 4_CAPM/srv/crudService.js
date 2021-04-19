const cds = require("@sap/cds");
const { employees } = cds.entities("rv.demo.master");

const mysrv = function (srv) {

    srv.on("READ", "ReadEmployeeSrv", async (req, res) => {
        var results = [];

        //CDS Query Language
        //results = await cds.tx(req).run(SELECT.from(employees));

        //where condition
        // results = await cds.tx(req).run(SELECT.from(employees).where({"nameFirst":"Susan"}));

        //user passes key, entity/key
        var whereString = req.data;
        if (whereString.hasOwnProperty("ID")) {
            console.log(whereString);
            results = await cds.tx(req).run(SELECT.from(employees).where(whereString));
        } else {
            results = await cds.tx(req).run(SELECT.from(employees).limit(1));
        }

        return results;

    });

    srv.on("UPDATE", "UpdateEmployeeSrv", async (req, res) => {

        let returnData = await cds.tx(req).run([
            UPDATE(employees).set({
                nameFirst: req.data.nameFirst,
                nameLast: req.data.nameLast
            }).where({ ID: req.data.ID })
        ]).then((resolve, reject) => {
            if (typeof (resolve) !== undefined) {
                return req.data;
            } else {
                req.error(500, "Issue during update!!")
            }
        }).catch(error => {
            req.error(500, "Issue during update!!" + error.toString());
        })
        return returnData;
    });

    srv.on("DELETE", "DeleteEmployeeSrv", async (req, res) => {

        let returnData = await cds.tx(req).run([
           DELETE.from(employees).where(req.data)
        ]).then((resolve, reject) => {
            if (typeof (resolve) !== undefined) {
                return req.data;
            } else {
                req.error(500, "Issue during update!!")
            }
        }).catch(error => {
            req.error(500, "Issue during update!!" + error.toString());
        })
        return returnData;
    });
};

module.exports = mysrv;