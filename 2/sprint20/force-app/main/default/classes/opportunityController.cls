public class opportunityController {
    public static void updateProfile(List<Id> OppIds){
        List<Opportunity> opps = [SELECT Id,Amount,Profile__c From Opportunity Where Id IN : OppIds];
        for(Opportunity opp : opps){
        
            if(opp.Amount == null){ 
                opp.Profile__c = 'Low';
            }
            else if(opp.Amount>10000){
               opp.Profile__c='Low';                
                       
            }else if(opp.Amount>50000){
                opp.Profile__c='High';
                                               
            }else{
                opp.Profile__c='Medium';                
                
            }
            
                             
    }
        Update opps;
        
  
}
}