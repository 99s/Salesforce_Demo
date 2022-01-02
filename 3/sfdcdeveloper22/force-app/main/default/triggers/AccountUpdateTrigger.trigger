//7.Write a trigger to update a field (city) in Account when same field(city) is updated in opportunity
trigger AccountUpdateTrigger on Account (before insert) {
    Set<Id> AccountIds = new Set<Id>();
    
    for(Account a : trigger.new){
        if(a.City__c!=trigger.oldmap.get(a.Id).City__c){
            AccountIds.add(a.Id);        
        }        
    }
    List<Opportunity> oppList = [Select Id,AccountId,City__c from Opportunity where accountid In:AccountIds];
    if(oppList.size()>0){
        for(Opportunity opp: oppList){
            opp.City__c = trigger.newMap.get(opp.AccountId).City__c;                      
        } 
        update oppList;
    }
}