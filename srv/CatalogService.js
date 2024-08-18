module.exports=cds.service.impl(async function() {
  
    
    //step1 :get the object of our odata entities
    const{ PO,EmployeeSet }=this.entities;

    this.before('UPDATE',EmployeeSet,(req)=>{
     var salary = parseInt(req.data.salaryAmount);
     if(salary>10000){
        req.error(500,"sorry no one can get this salary");
     }
    })

    this.after('READ',EmployeeSet,(req)=>{
        debugger;
        req.push({"ID":"nitish","salaryAmount":"9999"})
    });
    this.on('boost', async (req,res) => {
        try {
            //since it is inbound we will get the key of PO
            const ID = req.params[0];
            //print on consol the key
            console.log("primary key we got is"+ID);
            //START db transaction on incoming request(req)
            const tx = cds.tx(req);
            //update dbtable set gross amount = current + 20k where id=key
            await tx.update(PO).with({
                GROSS_AMOUNT: { "+=" : 20000 }
            }).where(ID);
            
        }
        catch(error){
            return "ERROR"+error.toString();
        }
    });

    this.on('largestOrder',async(req,res)=>{
        try{
            const tx = cds.tx(req);
            const reply = await tx.read(PO).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(1);
            return reply;
        }
        catch(error) {
           return "error" + error.toString();
        }
    })
})