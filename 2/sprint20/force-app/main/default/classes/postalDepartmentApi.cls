/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-08-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class postalDepartmentApi {
      @AuraEnabled(cacheable=true)
      public static list<PostalResponseWrapper> postOfficeByPincode(string pincode){
           list<PostalResponseWrapper> postalList = new List<PostalResponseWrapper>();
           string endPoint = 'https://api.postalpincode.in/pincode/';
           if(string.isNotBlank(pincode)){
            endPoint=endPoint+pincode;      
           }
           Http h = new Http();
           HttpRequest hrep = new HttpRequest();
           hrep.setMethod('GET');
           hrep.setEndpoint(endPoint);
           hrep.setHeader('content-type','aplication/json');
           HttpResponse hresp = h.send(hrep);
           system.debug('hresp--------->'+hresp.getBody());
           if(hresp.getStatusCode()==200){
                  JSONParser parser = JSON.createParser(hresp.getBody());
                  parser.nextToken();
                  while(parser.nextToken()!=NULL){
                      if(parser.getCurrentToken()==JSONTOKEN.START_ARRAY){ 
                        while(parser.nextToken()!=NULL){
                            if(parser.getCurrentToken()==JSONTOKEN.START_OBJECT){ 
                            PostalResponseWrapper eachPostal = (PostalResponseWrapper)parser.readValueAs(PostalResponseWrapper.class);//deserialize into wrapper data 
                            eachPostal.PINCode = pincode;
                            postalList.add(eachPostal);
                            system.debug('eachPostal------>'+eachPostal);  
                        }
                      }                              
                    }
                }
           } 
           system.debug('postalList----->'+postalList);       
           return postalList;
      } 
      @AuraEnabled(cacheable=true)
      public static list<PostalResponseWrapper> postOfficeByBranchName(string branchName){
        list<PostalResponseWrapper> postalList = new List<PostalResponseWrapper>();
        string endPoint = 'https://api.postalpincode.in/postoffice/';
        if(string.isNotBlank(branchName)){
         endPoint=endPoint+branchName;      
        }
        Http h = new Http();
        HttpRequest hrep = new HttpRequest();
        hrep.setMethod('GET');
        hrep.setEndpoint(endPoint);
        hrep.setHeader('content-type','aplication/json');
        HttpResponse hresp = h.send(hrep);
        system.debug('hresp--------->'+hresp.getBody());
        if(hresp.getStatusCode()==200){
               JSONParser parser = JSON.createParser(hresp.getBody());
               parser.nextToken();
               while(parser.nextToken()!=NULL){
                   if(parser.getCurrentToken()==JSONTOKEN.START_ARRAY){ 
                     while(parser.nextToken()!=NULL){
                         if(parser.getCurrentToken()==JSONTOKEN.START_OBJECT){ 
                         PostalResponseWrapper eachPostal = (PostalResponseWrapper)parser.readValueAs(PostalResponseWrapper.class);//deserialize into wrapper data 
                         postalList.add(eachPostal);
                         system.debug('eachPostal------>'+eachPostal);  
                     }
                   }                              
                 }
             }
        } 
        system.debug('postalList----->'+postalList);       
        return postalList;
   }     
      public class PostalResponseWrapper{
          @AuraEnabled
          public string Name;
          @AuraEnabled
          public string Description;
          @AuraEnabled
          public string PINCode;
          @AuraEnabled
          public string BranchType;
          @AuraEnabled
          public string DeliveryStatus;
          @AuraEnabled
          public string Circle;
          @AuraEnabled
          public string District;
          @AuraEnabled
          public string Division;
          @AuraEnabled
          public string Region;
          @AuraEnabled
          public string State;
          @AuraEnabled
          public string Country;         
      }      
}