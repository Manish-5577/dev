import { LightningElement,api } from 'lwc';
export default class Demo extends LightningElement {

@api testing;
connectedCallback() {
console.log('lwc dynamically called!!!!')
}
}