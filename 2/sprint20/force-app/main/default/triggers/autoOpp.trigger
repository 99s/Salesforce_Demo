trigger autoOpp on Account (after insert) {
    List<Opportunity> newOpps = new List<Opportunity>();
    for(Account acc : trigger.new){
        Opportunity opp = new Opportunity();
        opp.Name = acc.Name + 'Opportunity';
        opp.StageName =  'Prospecting';
        opp.CloseDate = Date.today()+65;
        opp.AccountId = acc.Id;//use the trigger record id
        newOpps.add(opp);                       
    }
    insert newOpps;  
}