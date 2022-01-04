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

export default class C2pModalComponent extends LightningElement {

    showModal = false
    // clickHandler() {
    // const myEvent = new CustomEvent('close');
    // this.dispatchEvent(myEvent);
    // }
    closeHandler() {

        const myEvent = new CustomEvent('close', {
            bubble: true,
            detail: "modal closed successfully!!!!!"
        })
        this.dispatchEvent(myEvent);
    }
    footerHandler() {
        console.log('footerHandler called');
    }
}