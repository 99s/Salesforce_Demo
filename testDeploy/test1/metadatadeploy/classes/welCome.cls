@RestResource(urlMapping='/v1/Welcome/*')
global with sharing class welCome {
       
    global Final Static String Welcome_Message = 'Welcome To SFDCPANTHAR INTEGRATION';
    
    @httpGet
    global static string greetingMessage(){
         return Welcome_Message;                        
    }
    @httpPost
    global static string postGreetInMessage(){
        return Welcome_Message;                      
    } 
    @httpPatch
    global static string patchGreetingMessage(){
         return Welcome_Message  + 'UPDATE WITH PATCH';
    }
}