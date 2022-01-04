/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-23-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   10-22-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class GetSpecificAccount {
    public GetSpecificAccount() {

    }
    @AuraEnabled
    public static List<Account> getAccount(string sActId) {
        return [SELECT Id, Name , SLAExpirationDate__c, Active__c,Industry,AnnualRevenue,BillingAddress from Account where id=:sActId];
    }


    
}