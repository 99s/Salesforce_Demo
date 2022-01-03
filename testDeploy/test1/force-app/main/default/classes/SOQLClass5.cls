public class SOQLClass5 {
     public static void myMethod(){
         
         List<String> nameList = new List<String>{'John','Max','Jeff'};
         List<Contact> conList = [select Id,firstName,lastName,email from Contact where name IN :nameList];
         
         Set<ID> idSet = new Set<ID>{'000001234','00000156'};
         List<Contact> conList2 = [select Id,firstName,lastName,email from Contact where ID IN:idSet];
         
         // not
         List<Contact> conList1 =[select firstname,lastname,email from Contact where ID NOT IN:nameList];
         
         List<Contact> conList3 = [select firstname,lastname,email from Contact where ID NOT IN:idSet];
        
        
        
        
        
        
        
        
        
        
        
        
    }     
}