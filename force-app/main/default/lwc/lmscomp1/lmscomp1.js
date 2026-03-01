import { LightningElement,wire } from 'lwc';
import {publish,MessageContext}  from 'lightning/messageService'
import lmsfirst from '@salesforce/messageChannel/lmsfirst__c';
export default class Lmscomp1 extends LightningElement {

 @wire(MessageContext)
    messageContext;

mssg1publish;
handlechange(event)
{  this.mssg1publish = event.target.value;
   this.publishMessage();
}
 publishMessage() {
        const payload = {
            input1fromComp1: this.mssg1publish,
        };
        publish(this.messageContext, lmsfirst, payload);
         console.log('line 19')
    }

}