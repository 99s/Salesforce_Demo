import {
    LightningElement,
    wire,
} from 'lwc';

import getContactList from '@salesforce/apex/ContactController.getContactList';
import {
    getSObjectValue
} from '@salesforce/apex';

import NAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

//const DELAY= 140;
export default class ApexWireMethodToProperty extends LightningElement {

    @wire( getContactList ) contact;
    // searchKey = '';

    // @wire(getContactList, {
    //     searchKey: '$searchKey'
    // })
    // contacts;

    // handleKeyChange(event){
    //     window.clearTimeout(this.delayTimeout);
    //     const searchKey=event.target.value;
    //     console.log('serachkey is=====> '+ searchKey );
    //     this.delayTimeout = setTimeout(() => {
    //         this.searchKey = searchKey;
    //     }, DELAY);

    // contacts;
    // error;
    // @wire(getContactList)
    //  wiredContacts({error,data}){
    //      if(data){
    //          this.contacts = data;
    //          this.error = undefined;
    //      }
    //      else if(error) {
    //          this.contacts = undefined;
    //          this.error = error;
    //      }
    //  }
    // contacts;
    // error;
    // handleLoad(){
    //     getContactList()
    //     .then(result=>{
    //         this.contacts=result;

    //     })
    //     .catch(error=>{
    //         this.contacts=error;
    //     });
    // }
    get name() {
        return this.contact.data ? getSObjectValue(this.contact.data, NAME_FIELD) : '';
    }
    get title() {
        return this.contact.data ? getSObjectValue(this.contact.data, TITLE_FIELD) : '';
    }
    get email() {
        return this.contact.data ? getSObjectValue(this.contact.data, EMAIL_FIELD) : '';
    }


}