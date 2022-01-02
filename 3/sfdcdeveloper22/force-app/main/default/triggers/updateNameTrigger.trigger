//4.Whenever phone field is updated in account then the name field should also get updated with name and phone number in accounts
trigger updateNameTrigger on Account (before insert) {
    if(trigger.new!=null){
        for(account acc : trigger.new)
        {
            if(acc.phone != trigger.oldMap.get(acc.Id).phone)
            {
                acc.name=acc.name+acc.phone;                
            }                       
        }
    }    
}