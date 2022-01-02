import {
    LightningElement,
    wire,

} from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

import {
    publish,
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext

} from 'lightning/messageService';


export default class LmsPublisherWebComponent extends LightningElement {

    @wire(MessageContext)
    messageContext;

    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                recordSelected,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

















}