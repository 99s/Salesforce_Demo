import { LightningElement } from 'lwc';
const BOOK_URL = 'https://www.googleapis.com/books/v1/volumes?q=';
export default class BookApp extends LightningElement {
    searchKey='spiderman';
    books;
    timer;
    connectedCallback(){
        this.fetchGoogleBookApiData(BOOK_URL);
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
         console.log(data)
         this.books = data
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
}