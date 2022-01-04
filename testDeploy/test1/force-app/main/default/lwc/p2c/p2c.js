/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-04-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement,
    track,
    wire,
    api
} from 'lwc';

export default class P2c extends LightningElement {
    @api message;
    @api number;
    @api isvalid;
    percentage = 14;
    showModal;
    msg;

    carosulData = [{
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
            header: "First Card",
            description: "First card description.",
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
            header: "Second Card",
            description: "Second card description.",
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
            header: "Third Card",
            description: "Third card description.",
        }
    ]
    changehandler(event) {
        this.percentage = event.target.value;
        console.log('percentage -------->' + this.percentage);
    }
    handleClick() {
        this.template.querySelector('c-p2c-slider-component').resetSlider();
    }
    clickHandler() {
        this.showModal = true;
    }
    closeHandler(event) {
        this.msg= event.detail.msg;
        console.log('msg------>'+this.msg);
        this.showModal = false;
    }
}