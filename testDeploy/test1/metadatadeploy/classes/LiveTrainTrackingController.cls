public class LiveTrainTrackingController {
    
    public static void getTrainInfo(string trainNo,date dateEntered){
        string month = string.valueOf(dateEntered.month());
        string year = string.valueOf(dateEntered.year());
        string day = string.valueOf(dateEntered.day());
        if(dateEntered.month()<10){
            month='0'+ month;                        
        }
        if(dateEntered.month()<10){
            day = '0'+ day;
        }
        string datestring = month+year+day;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://indianrailapi.com/api/v2/livetrainstatus/apikey/'+System.label.TrainTrackerApiKey +'/trainNumber/'+ trainNo +'/date/'+datestring+'/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response-------->'+response.getBody());
        if(response.getStatusCode()==200){
            
        }else{
             //return null;
        }       
    }    
}