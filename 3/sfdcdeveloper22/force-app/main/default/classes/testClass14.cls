@isTest
public class testClass14 
{
    @testSetup
    static void setup(){
        // create common test account
        List<account> testAccount = new List<account>();
        for(integer i=0;i<2;i++){
            testAccount.add(new Account(Name='TestAcc'+1));
            
        }
        if(testAccount.size()>0){
            insert testAccount;
        }
        
        
    }
    @isTest
    static void testMethod1()
    {
        // get first test account using soql query
        account acct = [select id,Name from account where Name = 'testaccto' limit 1];
        // modify first account
        acct.Phone = '555-1214';
        // this update to this local method
        update acct;
        // delete the second account
        account acct2 = [select id,Name from account where Name ='TestAcc1' limit 1];
        delete acct2;
        
    }
    
}