import { LightningElement,api } from 'lwc';
import getrelatedcase from '@salesforce/apex/callApex.getrelatedcase';
const columns = [
    { label: 'CaseNumber', fieldName: 'CaseNumber', editable: false },
    { label: 'Status', fieldName: 'Status', editable: true },
    { label: 'ContactPhone', fieldName: 'ContactPhone', type: 'phone', editable: true },
    { label: 'AccountId', fieldName: 'AccountId', editable: true },
    { label: 'Contact', fieldName: 'ContactId',  editable: true },
];
export default class InlineEditingCase extends LightningElement {

caselist ;
@api  recordId;
columno = columns;

connectedCallback() {
     getrelatedcase({recordId:this.recordId}).then((response)=>{
        console.log('lalala',response)
        this.caselist = response;
        console.log('nsnnsnsns',response);
     }).catch((error)=>{
         console.log('22222error',error);
     })
}
    
}