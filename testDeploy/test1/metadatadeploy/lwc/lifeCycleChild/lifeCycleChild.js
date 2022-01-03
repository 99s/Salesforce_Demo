/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-02-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';

export default class LifeCycleChild extends LightningElement {

    constructor() {
        super()
        console.log('child constructor');

    }
    interval
    connectedCallback() {
        console.log('child connectedCallback constructor');
        this.interval = window.setInterval();
        window.addEventListener('click', this.handleClick);
        throw new Error('Loading of Child component failed');
    }
    renderedCallback() {
        console.log('child renderedCallback constructor');

    }
    disconnectedCallback() {
        alert('child disconnected call back called');
        window.removeEventListener('click', this.handleClick);
        window.clearInterval(interval);
    }
}