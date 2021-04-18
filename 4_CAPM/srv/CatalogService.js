module.exports = cds.service.impl(async function() {
    const {
        EmployeesSet
    } = this.entities;

    this.before('UPDATE', EmployeesSet, (req,res) => {
        console.log(req.data.salaryAmount);
        if(parseFloat(req.data.salaryAmount) >= 1000000) {
            req.error(500, "Not permitted!!, Salary must be below 1000000");
        }
    });
});