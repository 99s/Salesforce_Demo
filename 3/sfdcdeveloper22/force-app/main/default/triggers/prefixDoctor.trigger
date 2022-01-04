//2.Prefix first name with Dr when new Lead is created or updated
trigger prefixDoctor on Lead (before insert) {
    for(Lead l : trigger.new){        
        l.FirstName='dr'+l.FirstName;               
    }    
}