//Prefix first name with Dr when new Lead is created or updated
trigger PrefixDoctorTrigger1 on Lead (before insert) {
    for(Lead l: trigger.new){
        l.FirstName = 'mr'+   l.FirstName;
        
            
    }
    
    

}