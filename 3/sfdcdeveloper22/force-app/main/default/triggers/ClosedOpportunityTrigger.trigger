//9. When an opportunity is inserted or updated then if the stage name is ‘Closed won’ then add the task.
trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
     List<Task> taskList = new List<Task>();
     if(trigger.new !=NUll){
        for(Opportunity opp : [select Id,StageName from Opportunity Where StageName='Closed Won' AND Id IN : Trigger.new])
        {
            if(opp.StageName=='Closed Won'){
                taskList.add(new task(Subject='Follow Up Test Task',WhatId=opp.Id));                
            }            
    }        
            if(taskList.size()>0){
                insert taskList;
         }
    }    
}