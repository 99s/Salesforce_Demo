public class accoutBatch implements Database.Batchable<sobject>,Database.StateFul{
    public integer count=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
           string accsoql='Select Id,Ownership from account';
           return Database.getQueryLocator(accsoql);                    
    }
    public void execute(Database.BatchableContext bc,list<account> accList){
        List<sobject> sobjList = new List<sobject>();
        for(account acc:accList){
            acc.Ownership='Private'; 
            count=count+1;
        }
        update accList;
        system.debug('count'+count);
    }
    public void finish(Database.BatchableContext bc ){
          
               
    }     
}