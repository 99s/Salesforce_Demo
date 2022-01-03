/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-26-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class newsController {
    @AuraEnabled(Cacheable=true)
    public static Map<string,object> retriveNews(){
           HttpRequest httpRequest = new HttpRequest();
           httpRequest.setEndPoint('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=90d662db4ea64441b655082749ec1172');
           httpRequest.setMethod('GET');


           Map<string,object> newsJsonData = new Map<string,object>();
           string strResponse = null;           
           try{
               Http http = new HTTP();
               HttpResponse HttpResponse = http.send(httpRequest);
               if(HttpResponse.getStatusCode() == 200){
                    strResponse = HttpResponse.getBody();
               }
               else{
                   throw new CalloutException(HttpResponse.getBody());
               }
           }
           catch(Exception ex){
                throw ex;
           }
           if(!string.isBlank(strResponse)){
                newsJsonData = (Map<string,object>)JSON.deserializeUntyped(strResponse);
           }
           if(!newsJsonData.isEmpty()){
                return newsJsonData;
           }
           else {
               return null;
           }
    }

}