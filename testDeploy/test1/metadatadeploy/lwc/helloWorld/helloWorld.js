/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-31-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,
    track
} from 'lwc';

export default class HelloWorld extends LightningElement {

    fullname = "salesforce troops";
    title = "lwc";

    //method
    cahngeHandler(event) {
        this.title = event.target.value;
        console.log('value is-------->' + this.title);
    }
    address = {
        city: 'kolkata',
        postcode: 3038,
        country: 'india'
    }
    trackHandler(event) {
        this.address = {
            ...this.address,
            'city': event.target.value
        }
    }
    user = ["john", "smit", "nik"];
    num1 = 10;
    num2 = 20;

    get firstUser() {
        return this.user[0].toUpperCase();
    }

    get multiply() {
        return this.num1 * this.num2
    }


}