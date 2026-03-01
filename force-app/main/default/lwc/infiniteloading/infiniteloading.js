import { LightningElement } from 'lwc';
import getinfiniteoading from '@salesforce/apex/infinteloading.getinfiniteoading'
export default class Infiniteloading extends LightningElement {
column = [{label : 'Id', fieldName : 'Id'}]
caselist = [];
lastrecId = ''

connectedCallback() {
      getinfiniteoading({ caseId : this.lastrecId}).then((res)=>{
        this.caselist = res;
        this.lastrecId =  this.caselist[9];
      }).catch((error)=>{
        console.log('error', error);
      })
}
loadMoreData()
{
     this.lastrecId = '';  let sizearr = this.caselist.length;
     console.log('sizearr',sizearr);
  this.lastrecId =  (this.caselist).length > 0  ? this.caselist[sizearr -1 ].Id :''
     getinfiniteoading({ caseId : this.lastrecId}).then((res)=>{
        this.caselist = res;
      }).catch((error)=>{
        console.log('error', error);
      })
}

}