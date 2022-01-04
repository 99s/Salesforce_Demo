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
trigger SoqlTriggerNotBulk on Account (after update) {
      for(Account ac : Trigger.New){
      Opportunity[] ops = [Select Id,Name,CloseDate FROM Opportunity WHERE AccountId=:ac.Id];




      }











}