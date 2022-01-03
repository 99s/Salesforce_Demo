/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-07-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-07-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
 **/
import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';
import getCOVID19Summary from '@salesforce/apex/CovidManager.getCOVID19Summary';

export default class Covid19Cases extends LightningElement {


    @track columns = [{
            label: 'Country',
            fieldName: 'Country',
            type: 'text',
            sortable: true
        },
        {
            label: 'NewConfirmed',
            fieldName: 'NewConfirmed',
            type: 'text',
            sortable: true
        },
        {
            label: 'TotalConfirmed',
            fieldName: 'TotalConfirmed',
            type: 'text',
            sortable: true
        },
        {
            label: 'NewDeaths',
            fieldName: 'NewDeaths',
            type: 'text',
            sortable: true
        },
        {
            label: 'TotalDeaths',
            fieldName: 'TotalDeaths',
            type: 'text',
            sortable: true
        },
        {
            label: 'NewRecovered',
            fieldName: 'NewRecovered',
            type: 'text',
            sortable: true
        },
        {
            label: 'TotalRecovered',
            fieldName: 'TotalRecovered',
            type: 'text',
            sortable: true
        }
    ];

    @track error;
    @track accList;
    @wire(getCOVID19Summary)
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            console.log('data------>'+JSON.stringify(data));
            console.log('Required Length');
            console.log(Object.keys(data).length);
            console.log(Object.keys(data));
            this.accList = data;
        } else if (error) {
            this.error = error;
        }
    }

}