import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';
// import { createRecord } from 'lightning/uiRecordApi';
// import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import ACCOUNT_OBJECT from '@salesforce/schema/Account';
// import NAME_FIELD from '@salesforce/schema/Account.Name';
// import { getRecord } from 'lightning/uiRecordApi';
// import { getPicklistValues } from 'lightning/uiObjectInfoApi';

// import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
// import LASTNAME_FIELD from  '@salesforce/schema/Contact.LastName';
// import SALUTATION_FIELD from '@salesforce/schema/Contact.Salutation';
import {
    getFieldValue,
    getRecord
} from 'lightning/uiRecordApi';
import ACC_BillingCity from '@salesforce/schema/Account.BillingCity';
import ACC_BillingStreet from '@salesforce/schema/Account.BillingStreet';
import ACC_BillingState from '@salesforce/schema/Account.BillingState';
import ACC_BillingPostalCode from '@salesforce/schema/Account.BillingPostalCode';
import ACC_BillingCountry from '@salesforce/schema/Account.BillingCountry';




// const FIELDS = [
//     'Contact.Name',
//     'Contact.Title',
//     'Contact.Phone',
//     'Contact.Email',

// ];
// const fields = [
//     // This invalid field causes @wire(getRecord) to return an error
//     'Contact.invalidField' 
// ];
// const namefields = [ FIRSTNAME_FIELD, LASTNAME_FIELD, SALUTATION_FIELD ];
const FIELDS = [ACC_BillingCity, ACC_BillingStreet, ACC_BillingState, ACC_BillingPostalCode, ACC_BillingCountry];



export default class WireService extends LightningElement {

    @api recordId;
    @track showStaticMap = true;

    // @wire(getRecord, {
    //     recordId: '$recordId',
    //     fields: FIELDS
    // })
    // contact;

    // get name() {
    //     return this.contact.data.fields.Name.value;
    // }
    // get title() {
    //     return this.contact.data.fields.Title.value;
    // }
    // get phone() {
    //     return this.contact.data.fields.Phone.value;
    // }
    // get email() {
    //     return this.contact.data.fields.Email.value;
    // }

    // accountId;
    // name = '';

    // handleNameChange(event) {
    //     this.accountId = undefined;
    //     this.name = event.target.value;
    // }
    // createAccount() {
    //     const fields = {};
    //     fields[NAME_FIELD.fieldApiName] = this.name;
    //     const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
    //     createRecord(recordInput)
    //         .then(account => {
    //             this.accountId = account.id;
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Success',
    //                     message: 'Account created',
    //                     variant: 'success',
    //                 }),
    //             );
    //         })
    //         .catch(error => {
    //             this.dispatchEvent(
    //                 new ShowToastEvent({
    //                     title: 'Error creating record',
    //                     message: error.body.message,
    //                     variant: 'error',
    //                 }),
    //             );
    //         });
    // }


    // @track error;

    // @wire(getRecord, { recordId: '$recordId', fields })
    // wiredRecord({error, data}) {
    //     if (error) {
    //         this.error = 'Unknown error';
    //         if (Array.isArray(error.body)) {
    //             this.error = error.body.map(e => e.message).join(', ');
    //         } else if (typeof error.body.message === 'string') {
    //             this.error = error.body.message;
    //         }
    //         this.record = undefined;
    //     } else if (data) {
    //         // Process record data
    //     }
    // }


    // @wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: SALUTATION_FIELD })
    // salutationValues;

    // @wire(getRecord, { recordId: '$recordId', fields: namefields })
    // contact;

    // get firstname() {
    //     return this.contact.data.fields.FirstName.value;
    // }

    // get lastname() {
    //     return this.contact.data.fields.LastName.value;
    // }

    // get salutation() {
    //     return this.contact.data.fields.Salutation.value;
    // }

    // // creates the options array for lightning-input-name
    // get salutations() {
    //     let salutationOptions = [];
    //     Object.entries(this.salutationValues.data.values).forEach(val => {
    //         let values = val[1];
    //         salutationOptions.push({ 'label': values.label, 'value': values.value });
    //     }); 
    //     return salutationOptions;
    // }
   
  

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

    get street() {
        return this.contact.data.fields.MailingStreet.value;
    }

    get city() {
        return this.contact.data.fields.MailingCity.value;
    }

    get state() {
        return this.contact.data.fields.MailingState.value;
    }

    get country() {
        return this.contact.data.fields.MailingCountry.value;
    }

    get postal() {
        return this.contact.data.fields.MailingPostalCode.value;
    }



















}