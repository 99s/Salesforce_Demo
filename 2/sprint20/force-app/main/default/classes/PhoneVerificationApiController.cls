/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-10-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-10-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public class PhoneVerificationApiController {
        @invocableMethod(Label='Verify Mobile No' Description='Make API Call to PhoneVerification API')
        public static list<String> verifyPhoneNumber(list<String> mobileNumbers){
            phoneVerification.PhoneResponse mobileResponse = phoneVerification.InvokeVeriphoneApi(mobileNumbers[0]);
            return new list<String> {mobileResponse.phone_valid};
    }         
}