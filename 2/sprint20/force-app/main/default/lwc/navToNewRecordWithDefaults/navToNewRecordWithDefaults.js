import {
    LightningElement,api
} from 'lwc';
import {
    NavigationMixin
} from 'lightning/navigation';
import {
    encodeDefaultFieldValues
} from 'lightning/pageReferenceUtils';


export default class NavToNewRecordWithDefaults extends NavigationMixin(LightningElement) {
    // navigateToNewContactWithDefaults() {
    //     const defaultValues = encodeDefaultFieldValues({
    //         FirstName: 'tony ',
    //         LastName: 'stark',
    //         Phone:'9836996543',
    //         Department:'salesforce',
    //         Email:'koushikbose628@gmail.com',

    //         LeadSource: 'other',
    //     });

    //     console.log(defaultValues);

    //     this[NavigationMixin.Navigate]({
    //         type: 'standard__objectPage',
    //         attributes: {
    //             objectApiName: 'Contact',
    //             actionName: 'new'
    //         },
    //         state: {
    //             defaultFieldValues: defaultValues
    //         }
    //     });
    // }
    // url;
    // navigateToFiles() {
    //     this[NavigationMixin.Navigate]({
    //       type: 'standard__namedPage',
    //       attributes: {
              
    //           pageName: 'filePreview',
    //       },
    //       state : {
    //           recordIds: '069xx0000000001AAA,069xx000000000BAAQ',
    //           //selectedRecordId:'069xx0000000001AAA'
    //       }
    //     })
    //   }
    @api flexipageRegionWidth;








    }