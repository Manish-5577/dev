import { LightningElement } from 'lwc';
import getchAccount from '@salesforce/apex/customlookup.getchAccount'
export default class CustomLookup extends LightningElement {

accountList;
  searchKey = '';
    handlechange(event)
    { 
        
         console.log('event test ',event)
          this.searchKey = event.target.value;
          // Don't search if input is less than 3 characters
        if (this.searchKey.length < 3) {
            this.accountList = [];
            return;
        }

        // Clear previous timeout
        clearTimeout(this.debounceTimeout);

        // Debounce: delay Apex call by 500ms after user stops typing
        this.debounceTimeout = setTimeout(() => {
            getchAccount({ searchkeyword: this.searchKey })
                .then((response) => {
                    console.log('response', response);
                    this.accountList = response;
                })
                .catch((error) => {
                    console.error('Apex Error:', error);
                });
        }, 500);
    }
    

}