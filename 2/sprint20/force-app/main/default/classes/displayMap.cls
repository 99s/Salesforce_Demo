public with sharing class displayMap {
    @AuraEnabled  
    public static List<Account> getOfficeLocation(String accountNameInitial) {
        String str=accountNameInitial+'%';
        return [select Id,Name,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry FROM Account WHERE Name Like:str];

    }
}