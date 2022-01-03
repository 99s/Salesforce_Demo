public class SOQLClass4 {
    public static void myMethod(){
        // sum
        aggregateResult arl =[Select SUM(Amount) from Opportunity];
        system.debug('aggregateResult'+arl);         
        // max
        aggregateResult ar2=[Select MAX(Amount) from Opportunity];
        system.debug('ar2----->'+ar2); 
        // count
        integer i=[Select Count() from Opportunity];
        system.debug('count is ------>'+i);
        
        AggregateResult ar3 = [Select Count(Id) from Opportunity];
        system.debug('count --------->'+ar3);
        // avg amount
        AggregateResult ar5 =[Select Avg(Amount) from Opportunity];
        system.debug('ar5------->'+ar5);
        // aggregate result
        AggregateResult ar7 = [Select Count_Distinct(Amount) from Opportunity];
        Integer i2 = (Integer)ar7.get('expr0');                       
    }        
}