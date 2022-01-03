// 3.Update Account Rating to ‘Hot ‘on account when opportunity stage equals ‘closed one’
trigger updateAccountRating on Opportunity (after insert,after update) 
{
    Set<Id> AccountId = new Set<Id>();
    List<Account> Accounts = new List<Account>();
    if(trigger.new!=null)
    {
        for(opportunity opp : trigger.new)
        {
            if(opp.StageName=='Closed Won')
            {
                AccountId.add(opp.AccountId);                
            }                       
        }                       
    }    
    List<Account> a = [Select Id,Rating from Account where Id IN: AccountId];
    if(a!=null){
        for(Account acc : a){
            acc.Rating='Hot';
            Accounts.add(acc);
        }
    }
    update Accounts;
}