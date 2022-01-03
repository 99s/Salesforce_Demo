import { LightningElement } from 'lwc';
const BOOK_URL = 'https://www.googleapis.com/books/v1/volumes?q=';
export default class BookApp extends LightningElement {
    searchKey='spiderman';
    books;
    connectedCallback(){
        this.fetchGoogleBookApiData(BOOK_URL);
    }
    fetchGoogleBookApiData(url){fetch(url+searchKey, {
        method:'post',
        headers:{},
        body:''
     }).then(response=>response.json())
     .then(data=>{
         console.log(data)
         this.books = data
        })
     .catch(error=>console.error(error))}
}