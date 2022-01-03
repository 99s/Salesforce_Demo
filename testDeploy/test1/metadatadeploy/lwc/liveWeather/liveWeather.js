/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-24-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,track
} from 'lwc';
import getWeather from '@salesforce/apex/weatherController.getWeather';

export default class LiveWeather extends LightningElement {

    @track city = '';
    @track temparature = '';
    error;
    onCityChange(event) {
        this.city = event.target.value;
        console.log('city------------->'+ this.city );

    }
    getTemp(event) {
        if (this.city != null || this.city != '') {
            getWeather({
                    city: this.city
                })
                .then(result => {
                    console.log('result----->'+result);
                    this.temparature = result;
                    //console.log('result------->' + this.temparature);
                }).catch(error => {
                    this.error = error;
                });

        } else {
            alert('please enter valid city!!!!!!')

        }

    }

}