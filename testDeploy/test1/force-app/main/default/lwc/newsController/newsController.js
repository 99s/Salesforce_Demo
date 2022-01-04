import {
    LightningElement,
    track
} from 'lwc';
import retriveNews from '@salesforce/apex/newsController.retriveNews';

export default class NewsController extends LightningElement {
    @track result = []
    @track selectedNews = {};
    @track isModalOpen = false;
    get modalClass() {
        return `slds-modal ${this.isModalOpen ? "slds-fade-in-open" :""}`
    }
    get modalBackdropClass() {
        return this.isModalOpen ? "slds-backdrop slds-backdrop_open" : "slds-backdrop"
    }
    connectedCallback() {
        this.fetchNews();
    }
    fetchNews() {
        retriveNews().then(response => {
            console.log('response---------->' + JSON.stringify(response));
            this.formatNewsData(response.articles)
        }).catch(error => {
            console.error(error);
        })
    }
    formatNewsData(res) {
        this.result = res.map((item, index) => {
            let id = `new_${index+1}`;
            let date = new Date(item.publishedAt).toDateString()
            let name = item.source.name;
            return {
                ...item,
                id: id,
                name: name,
                date: date
            }
        })

    }
    showModal(event) {
        let id = event.target.dataset.item;
        this.result.forEach(item => {
            if (item.id === id) {
                this.selectedNews = {
                    ...item
                }
            }
        })
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    /*
    {
        "status": "ok",
        "totalResults": 70,
        "articles": [
          {
            "source": {
              "id": null,
              "name": "Yahoo Entertainment"
            },
            "author": "Joanna Ossinger",
            "title": "Bitcoin Surges Amid Short Covering, Speculation Over Amazon Plan - Yahoo Finance",
            "description": "(Bloomberg) -- Bitcoin soared on Monday to approach $40,000, a rally some attributed to traders exiting bets on declines as well as ongoing speculation over ...",
            "url": "https://finance.yahoo.com/news/bitcoin-surges-amid-short-covering-031129556.html",
            "urlToImage": "https://s.yimg.com/uu/api/res/1.2/MHFh03X2UQRuUGiE9tVWUA--~B/aD0xMzM0O3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/en/bloomberg_markets_842/caeab58468ad7b22eccbb02ee9956a7c",
            "publishedAt": "2021-07-26T03:16:53Z",
            "content": "(Bloomberg) -- Bitcoin soared on Monday to approach $40,000, a rally some attributed to traders exiting bets on declines as well as ongoing speculation over Amazon.com Inc.s potential involvement in … [+1990 chars]"
          },
          */

}