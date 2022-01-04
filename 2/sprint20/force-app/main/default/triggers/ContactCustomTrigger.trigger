trigger ContactCustomTrigger on Contact (after insert) {
   List<Account> accList = new List<Account>();
       for(Contact con : trigger.new){  
        // check if the account is null on contact 
          if(con.AccountId == null){
              Account acc = new Account();
              acc.name = con.lastname;
              acc.phone = con.phone;
              accList.add(acc);
                            
        }
           if(!accList.IsEmpty()){
                insert accList;
           }                                 
    }  
}