public class accountBatchSchedular implements schedulable {
    public void execute(schedulableContext sc){
       accoutBatch acc= new accoutBatch();
       string jobId= Database.executeBatch(acc,3);        
        
               
    }
       
}