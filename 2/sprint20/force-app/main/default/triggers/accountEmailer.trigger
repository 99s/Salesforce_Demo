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
trigger accountEmailer on Account (before insert, before update, after update) {
 
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('I am in before insert Context');
                
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc :Trigger.new){
                System.debug('New Name : '+ acc.Name);
                System.debug('Old Name : '+ Trigger.oldMap.get(acc.Id).Name);
            
        }
      
    }
   }  



}