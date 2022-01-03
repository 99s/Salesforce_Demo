public class eventUtility {
    public static string eventPriority(string eventStatus)
    {
        
        string eventPri;
        
        if(string.isBlank(eventStatus)|| eventStatus.length()>2)
        {            
            return null;            
        }  
        if(eventStatus == 'CA'){
            eventPri='High';
        }
        else{
            eventPri='Medium';
        }
        return eventPri;
    }       
}