public class SOQLClass2 {
     public static void myMethod(string str){
        
        // SOQL VARIABLE Dynamic Binding
        // Comparing Static Value
        List<Contact> conList = [Select firstName,lastName,email from contact where firstName='John'];
        // Comparing Dynamic Value
        List<Contact> conList2=[Select firstName,lastName,email from Contact where firstName = :str];
        system.debug('conList2'+conList2);
         
        
        
        
        
        
    }
        
}