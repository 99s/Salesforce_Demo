//When the value of AssistantPhone field on contact is updated , I would like the field value of phone__c the opportunity and phone on account also get updated.
trigger oppContact on Contact (before insert) {
    Set<id> setAccId = new Set<id>();
    List<Opportunity> oppNewList = New List<Opportunity>();
    List<Account> accNewList = New List<Account>();
    Map<id,String> mapContactPhone = New Map<id,String>();
    for(contact c: Trigger.New)
    {
        if(c.AssistantPhone!=null && c.AssistantPhone!=Trigger.OldMap.get(c.id).AssistantPhone
           && c.accountid !=null ){
               setAccId.add(c.accountid);
           }
        
        List<Account> acclist = [select id,phone,(Select id,phone__c from Opportunities) from Account where Id IN: setAccId];
        if (acclist.size() > 0) {
            for(Account acc: acclist){
                for(Opportunity opp: acc.Opportunities){
                    acc.phone= c.AssistantPhone;
                    opp.phone__c= c.AssistantPhone;
                    accNewList.add(acc);
                    oppNewList.add(opp);
                }
            }
        }
    }
    update oppNewList;
    update accNewList;
    
}