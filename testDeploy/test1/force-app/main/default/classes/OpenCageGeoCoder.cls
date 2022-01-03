public class OpenCageGeoCoder {

      public results[] results;
      public status status;
     
    public class results {
        public components components;
        public Integer confidence;
        public String formatted;
        public geometry geometry;        
    }
    public class components {
         public string city;
         public string continent;
         public string country;
         public string country_code;
         public string postcode;
         public string resturant;
         public string road;
         public string state;
         public string subrub;                
}
    public class geometry {
         public double lat;
         public double lng;        
    }
    public class status {
         public integer code;
         public string message;
    }       
}