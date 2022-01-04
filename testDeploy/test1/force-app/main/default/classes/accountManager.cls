@RestResource(urlmapping='/v1/Account/*')
global with sharing class accountManager {
    @httpGet
    global static accountWrapper accountInformation(){
        RestRequest request = RestContext.request;
        string requestURI = request.requestURI;
        string accountId =  requestURI.subStringAfterLast('/');
        
        List<Account> accList = [Select Id,Name,Rating,
                                 Industry,Description,Phone,Fax 
                                 from account where Id=:accountId];
        
        List<Contact> conList = [Select Id,Name,FirstName,LastName,
                                 Email,Phone from contact 
                                 where AccountId =: accountId];
        
        List<Case> caseList  =  [Select Id,CaseNumber,Subject,Description,
                                 Status,Owner.Name From Case 
                                 Where AccountId=:accountId];
        
        accountWrapper wrapper = new accountWrapper();
        if(!accList.isEmpty()){
            wrapper.accountRecord = accList.get(0);
            wrapper.conList = conList;
            wrapper.caseList = caseList;           
        } 
        return wrapper;            
    }  
    @httpPost
    global static Account  postAccount(AccountInformation information){
        Account accountRecord = information.accountRecord;        
        //Account accountRecord = new Account( Name = accName, AccountNumber = accNumber, Industry = industry, Description = description);        
        insert accountRecord;                     
        Contact conRec = information.contactRecord;
        insert conRec;
        return accountRecord;                                  
    } 
    @httpPatch
    global static ResponseWrapper  updateAccount(string rating,string accNumber,string description){
        // get the account Id from URI
        RestRequest request = RestContext.request;
        string requestURI = request.requestURI;
        string accountId =  requestURI.subStringAfterLast('/');
        // prepare account record
        List<Account> accountList = [Select Id from Account Where Id =: AccountId];
        Account accRec;
        ResponseWrapper wrapper = new ResponseWrapper();
        if(accountList!=null && accountList.size()>0){
            accRec = new Account(Id = accountId, Rating = rating, AccountNumber = accNumber, Description = description);       
            update accRec;
            wrapper.accRec = accRec;
            wrapper.message = 'Account Record Updated';            
        }else{
             wrapper.message = 'Account Record Not Found'; 
        }
             return wrapper;        
    }    
    @httpDelete
    global static string  deleteAccount(){
        RestRequest request = RestContext.request;
        string requestURI = request.requestURI;
        system.debug('requestURI'+ requestURI);
        string accountId =  requestURI.subStringAfterLast('/');
        List<Account> accountList = [select Id from account Where Id =:AccountId];
        if(accountList.size()>0 && accountList!=null){
            try
            {
                delete accountList;
                return '{"message":"account record deleted!!!!!"}';  
            }
            catch(exception ex){
                string errorMessage = ex.getMessage();
                return '{"message":"'+ errorMessage +'"}';       
            }                            
        }else{
            return '{"message":"Account Record Is Not Found"}';  
        }        
    }
    global class AccountInformation {        
        Account accountRecord { get; set; }
        Contact contactRecord { get; set; }                      
    }     
    global class accountWrapper {
        global Account accountRecord;
        global List<Contact> conList;
        global List<Case> caseList;                
    }  
    global class ResponseWrapper {
        global Account accRec;
        global String message;        
    }
}