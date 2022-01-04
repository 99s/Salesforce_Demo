trigger LeadTrigger2 on Lead (before insert,before update) {        
    for(Lead LeadRecord : Trigger.New){
        if(string.isBlank(LeadRecord.Rating)){
            LeadRecord.Rating = 'Warm';                        
        }                    
    }
    System.debug('Lead trigger 2 is executing');
      
}