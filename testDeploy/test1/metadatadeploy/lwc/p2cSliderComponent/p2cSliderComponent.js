/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,api
} from 'lwc';

export default class P2cSliderComponent extends LightningElement {

    val = 20;

    changeHandler(event){
         this.val=event.target.value; 
         console.log('value --------->'+this.val);
    }
    @api resetSlider(){
        this.val=50;

    }
}