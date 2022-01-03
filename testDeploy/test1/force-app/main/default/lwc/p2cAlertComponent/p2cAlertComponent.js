/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-03-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,
    api
} from 'lwc';

export default class P2cAlertComponent extends LightningElement {
    @api message;
    @api number;
    @api isvalid;
    
  
}