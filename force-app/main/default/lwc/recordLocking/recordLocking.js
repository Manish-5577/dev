import { LightningElement,api } from 'lwc';
import test1 from '@salesforce/apex/recordLocking.test1'
export default class RecordLocking extends LightningElement {

     handleClick(){
            test1().then((res)=>{
                    console.log('line 7 record updated !!!!');
            }).catch(()=>{
                     console.log('error!!!! linre9')
            })
     }
}