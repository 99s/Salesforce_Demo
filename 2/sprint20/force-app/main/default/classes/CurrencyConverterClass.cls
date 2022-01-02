public class CurrencyConverterClass 
{
    public static Decimal convertCurrencyToINR(Decimal eur)
    {
       
           
        Decimal inr =0.0;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        
        
        req.setEndpoint('https://api.exchangeratesapi.io/latest');
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
       
  
        Map<string,Object> jsonBody = (Map<string,Object>)json.deserializeUntyped(res.getBody());
        system.debug('jsonBody--------->'+jsonBody);
        
        Map<string,Object> mMap = (Map<string,Object>) jsonBody.get('rates');
        Decimal conversionRate = (Decimal) mMap.get('INR');
        system.debug('conversionRate------>'+conversionRate);
        
        inr = eur*conversionRate;
        
            return inr;                             
    }    
}