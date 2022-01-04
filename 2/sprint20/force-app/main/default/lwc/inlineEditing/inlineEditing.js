import { LightningElement, wire,api, track } from 'lwc';
import getContactList from '@salesforce/apex/getContact.getContactList';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import ID_FIELD from '@salesforce/schema/Contact.Id';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getContactDetails from '@salesforce/apex/getContact.getContactDetails';
// import getRecords from '@salesforce/apex/getContact.getRecords';
// import getFieldDetails from '@salesforce/apex/getContact.getFieldDetails';



const COLS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Title', fieldName: 'Title',editable:true },
    { label: 'Phone', fieldName: 'Phone', editable: true },
    { label: 'Email', fieldName: 'Email', editable: true}
];
export default class DatatableUpdateExample extends LightningElement {
    @track data;
   
    @track error;
    @track columns = COLS;
    @track data1;
    @api recordId;
    @track draftValues = [];
    @api objectApiName;
    @api fieldApiName;
    @api iconName;
    @track error;
    @track records;

    @wire(getContactList)
    contact;

    handleSave(event) {

        const fields = {};
        fields[ID_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
        fields[FIRSTNAME_FIELD.fieldApiName] = event.detail.draftValues[0].FirstName;
        fields[LASTNAME_FIELD.fieldApiName] = event.detail.draftValues[0].LastName;
        fields[TITLE_FIELD.fieldApiName] = event.detail.draftValues[0].Title;
        fields[PHONE_FIELD.fieldApiName] = event.detail.draftValues[0].Phone;
        fields[EMAIL_FIELD.fieldApiName] = event.detail.draftValues[0].Email;

        const recordInput = {fields};

        updateRecord(recordInput)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message:"data saved successfully",
                    variant: 'success'
                })
            );
            // Clear all draft values
            // const recordInputs =  event.detail.draftValues.slice().map(draft => {
            //     const fields = Object.assign({}, draft);
            //     return { fields };
            // });
        
            // const promises = recordInputs.map(recordInput => updateRecord(recordInput));
            // Promise.all(promises).then(data1 => {
            //     this.dispatchEvent(
            //         new ShowToastEvent({
            //             title: 'Success',
            //             message: 'Contacts updated',
            //             variant: 'success',
            //             mode:'dismissable'
            //         })
            //     );
            // Display fresh data in the datatable
            return refreshApex(this.data1).then(() => {
            this.draftValues = [];

            // Display fresh data in the datatable
            });
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                    mode:'dismissable'
                })
            );
        });
    }
    @track error;
    //@track tableLoadingState = true;
   
    @track rowOffset = 0;
    @track offset = 0;
    @track Prevoffset = 0;
    limit = 10;

    @wire(getContactDetails, {
        offset: '$offset',
        l: '$limit'
    })
    wiredAccounts({
        error,
        data


    }) {
        if (data) {
            this.data1 = data;
            this.error = undefined;
            this.casesSpinner = false;
            this.tableLoadingState = false;
            if (this.data1.length == 0)
                this.offset = this.Prevoffset;
            // if (!this.dtLoading) {
            //     this._tableHeight = 'height: 180px;';
            // }
            //console.log('data=====>',this.data1);
        } else if (error) {
            this.error = error;
            this.data1 = undefined;
            this.dtLoading = true;
            //this.tableLoadingState =false ;

        }
    }

    handlePrev(_event) {

        if (this.offset - this.limit >= 0) {
            this.tableLoadingState = false;
            this.Prevoffset = this.offset;
            this.offset = this.offset - this.limit;
        }
    }
    handleNext(_event) {

        this.tableLoadingState = false;
        this.Prevoffset = this.offset;
        this.offset = this.offset + this.limit;
    }
    
  


}