//1.Create related contact when Account is created
trigger accountContactTrigger on Account (after insert) {
    List<Contact> conList = new List<Contact>();
    for(Account acc : trigger.new){
        Contact con = new Contact();
        con.lastname = acc.Name;
        con.AccountId=acc.Id;
        conList.add(con);
    }
    insert conList;
}