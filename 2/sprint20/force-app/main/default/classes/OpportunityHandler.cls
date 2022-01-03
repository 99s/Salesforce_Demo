public class OpportunityHandler {
    
    public static void afterInsertHandler(list<Opportunity> opplist){
        Map<id,Id> oppOwnerMap = new Map<id,Id>();
        for(Opportunity opp : oppList){            
            oppOwnerMap.put(opp.id,opp.ownerid);                                
        }                
    }
}