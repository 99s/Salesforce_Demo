public class updatedAccount {
    
    public static void updateAccounts(){
          List<account> accList = new List<account>();
          Set<id> accIdSet = new Set<id>();
          
          for(contact con : [select id,account.Id from contact where name like '%test%' and account.Id!=null])
          {
              if(!accIdSet.contains(con.account.id)){
                   account acc = new account();
                   acc.Id = con.Account.Id;
                   acc.Active__c= 'Yes';
                   acc.Rating = 'Hot';
                   accList.add(acc);
                   accIdSet.add(con.account.Id);                  
              }                      
         }
        if(!accList.isEmpty()){
             update accList;
                        
        }
           
    }    
        
}