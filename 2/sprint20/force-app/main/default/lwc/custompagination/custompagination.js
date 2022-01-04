import { LightningElement } from 'lwc';

export default class custompagination extends LightningElement {


    handlePrev(_event) {
        debugger;
        this.dispatchEvent(new CustomEvent('previous'));
    }

    handleNext(_event) {
        this.dispatchEvent(new CustomEvent('next'));
    }








}