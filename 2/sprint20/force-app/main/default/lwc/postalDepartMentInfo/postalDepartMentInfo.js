/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-08-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
 **/
import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';
import postOfficeByPincode from '@salesforce/apex/postalDepartmentApi.postOfficeByPincode';

export default class PostalDepartMentInfo extends LightningElement {
    @track strSearchAccName;
    @track accList;
    searchValue = '';

    @track columns = [{
            label: 'Name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Description',
            fieldName: 'Description',
            type: 'text',
            sortable: true
        },
        {
            label: 'PINCode',
            fieldName: 'PINCode',
            type: 'text',
            sortable: true
        },
        {
            label: 'BranchType',
            fieldName: 'BranchType',
            type: 'text',
            sortable: true
        },
        {
            label: 'DeliveryStatus',
            fieldName: 'DeliveryStatus',
            type: 'text',
            sortable: true
        },
        {
            label: 'Circle',
            fieldName: 'Circle',
            type: 'text',
            sortable: true
        },
        {
            label: 'District',
            fieldName: 'District',
            type: 'text',
            sortable: true
        },
        {
            label: 'Division',
            fieldName: 'Division',
            type: 'text',
            sortable: true
        },
        {
            label: 'Region',
            fieldName: 'Region',
            type: 'text',
            sortable: true
        },
        {
            label: 'State',
            fieldName: 'State',
            type: 'text',
            sortable: true
        },
        {
            label: 'Country',
            fieldName: 'Country',
            type: 'text',
            sortable: true
        },
    ];

    handleKeyPinCode(event){
        this.strSearchAccName = event.detail.value;
        console.log('strName-------->'+this.strSearchAccName);
        
    }   
    handleClick() {
        //console.log('ok');
        if (this.searchValue !== '')  {
            postOfficeByPincode({
                pincode: this.searchValue
            })
            .then(result => {
                console.log('result'+json.stringify(result));
                this.accList = result;
            })
            .catch(error => { 
                console.log('error--------->');             
                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: 'error',
                    message: error.body.message,
                });
                this.dispatchEvent(event);
                // reset contacts var with null   
                this.accList = null;
            });
    } else {
        // fire toast event if input field is blank
        const event = new ShowToastEvent({
            variant: 'error',
            message: 'Search text missing..',
        });
        this.dispatchEvent(event);
    }
  }
}