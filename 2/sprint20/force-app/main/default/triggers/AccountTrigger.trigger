trigger AccountTrigger on Account ( before insert, before update, after update  ) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('I am in before insert Context');
                
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc :Trigger.new){
                System.debug('New Name : '+ acc.Name);
                System.debug('Old Name : '+ Trigger.oldMap.get(acc.Id).Name);
            
        }
      
    }
   }  
}