public class AnimalLocator {
    public static string getAnimalNameById(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);        
        request.setMethod('GET');
        
        HttpResponse Response = http.send(request);
        String strRep = '';
        if(Response.getStatusCode()==200){
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(Response.getBody());
            Map <String, Object > animals=(Map<String,Object>) results.get('animal');
            strRep=string.valueOf((animals.get('name')));              
        }  
            return strRep;
    }         
}