/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 07-24-2021
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class weatherController {    
    public static string apikey = 'deb80a11dbcb71e236135439c8715ed4';
    public static string method = 'GET';
    @AuraEnabled
    public static void getWeather(string city){
        string endPoint = 'https://api.openweathermap.org/data/2.5/weather?q='+city+'&appid='+apikey;
        string temparature;
        decimal convertedTemp;
        string humidity;
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setMethod(method);
        request.setEndPoint(endPoint);               
        HTTPResponse response = http.send(request);
        string body = response.getBody();
        //system.debug('city--------->'+body);
        if(response.getStatusCode()==200){
            system.JSONParser JP = JSON.createParser(body);
            while(JP.nextToken()!= null){
                String key = JP.getText();
                if(key=='temp'){
                    JP.nextToken();
                    temparature = (string)JP.getText();
                    convertedTemp = Decimal.valueOf(temparature) -273;                           
                }                  
            }
        }
        system.debug('convertedTemp------------->'+convertedTemp);         
    }    
}