/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';
import pubSub from 'c/pubSub';

export default class PubSubComponentB extends LightningElement {
    message;
    connectedCallback() {
        this.callSubscriber();
    }
    callSubscriber() {
        pubSub.subscribe('componentA', (message)=> {
            this.message = message;
            console.log('message--------->'+this.message);
        })
    }
}