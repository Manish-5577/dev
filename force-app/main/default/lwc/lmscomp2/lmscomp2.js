import { LightningElement,wire } from 'lwc';
import { subscribe, MessageContext,APPLICATION_SCOPE } from 'lightning/messageService';
import lmsfirst from '@salesforce/messageChannel/lmsfirst__c';
export default class Lmscomp2 extends LightningElement {


receivedmessage 
 @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                lmsfirst,
                (message) => this.handleMessage(message)
                // { scope: APPLICATION_SCOPE } 
            );
        }
    }

    handleMessage(message) {
        this.receivedmessage = message.input1fromComp1;
       // this.receivedId = message.recordId;
    }


}