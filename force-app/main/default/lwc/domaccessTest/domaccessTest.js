import { LightningElement } from 'lwc';
export default class DomaccessTest extends LightningElement {




renderedCallback(){
    //code
    // Access div
const divEl = this.template.querySelector('[data-id="container"]');

// Access h1
const h1El = this.template.querySelector('[data-id="title"]');

console.log('line 15',divEl);
console.log('line 16',h1El.textContent);
// Access the div
const divE2 = document.querySelector('[data-id="container"]');

// Access the h1
const h1E2 = document.querySelector('[data-id="title"]');

// Examples
console.log('line 24',divE2);
//console.log('line 25',h1E2.textContent);

}
}