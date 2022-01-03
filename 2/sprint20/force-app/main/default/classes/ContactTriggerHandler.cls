public class ContactTriggerHandler {
    public static void beforeInsertHandler(list<Contact> conlist){
        for( Contact con : conlist){
        con.Description = 'Contact Created Successfully and Subcription Updated With Before Trigger';
               
    }
      
        
    }
      public static void beforeUpdateHandler( list<Contact> Conlist, Map<Id,Contact> OldContactMap){
            for(Contact con  : Conlist  ){
                con.Description='Contact Upadted Successfully' + UserInfo.getUserName();
            }
            
        }
    public static void beforeDelete(list<contact> contactlist){
        for(Contact con: contactlist ){
            if(con.AccountId == NULL ){
                con.addError('not autorized to delete contacts where account is not Tagged'); 
            }
           
        }
    }

}