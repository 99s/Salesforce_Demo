// 15.Whenever account phone is modified then update contact record with phone field (otherphone with oldvalue and homephone with new value) associated with account records.

trigger phoneAccTrigger on Account (after update) {
    List<Contact> conList = new List<Contact>();
    Set<Id> accId= new Set<Id>();
    {
        for(Account acc:trigger.new)
        {
            if(acc.phone!=trigger.oldMap.get(acc.Id).phone)
            {
               accId.add(acc.Id);                    
            }            
        }
        if(!accId.isEmpty()){
                    
        }  
        List<Account> accList = [Select Id,name,(Select Id,otherphone,homephone from contacts) from Account where Id=:accid];
        if(accList.size()>0){
            for(Account acc:trigger.new){
                for(contact c :acc.contacts){
                    c.homephone =trigger.newMap.get(acc.id).phone;
                    c.otherphone=trigger.newMap.get(acc.id).phone;
                    conList.add(c);                    
                }                
            }  
            if(!accList.isEmpty()){
                update accList;
            }
        }        
    }    
}