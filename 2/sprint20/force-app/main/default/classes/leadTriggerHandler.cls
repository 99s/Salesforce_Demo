public class leadTriggerHandler {

     public static void beforeInsertHandler(List<Lead> newRecords){        
         for(Lead LeadRecord : newRecords){
              if(String.isBlank(LeadRecord.LeadSource)){                  
                  LeadRecord.LeadSource = 'Others';
           }
              if(String.isBlank(LeadRecord.Industry)){
                  LeadRecord.addError('The Industry Can Not Be Blank');               
           }                 
    }        
}
}