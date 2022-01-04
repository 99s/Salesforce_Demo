@RestResource(urlMapping='/LeadCreate/')
global class LeadClassCallIn {
    @HttpPost
    global static string doPost(){
        String fieldValue;
        String fieldName;
        String fName;
        String lName;
        String comp;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        system.debug('Param----->'+req.params);
        system.debug('Param------->'+req.requestBody);
        
        string arr = req.requestBody.toString();
        JSONParser parser = JSON.createParser(arr);
        
        while(parser.nextToken()!=null){
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT)
            {
                parser.nextToken();
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName=='First Name'){
                    fName= parser.getText();                    
                }
                else if(fieldName == 'Last Name'){
                    lName = parser.getText();                                        
                }
                else if(fieldName=='Company'){
                     comp=parser.getText();                    
                }                                
            }                      
        }        
        Lead lc = new Lead(FirstName=fName,LastName=lName,Company=comp);           
        insert lc;
        
        return lc.Id;
                         
    }       
}