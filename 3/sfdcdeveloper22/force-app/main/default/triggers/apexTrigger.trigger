trigger apexTrigger on Account (before insert) {
   
         for(account acc : trigger.new){
           acc.numberofemployees = 1250;     
       
      
    }
       
}