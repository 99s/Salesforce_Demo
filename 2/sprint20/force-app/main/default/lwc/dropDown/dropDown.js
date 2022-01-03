import { LightningElement,track, wire } from 'lwc';
// import ProductsList from '@salesforce/apex/AddEditLineItemController.ProductsList';
// import SystemDetails from '@salesforce/apex/AddEditLineItemController.SystemDetails';
// import EquipmentList from '@salesforce/apex/AddEditLineItemController.EquipmentList';


export default class DropDown extends LightningElement {

    @track columns = [
        {
                    label: 'View',
                    type: 'button',
                    initialWidth: 100,
                    typeAttributes: {
                        label: 'View',
                        title: 'View',
                        variant: 'base',
                        alternativeText: 'View',
                        target:'_blank',
                        sortable:true
                    }
                },
                { label: 'Name', fieldName: 'name', type:'text',sortable:true},
                { label: 'Item_Number__c', fieldName: 'Item_Number__c', type: 'text',sortable:true},
                { label: 'Bundle_Type__c', fieldName: 'Bundle_Type__c', type: 'text',sortable:true},
                { label: 'Item__c', fieldName: 'Item__c', type: 'text',sortable:true },
                { label: 'Item__r.name', fieldName: 'Item__r.name', type: 'text',sortable:true },
                { label: 'Bundle_Type__r.Name', fieldName: 'Bundle_Type__r.Name', type: 'text',sortable:true },
               
            ];
            
      
    activeSectionMessage = '';
    isDVisible = false;

    handleToggleSection() {
      //this.activeSectionMessage ='';
          //'Open section name:  ' + event.detail.openSections;
  }

  handleToggleSectionD() {
      this.isDVisible = !this.isDVisible;
      
  }

  get isMessageVisible() {
      return this.activeSectionMessage.length > 0;
  }
 
   
}