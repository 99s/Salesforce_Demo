/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-13-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-13-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger SoqlTriggerBulk on Account ( after update ) {
    // List <Account> acctsWithOpps = [Select Id,(Select Id,Name,CloseDate FROM  Opportunities)
    //                                 FROM Account WHERE  Id IN : Trigger.New];

    //  for(Account a : acctsWithOpps ) {
    //     Opportunity [] relatedOpps = a.Opportunities;
        
    //  }    
    
    // List<Opportunity> relatedOpps = [SELECT Id,Name,CloseDate FROM Opportunity WHERE AccountId IN:Trigger.New];

    // for(Opportunity opp : relatedOpps ){

    //     opp.Description = 'New Opportunity';
        

    // }
    for(Opportunity opp: [Select Id,Name,CloseDate FROM Opportunity WHERE AccountId IN : Trigger.New]){

        opp.Description = 'new Opportunity';


    }










    
}