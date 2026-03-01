import { LightningElement } from 'lwc';
export default class TargetAndCurrentTarget extends LightningElement {


 handleClick(event) {
        console.log('target tag:', event.target.tagName);
        console.log('target data-name:', event.target.dataset.name);

        console.log('currentTarget tag:', event.currentTarget.tagName);
        console.log('currentTarget data-name:', event.currentTarget.dataset.name);
        console.log('-----------------------------');
    }
}