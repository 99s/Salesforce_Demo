import {
    LightningElement
} from 'lwc';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
import {
    getBarcodeScanner
} from 'lightning/mobileCapabilities';

export default class BarCodeScanner extends LightningElement {

    myScanner;
    scanButtonDisable = false;
    scannedBarcode = '';

    connectedCallback() {
        this.myScanner = getBarcodeScanner();
        if (this.myScanner == null || !this.myScanner.isAvailable()) {
            this.scanButtonDisable = true;



        }
    }
    handleBeginClick(event) {
        this.scannedBarcode = '';
        if (this.myScanner != null & this.myScanner.isAvailable()) {
             const scanningOptions={
                 barcodeTypes:[this.myScanner.barcodeType.QR]
             };
             this.myScanner
                 .beginCapture(scanningOptions)
                 .then((result)=>{
                     console.log(result);
                     this.scannedBarcode = decodeURIComponent(result.value);
                     this.dispatchEvent(
                         new ShowToastEvent({
                             title: 'Successful Scan',
                             message: 'Barcode scanned successfully.',
                             variant: 'success'
                         })
                     );
                 })
                 .catch((error) => {
                     console.error(error);
                     this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Barcode Scanner Error',
                            message:
                                'There was a problem scanning the barcode: ' +
                                JSON.stringify(error) +
                                ' Please try again.',
                            variant: 'error',
                            mode: 'sticky'
                        })
                    );
                })
                .finally(() => {
                    console.log('#finally');

                    // Clean up by ending capture,
                    // whether we completed successfully or had an error
                    this.myScanner.endCapture();
                });
        } else {
            // BarcodeScanner is not available
            // Not running on hardware with a camera, or some other context issue
            console.log(
                'Scan Barcode button should be disabled and unclickable.'
            );
            console.log('Somehow it got clicked: ');
            console.log(event);

            // Let user know they need to use a mobile phone with a camera
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Barcode Scanner Is Not Available',
                    message:
                        'Try again from the Salesforce app on a mobile device.',
                    variant: 'error'
                })
            );
        }
    }
}