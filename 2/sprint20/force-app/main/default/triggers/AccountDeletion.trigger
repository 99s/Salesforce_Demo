/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-12-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-12-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger AccountDeletion on Account  ( before delete) {

    for (Account a : [SELECT Id FROM Account
    WHERE Id IN (SELECT AccountId FROM Opportunity) AND
    Id IN :Trigger.old]) {
Trigger.oldMap.get(a.Id).addError(
'Cannot delete account with related opportunities.');
}





}