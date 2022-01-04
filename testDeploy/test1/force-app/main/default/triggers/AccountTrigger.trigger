trigger AccountTrigger on Account (after insert,after Update) {
      
    if(Trigger.isAfter && Trigger.isInsert){
        Account acc = Trigger.new.get(0);
        openCageGeoCoderUtil.forwardGeoCoding(acc.Id);
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}