public class temparature {
    public static decimal Ftoc(Decimal fh){
          Decimal result = (fh-32)*5/9;
          return result.setScale(2);
        
               
    }
    
}