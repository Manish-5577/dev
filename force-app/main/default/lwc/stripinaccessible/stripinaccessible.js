import { LightningElement } from 'lwc';
import testt1 from '@salesforce/apex/fieldaccessibletest.testt1'
export default class Stripinaccessible extends LightningElement {



handleupdate()
{
testt1().then((response)=>{
   console.log('line 10',response)
}).catch((error)=>{
   console.log('line 12',error)
})
}
}