/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-24-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,
    api
} from 'lwc';

export default class SetterDemoChild extends LightningElement {
    userDetails;
    @api
    get detail() {
        return userDetails

    }
    set detail(data) {
        let newAge = data.age*2;        
        this.userDetails = {...data,age:newAge}

    }

}