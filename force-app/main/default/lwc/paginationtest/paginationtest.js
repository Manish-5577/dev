import { LightningElement,track } from 'lwc';
import offsetApproach from '@salesforce/apex/pagination.offsetApproach';
const columns = [
    {label:'Id',fieldName:'Id'},
    {label:'Name',fieldName:'Name'}]
export default class Paginationtest extends LightningElement {

offset  = 0
limit = 10
@track data;
@track colum = columns;
connectedCallback()
{
      offsetApproach({offsets:this.offset,limits:this.limit}).then((res)=>{
        console.log('line 15')
        this.data = res;
      }
    ).catch((error)=>{
          console.log('erro occure line 18',error);
    })
}


}