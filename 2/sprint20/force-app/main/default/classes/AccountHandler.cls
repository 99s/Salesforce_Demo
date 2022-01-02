public class AccountHandler {
    public static void insertAccount(Integer value){
        Integer Counter = 1;
        List<Account> addAccounts = new List<Account>();
        while(Counter<=value){
            Account acc = new Account();
            acc.Name='Acme Inc n'+Counter;
            acc.AccountNumber='A000n'+Counter;
            addAccounts.add(acc);
            counter = counter + 1;
            System.debug('Counter Value after incrementing ' + counter);
        }
       
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('addAccounts ------------>'+addAccounts);
        insert addAccounts;
        
        
    }
    

}