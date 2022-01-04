trigger autoAcc on Account (after insert) {
    list<contact> conList = new list<contact>();
       for(Account acc : trigger.new){
           contact con  = new contact();
           if(con.AccountId== null){
           con.AccountId = acc.Id;
           con.lastname = acc.Name;
           conList.add(con);  
    }
                
    }
    if(!conList.isEmpty()){
        insert conList;
    }
    
}