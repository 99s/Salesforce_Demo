/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-09-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class BitlyServiceInvocable {   
    @invocableMethod(label = 'Shorten URL' description = 'Generate short url with bitly API')
    public static void shorten(list<id> courseIds){
        shortenFuture(courseIds);   
    }
    @future(callout=true)
    public static void shortenFuture(list<id> courseIds){
        list<Course__c> courseList = [select Id,Name,Course_Url__c,Short_Url__c,Coupon_Code__c from Course__c where Id IN:courseIds];      
        //BitlyService bservice = new BitlyService();
        if(courseList.size()>0){
           for(Course__c c : courseList){
              string fullURL = c.Course_Url__c;
              if(c.Coupon_Code__c !=NULL){
                fullURL = fullURL +'?CouponCode='+ c.Coupon_Code__c;
              }
            //   string shortUrl = bservice.shorten(fullURL);
            //   c.Short_Url__c = shortUrl;
           }
           if(courseList.size()>0){
              update courseList;
           }
        }
    }   
}