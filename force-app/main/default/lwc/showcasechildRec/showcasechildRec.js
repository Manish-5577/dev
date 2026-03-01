import { LightningElement,wire,track,api } from 'lwc';
import getchildRec from '@salesforce/apex/pagination.getchildRec'

const column = [
    {label:'Name', fieldName: 'Name'},
    {label: 'Email', fieldName: 'Email'}
]
export default class ShowcasechildRec extends LightningElement {
 nameid; 
@track columnss = column;
@track conlist
@api accIdss

// @wire(getchildRec, {accId : '$accIdss'})
// getconRec({data,error})
// {   this.conlist = []; console.log('api id', this.accIdss);
//      if(data)
// {console.log('data con rec',data)
//  this.conlist = data;
// }
// else if(error){
//      console.log('errror==>',error)
// } 
// }
connectedCallback() {
    console.log('line conected callback child comp')
}

    @api childmethodcallingApex(accidss)
{  getchildRec({accId : accidss}).then((res)=>{
       this.conlist = res;


         console.log('success!!!!!!')
}).catch((error)=>{
            console.log('error!!!!!!',error)
})

}



/*
 @api
    get accidss() {
        return this.nameid;
    }

    set accidss(value) {
        this.nameid = value;
        // run logic whenever parent updates 'name'
        console.log('Name was set to:', value);
       // this.doSomethingWithName();
    }*/




}