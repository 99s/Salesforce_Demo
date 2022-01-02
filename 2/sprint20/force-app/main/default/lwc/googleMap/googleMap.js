import { LightningElement,wire,track,api } from 'lwc';
import getOfficeLocation from "@salesforce/apex/displayMap.getOfficeLocation";


export default class GoogleMap extends LightningElement {
@api accountNameParam;
accountNameParam='Accenture';
@track error;
@track mapMarkers=[];
@track markersTitle='Accenture Technology';
@track zoomLevel=4;

@wire(getOfficeLocation,{accountNameInitial:'$accountNameParam'})
wiredOfficeLocation({error,data}){
    if(data){
        data.forEach(dataItem=>{
            this.mapMarkers=[...this.mapMarkers,
            {
               location:{
                   City:dataItem.BillingCity,
                   Country:dataItem.BillingCountry,
                   Street:dataItem.BillingStreet,
                   PostalCode:dataItem.BillingPostalCode,
                   State:dataItem.BillingState,

               },
               icon:'custom:custom26',
               title:dataItem.Name,

            }
            
            ];

        });
        this.error=undefined;
    }else if(error){
        this.error=error;
        this.contacts=undefined;
    }
}
// @track mapMarkers = [
//     {
//         location: {
//             // Location Information
//             City: 'San Francisco',
//             Country: 'USA',
//             PostalCode: '94105',
//             State: 'CA',
//             Street: '50 Fremont St',
//         },

//         // For onmarkerselect
//         value: 'SF1',

//         // Extra info for tile in list & info window
//         icon: 'standard:account',
//         title: 'Julies Kitchen', // e.g. Account.Name
//         description: 'This is a long description',
//     },
//     {
//         location: {
//             // Location Information
//             City: 'San Francisco',
//             Country: 'USA',
//             PostalCode: '94105',
//             State: 'CA',
//             Street: '30 Fremont St.',
//         },

//         // For onmarkerselect
//         value: 'SF2',

//         // Extra info for tile in list
//         icon: 'standard:account',
//         title: 'Tender Greens', // e.g. Account.Name
//     },
//     {
//         location: {
//             Street: '1000 5th Ave',
//             City: 'New York',
//             State: 'NY',
//         },

//         title: 'Museum of Fine Arts',
//         description:
//             'A grand setting for one of the greatest collections of art, from ancient to contemporary.',
//     },
// ];


}