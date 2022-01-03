//5 When lead is created or updated then check if the email of lead is already there in existing contacts. If email already exist then throw error.
trigger DuplicateEmailsInLeadTrigger on Lead (before insert,before update) {
       map<String,Contact> mapOfContacts = new map<String,Contact>();
       List<Contact> con  = [select Id,email from Contact] ;
       for(Contact c:con)
       {
         mapOfContacts.put(c.email,c);                   
       }
    for(lead l : trigger.new){
        if(trigger.new!=NULL){
            if((l.email !=NULL)&& (trigger.isInsert || (l.email !=trigger.oldmap.get(l.id).email))){
                if(mapOfContacts.containsKey(l.email)){
                    l.Email.addError('Email Already Exists');
                }                
            }                         
        }
    }          
}