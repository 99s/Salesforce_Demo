public class GoogleWebService {
     public static HttP http = new Http();
     public static HTTPResponse response;
     public static HttPRequest request;
    
    
     public static void getProfile(string userEmail){
        
         request = new HttPRequest();
         request.setMethod('GET');
         request.setEndpoint('callout:GoogleAPI/gmail/v1/users/'+ userEmail + '/profile');
         
         response = http.send(request);
         system.debug(response.getBody());                    
    }
      public static void getMyCalendar() {
         
        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:GoogleAPI/calendar/v3/users/me/calendarList');
 
        response = http.send(request); 
 
        System.debug(response.getBody());
    }
 
    public static void getFile(String fileId) {
 
        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:GoogleAPI/drive/v3/files/' + fileId);
 
        response = http.send(request); 
 
        System.debug(response.getBody());
    }    
}