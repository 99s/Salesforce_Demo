@isTest
public class testTrigger {
    
    @isTest
    static void testTrigger(){
        List<account> accList = new List<account>();
        for(integer i=0;i<=100;i++)
        {
           accList.add(new account(name='test account'+i)); 
                     
        }
        insert accList;
        
        list<account> accList2 =[select id,name,numberofemployees from account ];
        for(account a:accList2)
        {
            system.debug('---------->'+a.Id+'-------'+a.Name+'-------'+a.numberofemployees);
            
        }
                
    }   
}