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
//Write a trigger, only system admin user should be able to delete the task.
trigger DeleteCheck on task (before delete) {
    Id profileid=Userinfo.getProfileId();  
    profile profilname=[select Name from Profile where id=:profileid];
      for(Task accountDuplicate:Trigger.old){
          if(profilname.Name!='System Administrator'){
            accountDuplicate.addError('No Access for Deletion');                                    
         }
                              
       }
    }