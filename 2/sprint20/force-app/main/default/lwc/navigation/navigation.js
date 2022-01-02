import {
    LightningElement,
    api,
} from 'lwc';
import {
    NavigationMixin
} from 'lightning/navigation';

export default class NavigationLinkExample extends NavigationMixin(LightningElement) {

    // url;

    // connectedCallback() {
    //     // Store the PageReference in a variable to use in handleClick.
    //     // This is a plain Javascript object that conforms to the
    //     // PageReference type by including 'type' and 'attributes' properties.
    //     // The 'state' property is optional.
    //     this.contactHomePageRef = {
    //         type: 'standard__objectPage',
    //         attributes: {
    //             objectApiName: 'Contact',
    //             actionName: 'home'
    //         }
    //     };
    //     this[NavigationMixin.GenerateUrl](this.contactHomePageRef)
    //         .then(url => this.url = url);
    // }

    // handleClick(evt) {
    //     // Stop the event's default behavior.
    //     // Stop the event from bubbling up in the DOM.
    //     evt.preventDefault();
    //     evt.stopPropagation();
    //     // Navigate to the Account Home page.
    //     this[NavigationMixin.Navigate](this.contactHomePageRef);
    // }
    // @api tabName;
    // @api label;

    // navigateNext() {
    //     this[NavigationMixin.Navigate]({
    //         type: 'standard__navItemPage',
    //         attributes: {
    //             apiName: this.tabName,
    //         }
    //     });
    // }


    navigateToObjectHome(){
            this[NavigationMixin.Navigation]({
                type:'standard__ObjectPage',
                attributes:{
                    objectApiName:'Case',
                    actionName:'home',
                }
            });





    }
    navigateToListView(){
        this[NavigationMixin.Navigation]({
            type:'standard__ObjectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'List',
            },
            state:{
                filterName:'Recent'
            }
        });


    }
    navigateToNewRecordPage() {
        // Opens the new Account record modal
        // to create an Account.
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            }
        });
    }
    navigateToRecordEditPage() {
        // Opens the Account record modal
        // to view a particular record.
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '001B000000ZBz22IAD',
                objectApiName: 'Account', // objectApiName is optional
                actionName: 'edit'
            }
        });
    }
    navigateToRelatedList() {
        // Navigate to the CaseComments related list page
        // for a specific Case record.
        this[NavigationMixin.Navigate]({
            type: 'standard__recordRelationshipPage',
            attributes: {
                recordId: '500xx000000Ykt4AAC',
                objectApiName: 'Case',
                relationshipApiName: 'CaseComments',
                actionName: 'view'
            }
        });
    }
    navigateToTabPage() {
        // Navigate to a specific CustomTab.
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                // CustomTabs from managed packages are identified by their
                // namespace prefix followed by two underscores followed by the
                // developer name. E.g. 'namespace__TabName'
                apiName: 'CustomTabName'
            }
        });
    }
    navigateToWebPage() {
        // Navigate to a URL
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'http://salesforce.com'
            }
        },
        true // Replaces the current page in your browser history with the URL
      );
    }



    }