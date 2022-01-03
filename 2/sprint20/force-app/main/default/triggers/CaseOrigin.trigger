/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-03-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-03-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger CaseOrigin on Case (before insert) {
    if(trigger.new!=null){
        for(Case c : trigger.new){ 
           if(c.origin =='Email'){
              c.status = 'New';
              c.priority = 'Medium';
           }
       }
   }
}