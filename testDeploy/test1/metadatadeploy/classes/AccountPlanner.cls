/*
  url-  /services/Soap/class/namespace/classname - where in soap word s will always be in capital
*/
global class AccountPlanner {    
    webservice static string fullName(string firstName,string lastname){
           string greeting ='Welcome' + firstname +' '+ lastname;
           return greeting;              
    } 
    webservice static Account createAccount(AccountWrapper accountRec){
           Account accRec = new Account();
           accRec.Name = accountRec.Name;
           accRec.Rating = accountRec.Rating;
           accRec.Industry = accountRec.Industry;
           accRec.Phone = accountRec.Phone;
           //accRec.AccountNumber = accountRec.AccountNumber;
           insert accRec;
        
           return accRec;    
      }
    global class AccountWrapper {
         webservice string Name;
         webservice string Rating;
         webservice string Industry;
         webservice string Phone;         
    }
}