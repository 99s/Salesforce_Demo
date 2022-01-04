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

export default class LifeCycleParent extends LightningElement {

    name;
    isChildVisible = false;
    constructor() {
        super()
        console.log('parent constructor');
    }
    connectedCallback() {
        console.log('parent connectedCallback constructor');
    }
    renderedCallback() {
        console.log('parent renderedCallback constructor');

    }
    changeHandler(event) {
        this.name = event.target.value;
        console.log(this.name);
    }
    handleClick() {
        this.isChildVisible = true;
    }
    disconnectedCallback() {
        alert('child disconnected call back called');
    }
}