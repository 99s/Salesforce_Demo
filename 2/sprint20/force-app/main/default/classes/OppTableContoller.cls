/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-26-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   10-26-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class OppTableContoller { 

    @AuraEnabled(cacheable=true)
    public static List <Opportunity> getOpportunities() {
        return [SELECT Id, Name, Type, StageName, Amount, CloseDate, OwnerId, Owner.Name FROM Opportunity  WITH SECURITY_ENFORCED
        ];
    }
}