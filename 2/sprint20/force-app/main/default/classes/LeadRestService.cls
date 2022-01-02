@RestResource(urlMapping='/LeadService/*')
global class LeadRestService {
    @httpget
    global static list<Lead> getleadInfo(){
          RestRequest req = RestContext.request;
          RestResponse res= RestContext.response;
          system.debug('req.requestURI'+ req.requestURI);
          String requestURI= req.requestURI;          
          String leadName = '%'+requestURI.substring(requestURI.lastIndexOf('=')+1)+'%';
          list<Lead> leadList=[select Id,Name,Email,Phone,Company,MobilePhone from Lead Where Name  like : leadName];
          return leadList;                
    } 
    @httpDelete
    global static string deleteMatchingLead(){
          string responseMessage; 
          integer leadCount = 0;
         try{
             
          RestRequest req = RestContext.request;
          RestResponse res= RestContext.response;
          system.debug('req.requestURI'+ req.requestURI);
          String requestURI = req.requestURI;
          String LeadName = '%'+requestURI.substring(requestURI.lastIndexOf('=')+1)+'%';
          list<Lead> leadList = [Select Id,Name,Email,Phone,Company,MobilePhone from Lead Where Name Like :LeadName];
          if(leadList!=null && leadList.size()>0){
            leadCount = leadList.size();
              
        }         
            delete leadList;  
        }
        catch(Exception e){
           responseMessage = 'Exception occured during delete =>'+ e.getMessage();
        }
           responseMessage = 'Lead deleted succcessfully => lead deleted count '+ leadCount;
           return responseMessage;
    }
    @httpPost
    global static string createLead(string fName,string lName,string cname,string leademail,string leadphoneNumber){
           string responseMessage ;
        try{
            lead l = new lead();  
            l.FirstName= fName;
            l.LastName=  lName;
            l.Company =  cname;
            l.Email= leademail;
            l.Phone= leadphoneNumber;
            insert l;
            responseMessage = 'Lead Created Successfully'+l.Id +l.FirstName +l.LastName;
        }
        catch(Exception e){
            responseMessage = 'Error Occour During The Lead Creation =>'+ e.getMessage();
        }
        return responseMessage;         
    }
    @httpPatch
    global static string updateLead(string newEmail){
       string responseMessage ;
        try{
             RestRequest req = RestContext.request;
             RestResponse res= RestContext.response;
             String requestURI = req.requestURI;
             string leadid = requestURI.substring(requestURI.lastIndexOf('=')+1);
             lead myLead  = [Select Id,email from lead where Id=:leadid];
             if(myLead!=Null && myLead.email !=newEmail){ 
                string oldemail = myLead.email;                  
                myLead.email = newEmail;
                responseMessage = 'lead Updated from Old Email to New Email'+ myLead.email + oldemail + 'With New email as'+newEmail;
            }
            else{
                responseMessage='CurrentIt Lead is Having Same Email Address'+ newEmail;
            }                       
        }
        catch(Exception e){
             responseMessage ='exception occour during lead update'+e.getMessage();            
        } 
            return responseMessage;
    }    
}