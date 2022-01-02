trigger leadTrigger on Lead (before insert,after insert,before update,after update) { 
//improve code quality of apex trigger code   
    switch on trigger.operationType{
        when BEFORE_INSERT {
           for(Lead LeadRecord : Trigger.new){
              if(String.isBlank(LeadRecord.LeadSource)){                  
                  LeadRecord.LeadSource = 'Others';
                  LeadRecord.Email = 'koushikbose628@gmail.com';
          }
           if(String.isBlank(LeadRecord.Industry)){
                  LeadRecord.addError('The Industry Can Not Be Blank');               
           }                                    
        }
               
    }
        
        when AFTER_INSERT{
            List<Task> LeadList = new List<Task>();
               for(Lead leadRecord : Trigger.new){              
                    // create a task 
                    Task leadtask = new Task(Subject='Follow Up On Lead Status', WhoId = leadRecord.Id);
                    LeadList.add(leadtask);                                                                                          
            } 
            insert LeadList;
                    
        }        
        when BEFORE_UPDATE {
            for(Lead LeadRecord : Trigger.new){
               if(String.isBlank(LeadRecord.LeadSource)){                  
                  LeadRecord.LeadSource = 'Others';
                  LeadRecord.Email = 'koushikbose628@gmail.com';
        }
if((LeadRecord.Status == 'Closed - Converted'|| LeadRecord.Status == 'Closed - Not Converted') && Trigger.oldMap.get(LeadRecord.Id).Status == 'Open - Not Contacted')
        {
            LeadRecord.Status.addError('you can not directly close open lead record');
        }  
                                                  
        }
                              
        } 
    }
}