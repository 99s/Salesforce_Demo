/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-26-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   10-24-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class getContact {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, FirstName, LastName, Title, Phone, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            Limit 10
        ];

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactDetails(Integer offset, Integer l){

    List<Contact> con = [SELECT Id,FirstName, LastName, Title, Phone, Email From  Contact  limit :l  offset :offset  ];// ORDER BY Name desc limit 5
    System.debug('contact' +con);
    return con;

}
//    @AuraEnabled(cacheable = true)
//     public static List<SObject> findRecords(String searchKey, String objectName, String searchField){
//     String key = '%' + searchKey + '%';
//     String QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key';
//     System.debug(System.LoggingLevel.DEBUG, QUERY);
//     List<SObject> sObjectList = Database.query(QUERY);
//     return sObjectList;
 /**
    * getRecords build the SOQL query, exucutes it and return the results
    * @param API Name of the Object
    * @param List of field in comma separated form
    * @param SOQL filter in String form
    * @return SObject records returned after running the query
    */
    @AuraEnabled(cacheable=true)
    public static List<SObject> getRecords(String objectName, String fieldsToQuery, String filters){
        String query = 'SELECT ' + fieldsToQuery + ' FROM ' + objectName;
        if (String.isNotBlank(filters)){
            query += ' WHERE ' + filters;
        }
        return Database.query(query);
    }



}