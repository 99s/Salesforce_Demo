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
trigger bulkTrigger on Account (before insert) {
 //Account a = Trigger.new[0];
 for(Account a: Trigger.New){
    a.Phone='1234'  ;
 }
 

















    
}