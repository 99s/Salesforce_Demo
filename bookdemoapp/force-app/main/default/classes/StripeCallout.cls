public with sharing class StripeCallout {
    
    private static final String CUSTOMER_URL =  StripeAPI.StripeAPICustomerUrl;
    private static final String API_KEY =  StripeAPI.PrivateApiKey;

    @AuraEnabled(cacheable=true)
    public static string makeGetcallout(){
            HttpResponse hs = new HttpResponse();
            String returnValue = 'initiated.';
               try{
                system.debug('API_KEY : '+API_KEY);
               Integer statusCode = 0;
               String response = '';
            HttpRequest request = new HttpRequest();
            request.setEndpoint(CUSTOMER_URL);
            request.setmethod('POST');
            Blob headerValue = Blob.valueOf(API_KEY + ':');
            String authorizationHeader = 'BASIC' + EncodingUtil.base64Encode(headerValue);
                   system.debug('authorizationHeader : '+authorizationHeader);
            //http.setHeader('Authorization', authorizationHeader);
            request.setHeader('Authorization',' Bearer '+API_KEY);
            String body = 'name=ROY&email=abc@gmail.com&description=customer';
            request.setBody(body);
            Http con = new Http();
            hs = con.send(request);
            system.debug('HttpResponse Body : '+hs.getBody());
            response = hs.getBody();
            statusCode = hs.getStatusCode();
            system.debug('StatusCode : '+hs.getStatusCode());
            if(statusCode == 200){
               returnValue = 'success 200 : '+hs.getBody();
            }
               }catch(Exception e){
                system.debug('Error : '+e);
                returnValue = 'failure : '+e;
               }
               return returnValue;
            }
    
}