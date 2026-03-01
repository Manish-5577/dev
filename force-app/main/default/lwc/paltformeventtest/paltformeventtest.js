import { LightningElement, track } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';
export default class Paltformeventtest extends LightningElement {
  channelName = '/event/platformeventtest__e';
    subscription = null;

    @track latestEvent;

    // computed properties
    get isSubscribed() {
        return this.subscription !== null;
    }

    get notSubscribed() {
        return this.subscription === null;
    }

    connectedCallback() {
        this.registerErrorListener();
    }

    handleSubscribe() {
        const messageCallback = (response) => {
            console.log('🔥 Event received:', response);
            this.latestEvent = JSON.stringify(response.data.payload, null, 2);
        };

        subscribe(this.channelName, -1, messageCallback)
            .then(response => {
                console.log('✔ Subscribed:', response);
                this.subscription = response;
            })
            .catch(error => {
                console.error('❌ Subscription error:', error);
            });
    }

    handleUnsubscribe() {
        if (!this.subscription) return;

        unsubscribe(this.subscription, response => {
            console.log('✔ Unsubscribed:', response);
            this.subscription = null;
            this.latestEvent = null;
        });
    }

    registerErrorListener() {
        onError(error => {
            console.error('⚠ EMP API Error:', JSON.stringify(error));
        });
    }

    disconnectedCallback() {
        if (this.subscription) {
            unsubscribe(this.subscription, () => {});
            this.subscription = null;
        }
    }
}