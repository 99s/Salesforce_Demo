@isTest
public class AnimalLocatorTest {
     static testMethod void testPostCallout(){
           Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
           String strRep = AnimalLocator.getAnimalNameById(2);
           system.debug('strRep'+strRep);        
    }     
}