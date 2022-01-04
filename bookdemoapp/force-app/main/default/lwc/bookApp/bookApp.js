import { LightningElement } from 'lwc';
import makeGetcallout from '@salesforce/apex/StripeCallout.makeGetcallout';
const BOOK_URL = 'https://www.googleapis.com/books/v1/volumes?q=';
export default class BookApp extends LightningElement {
    searchKey='spiderman';
    books;
    timer;
    isForSale = false;
    connectedCallback(){
        this.fetchGoogleBookApiData(BOOK_URL);
    }
   
   

    handleBuyBook() {
        console.log('--------- handleBuyBook --------------');
        makeGetcallout()
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                console.log(error);
            });
    }
    
    checkBookSaleability(bookdata){
        if(bookdata != null){
            //console.log('---------book Length --------------');
            //console.log(Object.keys(bookdata).length);
            //console.log(bookdata.length);
           bookdata.items.forEach((bookitem)=>{
               if(bookitem.saleInfo.saleability == 'FOR_SALE'){
                   bookitem.saleInfo.saleabilitybool = true;
               }
               else{
                   bookitem.saleInfo.saleabilitybool = false;
               }
           })
        }
        return bookdata;
    }


    fetchGoogleBookApiData(url){fetch(url+this.searchKey
    //     ,
    //      {
    //     method:'get',
    //     headers:{},
    //     body:''
    //  }
     ).then(response=>response.json())
     .then(data=>{
         console.log(data);
         console.log('---------book inint Length --------------');
         console.log(data.items.length);
         this.books = this.checkBookSaleability(data);
         console.log('------UPDATED DATA-------');
         console.log(this.books);
        })
     .catch(error=>console.error(error))}

     fetchBookHandler(event){
         this.searchKey = event.target.value;
         window.clearTimeout(this.timer);
         this.timer = setTimeout(()=>{
             this.fetchGoogleBookApiData(BOOK_URL)
         }, 1000
         )

     }

     //check if book is for sale 
     
}