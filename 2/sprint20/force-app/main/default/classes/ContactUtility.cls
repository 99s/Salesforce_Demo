public class ContactUtility {
    public static void viewContacts(){
        List<Contact> listofcontacts = [Select FirstName,LastName from Contact Limit 10];
        for(Contact con :listofcontacts){
            string fullname = 'Firstname'+ con.FirstName+',Last Name: '+con.LastName;
            system.debug('list of contact is ----------->'+fullname);
        }
    }

}