/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-31-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';

export default class HelloConditionalRendering extends LightningElement {

    isVisible = false;
    name;
    handleClick() {
        alert('ok');
        this.isVisible = true;

    }
    get helloMethod() {
        return this.name === 'hello';
    }
}