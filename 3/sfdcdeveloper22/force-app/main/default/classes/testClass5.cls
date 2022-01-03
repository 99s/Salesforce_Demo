@isTest(SeeAllData=true)
public class testClass5 {
    
    static testmethod void testMethodFirst()
    {
        contact obj = [select id,name from contact where name='test' limit 10];
        
    }
    @isTest(SeeAllData=false)
    static void testmethodSecond()
    {
        contact obj1 = [select id,name from contact where name='test' limit 10];
        
        
    }
    
}