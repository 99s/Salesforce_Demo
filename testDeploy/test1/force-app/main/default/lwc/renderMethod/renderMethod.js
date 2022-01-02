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
import signInRenderTemplate from './signInRenderTemplate.html';
import signUpRenderTemplate from './signUpRenderTemplate.html';
import renderTemplate from './renderMethod.html';

export default class RenderMethod extends LightningElement {
    selectedBtn = '';
    render() {
        return this.selectedBtn === 'signUp' ? signUpRenderTemplate :
            this.selectedBtn === 'signIn' ? signInRenderTemplate :
            renderTemplate
    }
    handleClick(event) {
        this.selectedBtn = event.target.label;
    }
    submitHandler(event) {
        console.log(`${event.target.label} Successfully!!!!!!`);
    }
}