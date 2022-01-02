import { LightningElement } from 'lwc';

export default class HelloWebComponent extends LightningElement {
    textToUpdate = '-Trailblazer-';
      currentDate = new Date().toDateString();
        get capitalizedGreeting() {
            return `Hello ${this.textToUpdate.toUpperCase()}!`;
        }
    handleGreetingChange(event){
        this.textToUpdate = event.target.value;

      


    }
    
}