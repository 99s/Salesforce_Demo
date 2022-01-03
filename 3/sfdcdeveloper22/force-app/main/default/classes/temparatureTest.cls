@isTest
public class temparatureTest {

    @isTest
    private static void warmTest()
    {
         Decimal result = temparature.Ftoc(70);
         system.assertEquals(21.11,result );
              
    }    
}