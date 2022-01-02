/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-24-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   11-24-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class TreeStructure {
    @AuraEnabled public String label;
    @AuraEnabled public String name;
    @AuraEnabled public Boolean expanded;
    @AuraEnabled public List<TreeStructure> items;
    public TreeStructure(String label, String name, Boolean expanded, List<TreeStructure> items){
        this.label = label;
        this.name = name;
        this.expanded = expanded;
        if(items != null && items.size() > 0){
            this.items = items;
        }else{
            this.items = new List<TreeStructure>();
        }
    }







    
}