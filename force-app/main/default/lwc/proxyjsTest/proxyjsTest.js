import { LightningElement } from 'lwc';
export default class ProxyjsTest extends LightningElement {

testRawObject() {
    const obj = { name: 'Salesforce' };

    console.log(obj);
    console.log(obj.name);
    obj.name = 'Updated';
    console.log(obj.name);
}

renderedCallback() {
    const div = this.template.querySelector('div');
    console.log(div);
}

}