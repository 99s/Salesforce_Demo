/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-10-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-10-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class phoneVerification {
 
       public static PhoneResponse InvokeVeriphoneApi(string MobileNum){
            string apikey='4C9CCB65B4B44B5D8CF44D22D8A38FD9'; 
            string veriphoneEndPoint='https://api.veriphone.io/v2/verify?phone='+ MobileNum +'&key='+ apikey;
            //Http
            Http h = new Http();
            //HttpRequest
            HttpRequest req = new HttpRequest();
            req.setEndpoint(veriphoneEndPoint);
            req.setMethod('GET');
            req.setTimeout(60000);
            //Httpresponse
            HttpResponse res = h.send(req);
            //Response Instance To Return To Calling Class
            PhoneResponse pres = (PhoneResponse)JSON.deserialize(res.getBody(),PhoneResponse.class); 
            return pres;

            //return new PhoneResponse().parse(res.getBody());
       }
        public class PhoneResponse {
              public string status;
              public string phone;
              public string phone_valid;
              public string phone_type;
              public string phone_region;
              public string country;
              public string country_code;
              public string country_prefix;
              public string international_number;
              public string local_number;
              public string e164;
              public string carrier;  
        }    
}