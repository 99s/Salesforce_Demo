/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-13-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-12-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger AddRelatedRecord on Account (after insert,after update) {

    //  List<Opportunity> oppList = new List < Opportunity>();
    //  Map<Id,Account> acctsWithOpps = new Map< Id, Account >(
    //  [Select Id,(Select Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
          
    //   for(Account a : Trigger.New){
    //     System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
    //   if(acctsWithOpps.get(a.Id).Opportunities.size()==0){
    //     oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
    //     StageName='Prospecting',
    //     CloseDate=System.today().addMonths(1),
    //     AccountId=a.Id));

    //   }



    //   }
    //   if (oppList.size() > 0) {
    //     insert oppList;
    // }

    List<Opportunity> oppList = new List<Opportunity>();
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate over accounts that are in this trigger but that don't have opportunities.
    for (Account a : [SELECT Id,Name FROM Account
                     WHERE Id IN :Trigger.New AND
                     Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        // Add a default opportunity for this account
        oppList.add(new Opportunity(Name= ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id)); 
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }




     }