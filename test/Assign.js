const Assign=artifacts.require('Assign')

contract('Assign',()=>{
let assign=null;

before(async()=>{
    accounts=await web3.eth.getAccounts();
    assign=await Assign.deployed();
});

it('Should call latest Price',async()=>{
    try{
        const price=await assign.getLatestPrice();
        assert(price!=0)
    }catch(e){
        assert(e.message())
        return;
    } 
});

it('Should call Average Price',async()=>{
    try{
        const price=await assign.getAvg();
        assert(price!=0)
    }catch(e){
        assert(e.message())
        return;
    } 
});



});