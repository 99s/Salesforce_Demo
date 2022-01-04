/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-27-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class spoonaCular {
    private static final string SPOONACULAR_API = 'https://api.spoonacular.com';
    private static final string API_KEY = 'c1030db9791b4edca27d29bab4978a56';
    @AuraEnabled(cacheable=true)
    public static string getRandomReceipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug('response code ----------->'+response.getStatusCode());
        if(response.getStatusCode() == 200){
            return response.getBody();
        } 
            return '';                  
    }
    @AuraEnabled(cacheable=true)
    public static string getReceipe(string receipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint( SPOONACULAR_API +'/recipes/'+ receipeId +'/information?apiKey='+ API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug('response code ----------->'+response.getStatusCode());
        if(response.getStatusCode() == 200){
            return response.getBody();
        }  
            return '';                  
    }
    @AuraEnabled(cacheable=true)
    public static string getReceipeByIngradient(string ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
          
        HttpResponse response = http.send(request);
        system.debug('response code ----------->'+ response.getStatusCode());
        if(response.getStatusCode() == 200){
            return response.getBody();
        }                    
            return '';
    }   
}