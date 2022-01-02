@isTest
public class updateaccountTest {
     @isTest
     private static void testupdateAccount()
     {
        account acc = new account();
        acc.Name = 'Test Account';
        acc.Active__c = 'No';
        acc.Rating='Cold';
        insert acc;
        
        contact con = new contact();
        con.FirstName = 'Test';
        con.LastName = 'Test';
        con.accountId = acc.Id;
        insert con;
         
        updatedAccount.updateAccounts(); 
        account updateAcc = [select Id,Active__c,Rating from Account Where Id=:acc.Id];
        system.assertEquals('Warm',updateAcc.Rating);
        
    }
       
}