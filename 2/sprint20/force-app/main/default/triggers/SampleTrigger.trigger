trigger SampleTrigger on Contact (after update) {
    
    Set<String> accIdSet = new set<String>();
    if(RecursiveTriggerHandler.isFirstTime ){
          RecursiveTriggerHandler.isFirstTime = false;
                
        for(Contact con : trigger.new){
            if(con.name != 'SFDC'){
                accIdSet.add(con.accountId);
            }
                        
        }        
    }
  
}