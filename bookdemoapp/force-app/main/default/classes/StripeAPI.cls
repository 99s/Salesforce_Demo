global class StripeAPI {
    
   
    
    public static String PublicApiKey{
        get{
            return 'pk_test_51KDvfPSFJItYtAEAVvFPOGo1oP2l7HyGVITD77yQaP1thXshLuzAoZHelbcaJPi6tFw7B8s8wX2KGubsOIIjY7Sv00aFoRxIHT';
        }
        private set;
    }
    public static String PrivateApiKey{
        get{
            return 'sk_test_51KDvfPSFJItYtAEAHJoUxmNuugnA1qrLEazWczfOxt0hjnVqriMDuX0KVEetGaeIlIetLNQGSSkZUU5KaHsG2qyD005RCYfaJs';
        }
        private set;
    }
    public static String StripeAPICustomerUrl{
        get{
            return 'https://api.stripe.com/v1/customers';
        }
        private set;
    }
    public static String StripeAPIChargeUrl{
        get{
            return 'https://api.stripe.com/v1/charges';
        }
        private set;
    }
}
