public with sharing class AddEditLineItemController {

    // @AuraEnabled
    // public static List<Bundle_Type_Product_Association__c> ProductsList(String recordTypeName){
    //     List<Bundle_Type_Product_Association__c> bundleTypeList = new List<Bundle_Type_Product_Association__c>();
    //     bundleTypeList = [Select Id, Name, Item_Number__c, Bundle_Type__c, Item__c,Item__r.name, Bundle_Type__r.Name From Bundle_Type_Product_Association__c Where Bundle_Type__r.Name = : recordTypeName];
    //     return bundleTypeList;
    // }
    // @AuraEnabled
    // public static String SystemDetails(String systemId){
    //     Bundle__c bunRecord = new Bundle__c();
    //     bunRecord = [Select Id, Name, Bundle_RecordType__c From Bundle__c Where Id =: systemId Limit 1];
    //     return bunRecord.Bundle_RecordType__c;
    // }
    // @AuraEnabled
    // public static List<Equipment_Inventory__c> EquipmentList(String prodName){
    //     List<Equipment_Inventory__c> eqList = new List<Equipment_Inventory__c>();
    //     if(prodName!= null)
    //     eqList = [Select Id, Name, DeviceMake__c, Device_Model__c, Device_Serial_Number__c, FullName__c From Equipment_Inventory__c Where FullName__c =: prodName];
    //     return eqList;
        

    // }
}