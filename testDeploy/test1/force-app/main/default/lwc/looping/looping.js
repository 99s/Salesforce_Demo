/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-01-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';

export default class Looping extends LightningElement {

    carList = ['Ford', 'Audi', 'Maruti', 'Hyundai', 'Mercedes'];

    ceoList = [

        {
            id: 1,
            company: 'Google',
            name: 'sundar pichai'
        },
        {
            id: 2,
            company: 'Apple Inc',
            name: 'Tim Cock'
        },
        {
            id: 3,
            company: 'facebook',
            name: 'mark zukarbarg'
        },
        {
            id: 4,
            company: 'amazon',
            name: 'jeff bezos'
        }
    ]
}