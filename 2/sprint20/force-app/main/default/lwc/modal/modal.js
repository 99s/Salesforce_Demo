import {
  LightningElement,
  api,
  wire
} from 'lwc';
import { getRecord, getFieldValue} from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from'@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';

export default class Modal extends LightningElement {
  @api recordId;

  accountObject=ACCOUNT_OBJECT;

  @wire(getRecord,{recordid:'$recordId',fields:[NAME_FIELD]})
  record;

  get nameValue(){
    return this.record.data?getFieldValue(this.record.data,NAME_FIELD):'';
  }
 








}