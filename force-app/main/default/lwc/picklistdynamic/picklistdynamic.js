import { LightningElement } from 'lwc';
import picklisterapper from '@salesforce/apex/pagination.picklisterapper'
import testdate from '@salesforce/apex/pagination.testdate'
export default class Picklistdynamic extends LightningElement {

 picklistopt =[];
 value;
  connectedCallback() {
    
    picklisterapper().then((res)=>{
           console.log('line 10!!!!'+res);
           this.picklistopt = res;
    }).catch((error)=>{
        console.log('line 21 !!!!',error);
    })

  }
  handlechange(event)
  {
       console.log('.detaievent.target',event.target.value)
       console.log('line 20',JSON.stringify(event.target));
       testdate({dateinput:event.target.value}).then((res)=>{
            console.log('res==>'+res);
       }).catch((error)=>{
              console.log('error==>',error);
       });
  }

}