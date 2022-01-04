@isTest
public class testClass4 {
    static testMethod void 	testBeforeInsertMethod()
    {
        // first we will prepare test data
        
        List<product2> pList = new List<product2>();
        
        for(integer i=0;i<200;i++)
        {
            product2 p = new product2(Name='NewProduct1');
            pList.add(p);            
        } 
        // now we will insert data which will fire the product trigger
        Test.startTest();
        insert pList;
        Test.stopTest();
    }    
}