public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [select Name,AnnualRevenue from Account limit 10];
        for (Account ac : accountsList){
            string acctRev = 'account name'+ ac.Name + ', annual revenue:'+ac.AnnualRevenue;
            system.debug('accrev------------>'+acctRev);
        }
        
    }

}