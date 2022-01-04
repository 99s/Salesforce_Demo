trigger ContactTrigger on Contact (before insert,before update,before delete) {    
    if(trigger.IsBefore && trigger.IsInsert){
         ContactControllerClass.UpdateContact(trigger.new); 
    }
    if(trigger.IsBefore && trigger.IsUpdate){
        ContactControllerClass.beforeUpdateController(trigger.new,trigger.oldMap);        
    }
    if(trigger.IsBefore && trigger.IsDelete){
        ContactControllerClass.beforeDelete(trigger.old);
        
    }
            
}