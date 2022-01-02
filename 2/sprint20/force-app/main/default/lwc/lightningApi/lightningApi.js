import {
    LightningElement,
    api,
    track,
    wire
} from 'lwc';
import {
    getObjectInfo
} from 'lightning/uiObjectInfoApi';
//import ACCOUNT_OBJECT from '@salesforce/schema/Account';


// import CONTACT_OBJECT from '@salesforce/schema/Contact';
// import NAME_FIELD from '@salesforce/schema/Contact.Name';

export default class LightningApi extends LightningElement {

    // pageToken = null;
    // nextPageToken = null;
    // previousPageToken = null;
    // records;
    // error;

    // @wire(getListUi, {
    //     objectApiName: CONTACT_OBJECT,
    //     listViewApiName: 'All_Recipes_Contacts',
    //     sortBy: NAME_FIELD,
    //     pageSize: 10,
    //     pageToken: '$pageToken'
    // })listView({ error, data }) {
    //     if (data) {
    //         this.records = data.records.records;
    //         this.error = undefined;
    //         this.nextPageToken = data.records.nextPageToken;
    //         this.previousPageToken = data.records.previousPageToken;
    //     } else if (error) {
    //         this.error = error;
    //         thisbject.records = undefined;
    //     }
    // }

    // handleNextPage(e) {
    //     this.pageToken = this.nextPageToken;
    // }

    // handlePreviousPage(e) {
    //     this.pageToken = this.previousPageToken;
    // }
    // @wire(getListUi, {
    //     listViewId: '00BT0000001TONQMA4'
    // })
    // propertyOrFunction;
    @api objectApiName;
    @track objectInfo;
 
    @wire(getObjectInfo, {
        objectApiName: '$objectApiName'
    })
    objectInfo;
    get objectInfoStr() {
        return this.objectInfo ?
            JSON.stringify(this.objectInfo.data, null, 2) :
            '';
    }

     


}