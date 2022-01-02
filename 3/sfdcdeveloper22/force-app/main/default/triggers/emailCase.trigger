// 13. Whenever case is created with origin as email then set status as new and priority as Normal
trigger emailCase on Case (before insert) {
    if(trigger.new!=NULL){
        for(case c:trigger.new){
            if(c.origin=='Email'){
               c.status='New';
               c.priority='Normal';                               
            }                     
        }            
    }    
}