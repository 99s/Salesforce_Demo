/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-11-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-11-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger ContactCustomTriggerExample on Contact ( after insert ) {
     List<Account> accListToInsert = new List<Account>();
     for(Contact con : Trigger.New){
        if(con.AccountId==null){
            Account acc = new Account();
            acc.Name=con.LastName;
            acc.Phone=con.Phone;
            accListToInsert.add(acc);
        }


     }
     if(!accListToInsert.isEmpty()){
         insert accListToInsert;
     }



    
}