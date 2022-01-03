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
trigger CLoneLead on Lead (after insert) {
    switch on Trigger.OperationType {
        when AFTER_INSERT {
            List<Lead> dupLead = new List<Lead>();
            if(trigger.new!=null){
                for(Lead ld : trigger.new){
                    Lead leadRec = ld.clone(false);
                    dupLead.add(leadRec);
                }
            }  
            if(dupLead.size()>0){
                insert dupLead;        
            }                      
        }
    }
}