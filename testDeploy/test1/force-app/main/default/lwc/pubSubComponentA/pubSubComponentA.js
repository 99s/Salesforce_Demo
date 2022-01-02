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

export default class PubSubComponentA extends LightningElement {
    message;
    inputHandler(event) {
        this.message = event.target.value;
    }
    publishHandler() {
        pubSub.publish('componentA', this.message)
    }
}