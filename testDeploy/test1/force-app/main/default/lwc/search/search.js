/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-27-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
import {
    LightningElement
} from 'lwc';
import getRandomReceipe from "@salesforce/apex/spoonaCular.getRandomReceipe";
import getReceipeByIngradient from "@salesforce/apex/spoonaCular.getReceipeByIngradient";


export default class Search extends LightningElement {

    recipes = [];
    fetchRandomRecipe() {
        getRandomReceipe()
            .then((data) => {
                this.recipes =
                    JSON.parse(data) && JSON.parse(data).recipes ?
                    JSON.parse(data).recipes : [];
                console.log('getRandomRecipe---->' + JSON.stringify(data));
            })
            .catch((error) => {
                console.error(error);
            });
    }
    getReceipeByIngradient() {
        const ingredients = this.template.querySelector(".ingredient-input").value;
        getReceipeByIngradient({
                ingredients
            })
            .then((data) => {
                this.recipes = JSON.parse(data);
                console.log('getReceipeByIngradient---->' + JSON.stringify(data));
            })
            .catch((error) => {
                console.error(error);
            });
    }

}