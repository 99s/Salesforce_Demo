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

export default class HelloQuerySelectorDemo extends LightningElement {

    userName = ["john", "smith", "nik", "mike", "tony"];
    fetchDetailHandler() {
        const elem = this.template.querySelector('h1');
        elem.style.border = "1px solid red";
        const userElement = this.template.querySelectorAll('.name'); 
        console.log(elem.innerText);
        Array.from(userElement).forEach(item => {
            console.log(item.innerText);
            item.setAttribute('title',item.innerText)
        })
    
   // lwc:dom = "manual Demo"
       const childElem = this.querySelector('./child');
       childElem.innerHTML='<p>Hey I am a Child eleement</p>';
    }

}