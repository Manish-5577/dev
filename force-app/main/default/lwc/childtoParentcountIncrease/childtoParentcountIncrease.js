import { LightningElement,track } from 'lwc';
export default class ChildtoParentcountIncrease extends LightningElement {


@track  arryitem =[
    {id : 1, name : 'one', count : 1},
    {id : 2, name : 'two', count : 1},
    {id : 3, name : 'three',count : 1},
    {id : 4, name : 'four', count : 1}
]
passbackgrdid

handlecount(event)
{console.log('line 13 event',event);
  let result = this.arryitem.find(arr => arr.id === event.detail);
console.log('result',result);
 if(result != null)
 {
     result.count += 1;
 }
 this.passbackgrdid = event.detail;
}
}