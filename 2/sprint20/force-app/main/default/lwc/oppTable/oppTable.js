import { LightningElement,track,wire,api } from 'lwc';
import getOpps from '@salesforce/apex/OppTableContoller.getOpportunities';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ID_FIELD from '@salesforce/schema/Opportunity.Id';
import Name_FIELD from '@salesforce/schema/Opportunity.Name';
import Type_FIELD from '@salesforce/schema/Opportunity.Type';
import StageName_FIELD from '@salesforce/schema/Opportunity.StageName';
import Amount_FIELD from '@salesforce/schema/Opportunity.Amount';
import CloseDate_FIELD from '@salesforce/schema/Opportunity.CloseDate';



const columns = [
    { label:'Opportunity Name', fieldName: 'oppLink', type: 'url', typeAttributes: {label: {fieldName: 'Name'}, tooltip:'Go to detail page', target: '_blank'},editable: true},
    { label: 'Type', fieldName: 'Type', type: 'text',editable: true },
    { label: 'Stage', fieldName: 'StageName', type: 'text',editable: true },
    { label: 'Amount', fieldName: 'Amount', type: 'currency', cellAttributes: { alignment: 'left' },editable: true },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date', typeAttributes:{timeZone:'UTC', year:'numeric', month:'numeric', day:'numeric'},editable: true},
];

export default class OppTable extends LightningElement {
    @track error;
    @track columns = columns;
    @track opps; //All opportunities available for data table    
    @track showTable = false; //Used to render table after we get the data from apex controller    
    @track recordsToDisplay = []; //Records to be displayed on the page
    @track rowNumberOffset; //Row number
    @api recordId;
    draftValues = [];


    @wire(getOpps)
    wopps({error,data}){
        if(data){
            let recs = [];
            for(let i=0; i<data.length; i++){
                let opp = {};
                opp.rowNumber = ''+(i+1);
                opp.oppLink = '/'+data[i].Id;
                opp = Object.assign(opp, data[i]);
                recs.push(opp);
            }
            this.opps = recs;
            this.showTable = true;
        }else{
            this.error = error;
        }       
    
  
    }    
    handleSave(event) {

        const fields = {};  
        fields[ID_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
        fields[Name_FIELD.fieldApiName] = event.detail.draftValues[0].Name;
        fields[Type_FIELD.fieldApiName] = event.detail.draftValues[0].Type;
        fields[StageName_FIELD.fieldApiName] = event.detail.draftValues[0].StageName;
        fields[Amount_FIELD.fieldApiName] = event.detail.draftValues[0].Amount;
        fields[CloseDate_FIELD.fieldApiName] = event.detail.draftValues[0].CloseDate;


        const recordInput = {fields};

        updateRecord(recordInput)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Opportunity updated',
                    variant: 'success'
                })
            );
            // Display fresh data in the datatable
            return refreshApex(this.recordsToDisplay).then(() => {

                // Clear all draft values in the datatable
                this.draftValues = [];

            });
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or reloading record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });
    }


      //Capture the event fired from the paginator component
      handlePaginatorChange(event){
        this.recordsToDisplay = event.detail;
        this.rowNumberOffset = this.recordsToDisplay[0].rowNumber-1;
    }
   

















    
}