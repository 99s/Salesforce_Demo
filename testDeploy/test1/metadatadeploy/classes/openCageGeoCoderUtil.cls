public class openCageGeoCoderUtil {
    public static void forwardGeoCoding(Id recordId){        
        string endPoint = system.Label.openCageEndPoint;
        string apiKey = system.Label.OpenCageKey;
        string errorMessage ='';
        Account accRec = [select Id,Name,Location__latitude__s,Location__longitude__s,ShippingStreet,ShippingState,ShippingPostalCode,
                          ShippingCountry,ShippingCity from Account Where Id=:recordId];
        // making a query string in rest api
        string address = accRec.ShippingStreet +','+ accRec.ShippingState +','+ accRec.ShippingPostalCode + ','+ accRec.ShippingCountry +','+
                         accRec.ShippingCity;
        string encodedString = EncodingUtil.urlEncode(address,'UTF-8');        
        string finalEndPoint = endPoint+'q='+encodedString+'&key='+apiKey+'&pretty=1&limit=1';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','Application/JSON');
        req.setEndPoint(finalEndPoint);
        HttpResponse res = new HttpResponse();
        
        try{
            http.send(req);
            if(res.getStatusCode() == 200){
                string body = res.getBody();
                system.debug(system.LoggingLevel.DEBUG,'body'+ body);
                OpenCageGeoCoder openCageData = (OpenCageGeoCoder)system.JSON.deserialize(body, OpenCageGeoCoder.class);
                List<OpenCageGeoCoder.results> results = openCageData.results;
                if(results!=null && results.size()>0){
                     OpenCageGeoCoder.results result = results.get(0);
                     system.debug(system.LoggingLevel.DEBUG,'body'+ body);
                }               
            }else{
                errorMessage = 'UnAuthorized Error While Communication With OpenCage API.'+ 
                    'Status' + res.getStatus() + 'and Status Code'+ res.getStatusCode();
                system.debug(system.LoggingLevel.DEBUG,'Exception Executed'+ errorMessage);                    
            }                                     
        }
        catch(Exception e){
            if(string.valueof(e.getMessage()).startsWith('UnAuthorized endPoint ')){
                errorMessage = 'UnAuthorized endPoint: An Administration Must Go To SetUp-----> Security Control------->'
                    +'Remote Site Settings and Add '+' '+ endPoint +  'EndPoint';                               
            }
            else{
                errorMessage = 'UnAuthorized Error While Communication With OpenCage API.'+ 
                    'Status' + res.getStatus() + 'and Status Code'+ res.getStatusCode();
            }
            system.debug(system.LoggingLevel.DEBUG,'Exception Executed'+ errorMessage);              
        }          
    }
}