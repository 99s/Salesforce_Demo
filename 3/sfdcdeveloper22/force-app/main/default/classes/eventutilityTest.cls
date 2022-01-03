@isTest
public class eventutilityTest {
    @isTest  
    private static void testeventstatuslength(){
        string res = eventUtility.eventPriority('ind');
        system.assertEquals(null, res);            
    } 
    @isTest
    private static void testhighpri(){
        string res = eventUtility.eventPriority('CA');
        system.assertEquals('High',res );
        
    }
    @isTest
    private static void testmediumpri(){
        string res = eventUtility.eventPriority('NA');
        system.assertEquals('Medium', res);
                                                                             
 }
                                                                                
}