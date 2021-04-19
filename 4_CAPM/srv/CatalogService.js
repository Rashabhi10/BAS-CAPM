module.exports = cds.service.impl(async function () {
    const {
        EmployeesSet, Pohead
    } = this.entities;

    this.before('UPDATE', EmployeesSet, (req, res) => {
        console.log(req.data.salaryAmount);
        if (parseFloat(req.data.salaryAmount) >= 1000000) {
            req.error(500, "Not permitted!!, Salary must be below 1000000");
        }
    });

     this.on('boost', async req => {
        try {
            const ID = req.params[0];
            console.log("Your Purchase order with ID ---> " + ID + " will be Boosted");
            const tx = cds.tx(req);
            await tx.update(Pohead).with({
                GROSS_AMOUNT: { '+=' : 20000 }, NOTE: "Boosted!!"
            }).where(ID);
            return {};

        } catch (error) {
            return "Error " + error.toString();
        }
    });

    
    this.on('largestOrder', async req => {
        try {
            const ID = req.params[0];
            console.log("Your Purchase order with ID ---> " + ID + " will be Boosted");
            const tx = cds.tx(req);
            const reply = await tx.read(Pohead).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
            return reply;

        } catch (error) {
            return "Error " + error.toString();
        }
    });
});