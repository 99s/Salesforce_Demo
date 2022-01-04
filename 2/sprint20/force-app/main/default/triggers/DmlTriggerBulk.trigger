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
trigger DmlTriggerBulk on Account (after update) {
   List< Opportunity > relatedOpp = [ Select Id,Name,Probability FROM Opportunity WHERE AccountId IN : Trigger.New ];

   List< Opportunity > oppsToUpdate = new List< Opportunity >();

   for(Opportunity opp : relatedOpp ){

    if((opp.Probability >= 5 && opp.Probability<100)){
        opp.Description = 'New Description Opportunity';
        oppsToUpdate.Add(opp);
    }
   }
   

    update oppsToUpdate;
}