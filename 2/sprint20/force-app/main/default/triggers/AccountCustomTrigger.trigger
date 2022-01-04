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
trigger AccountCustomTrigger on Account ( before insert , before update ) {
    for(Account acc : Trigger.New) {
        if(acc.Industry != null && (acc.Industry == 'Banking' || acc.Industry == 'Healthcare')){
         acc.Rating = 'Hot';
        }
    }


     }