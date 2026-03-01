import { LightningElement,wire } from 'lwc';
import fieldlevelsecurity from '@salesforce/apex/fieldaccessibletest.fieldlevelsecurity'

const colmn =[
    {label: 'Id', fieldName : 'Id'},
    {label: 'Email', fieldName : 'Email'},
    {label: 'Phone', fieldName : 'Phone'},
    {label: 'Department', fieldName : 'Department'},
    {label: 'Level', fieldName : 'Level__c'}
]
export default class FieldlevelSecurity extends LightningElement {

conData
columnlist = colmn
@wire(fieldlevelsecurity,{})
getContList({data,error})
{
    if(data)
    {
        this.conData = data;
    }else{
        console.log('error==>',error);
    }
}
}