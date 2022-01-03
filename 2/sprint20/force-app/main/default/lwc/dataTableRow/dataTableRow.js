import {
    LightningElement,
    wire,
    track,
    api
} from 'lwc';
//import fetchAccounts from '@salesforce/apex/dataTableLwc.fetchAccounts';
import getAccountList from  '@salesforce/apex/TestApex.getAccountList';
 
// Declaring the columns in the datatable
 columns = [{
    label: 'Account name',
    fieldName: 'Name',
    type: 'text',
    sortable: true
},
{
    label: 'Type',
    fieldName: 'Type',
    type: 'text',
    sortable: true
},
{
    label: 'Annual Revenue',
    fieldName: 'AnnualRevenue',
    type: 'Currency',
    sortable: true
},
{
    label: 'Phone',
    fieldName: 'Phone',
    type: 'phone',
    sortable: true
},
{
    label: 'Website',
    fieldName: 'Website',
    type: 'url',
    sortable: true
},
{
    label: 'Rating',
    fieldName: 'Rating',
    type: 'test',
    sortable: true
}
];
 
// declare class to expose the component
export default class DataTableComponent extends LightningElement {
    columns = columns;

    @track error;
    @track accList ;
    @wire(getAccountList)
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            console.log('data=====>',data);
            this.accList = data;
        } else if (error) {
            this.error = error;
        }
    }
    












  
}