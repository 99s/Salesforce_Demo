public class ContactControllerClass {
     public static void UpdateContact(list<contact> conList){
        for(contact con : conList){
            con.Description = 'kolkata';            
        }              
    } 
    public static void beforeUpdateController(list<contact> conlist, Map<Id,Contact> oldContactMap){
        for(contact con : conlist){
            con.Description = 'Contacted updated succesfully by '+ UserInfo.getUserName();
        }
             
    }
    public static void beforeDelete(List<contact> conlist){
        for(contact con : conlist){
            if(con.AccountId == null){
                con.addError('you are not autorized to delete contact where account is not tagged');
            }
        }
    }
           
}