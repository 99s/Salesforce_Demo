//11.Whenever new account is created with annual revenue more than 50,000 then add Smriti Sharan as contact name
trigger annualRevenueAccTrigger on Account (after insert) {
    List<Contact> ccList = new List<Contact>();
    if(trigger.new!=NULL){
        for(Account acc :trigger.new){
            if(acc.AnnualRevenue>50000)
            {
                Contact con = new Contact();
                con.FirstName='Koushik';
                con.lastname='Bose';
                con.AccountId=acc.Id;
                ccList.add(con);                
            }            
        }
        if(ccList.size()>0){
            insert ccList;
        }            
    }    
}