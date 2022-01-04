import { LightningElement, wire,track,api } from 'lwc';
import getAccounts from '@salesforce/apex/DynamicTreeStructure.getAccounts';

export default class Dynamic_Tree_Structure extends LightningElement {
  @api recordId;
  @wire(getAccounts,{RecordId:'$recordId'})
  accounts;

  
  @track isModalOpen = false;
  //@api isLoaded = false;
  openModal() {
      // to open modal set isModalOpen tarck value as true
      this.isModalOpen = true;
      //this.isLoaded = !this.isLoaded;
  }
  closeModal() {
      // to close modal set isModalOpen tarck value as false
      this.isModalOpen = false;
  }
  submitDetails() {
      // to close modal set isModalOpen tarck value as false
      //Add your code to call apex method or do some processing
      this.isModalOpen = false;
  }



}