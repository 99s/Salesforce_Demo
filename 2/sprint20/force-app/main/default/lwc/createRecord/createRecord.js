// recordViewGetRecord.js
import { LightningElement,api,wire, track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
//import PHONE_FIELD from '@salesforce/schema/Account.Phone';
// import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
/* Wire  from '@salesforce/schema to fetch record dasta */
// import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// import ACCOUNT_OBJECT from '@salesforce/schema/Account';
// import NAME_FIELD from '@salesforce/schema/Account.Name';
// import OWNER_EMAIL_FIELD from '@salesforce/schema/Account.Owner.Email';
// import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
// import NAME_FIELD from '@salesforce/schema/Contact.Name';
// import TITLE_FIELD from '@salesforce/schema/Contact.Title';
// import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
// import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
// import ACCOUNT_OBJECT from '@salesforce/schema/Account';
// import NAME_FIELD from '@salesforce/schema/Account.Name';
// import WEBSITE_FIELD from '@salesforce/schema/Account.Website';




export default class createRecord extends LightningElement {
    // objectApiName = ACCOUNT_OBJECT;
    // nameField = NAME_FIELD;
    // @api recordId;
    // @api objectApiName; 

    // /* Load Account.Owner.Email for custom rendering */
    // @wire(getRecord, {
    //     recordId: "$recordId",
    //     fields: [OWNER_EMAIL_FIELD]
    //   })
    //   record;

    //   /* Get the Account.Owner.Email value. */
    //   get ownerField() {
    //     return this.record.data
    //       ? getFieldValue(this.record.data, OWNER_EMAIL_FIELD)
    //       : "";
    //   }
 
    
        // Flexipage provides recordId and objectApiName
        // @api recordId;
        // @api objectApiName;
    
        // fields = [ACCOUNT_FIELD, NAME_FIELD, TITLE_FIELD, PHONE_FIELD, EMAIL_FIELD];
// @api recordId;
// handleReset() {
//     const inputFields = this.template.querySelectorAll(
//         'lightning-input-field'
//     );
//     if (inputFields) {
//         inputFields.forEach(field => {
//             field.reset();
//         });
//     }
//  }
//  handleError(event){
//     console.log(event.detail);
//     this.dispatchEvent(
//         new ShowToastEvent({
//             title: 'Error creating record',
//             message: event.detail.message,
//             variant: 'error',
//         }),
//     );
// @api recordId;
// handleSubmit(event) {
//     console.log('onsubmit event recordEditForm'+ event.detail.fields);
// }
// handleSuccess(event) {
//     console.log('onsuccess event recordEditForm'+ event.detail.id);
// }
// handleSuccess(event) {
//     console.log('onsuccess event recordEditForm',event.detail.id);
// }
// handleSubmit(event) {
//     console.log('onsubmit event recordEditForm'+ event.detail.fields);
// }
    // accountObject = ACCOUNT_OBJECT;
    // nameField = NAME_FIELD;
    // websiteField = WEBSITE_FIELD;

    // handleAccountCreated(){
    //     // Run code when account is created.
    // }
    // myValue="My Account Name";
    // overrideValue(){
    //     this.myValue=" my new value";
    // }
    // @api recordId;
    // @api objectApiName;

    // @track objectInfo;

    // Define fields to display in form
    // Industry field is a picklist
    // fields = [NAME_FIELD, PHONE_FIELD, INDUSTRY_FIELD];

    // @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    // objectInfo;

    // get recordTypeId() {
    //     const rtis = this.objectInfo.data.recordTypeInfos;
    //     return Object.keys(rtis).find(rti => rtis[rti].name === 'Special Account');
    // }
    createStatus = '';

    accountObject = ACCOUNT_OBJECT;

    accountFields = [NAME_FIELD, WEBSITE_FIELD];

handleAccountCreated(evt) {
    this.createStatus = `Account record created. Id is ${evt.detail.id}.`;
    console.log('id is =====>',createStatus);

    const event = new CustomEvent('new record', {
        detail: { data: evt.detail },
    });
    this.dispatchEvent(event);
}


}